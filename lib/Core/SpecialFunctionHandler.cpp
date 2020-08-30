//===-- SpecialFunctionHandler.cpp ----------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "Memory.h"
#include "SpecialFunctionHandler.h"
#include "TimingSolver.h"
#include "klee/MergeHandler.h"

#include "klee/ExecutionState.h"
#include "klee/util/ExprPPrinter.h"

#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"
#include "klee/Internal/Support/Debug.h"
#include "klee/Internal/Support/ErrorHandling.h"

#include "Executor.h"
#include "MemoryManager.h"
/* SYSREL extension */
#include "StatsTracker.h"
/* SYSREL extension */
#include "klee/CommandLine.h"

#include "llvm/IR/Module.h"
#include "llvm/ADT/Twine.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/CallSite.h"
#include "llvm/IR/TypeFinder.h"
#include "llvm/IR/LLVMContext.h"

#include <errno.h>
#include <sstream>
#include <fstream>
using namespace llvm;
using namespace klee;

std::map<ref<Expr>, std::set<ref<Expr> > > globalMetadataSetMap;
std::map<long, std::map<ref<Expr>, std::set<ref<Expr> > > > localMetadataSetMap;
std::set<std::pair<long,long> > globalMetadataSetsToBeChecked;
std::map<long, std::set<std::pair<long,long> > > localMetadataSetsToBeChecked;
std::map<std::pair<long,long>, std::string > globalMetadataMessage;
std::map<long, std::map<std::pair<long,long>, std::string> > localMetadataMessage;
std::map<ref<Expr>, std::pair<ref<Expr>,ref<Expr> > > globalRecordMetadataMap;
std::map<long, std::map<ref<Expr>, std::pair<ref<Expr>,ref<Expr> > > > localRecordMetadataMap;
std::map<ref<Expr>, std::string> globalMetadataConditionMessage;
std::map<long, std::map<ref<Expr>, std::string> > localMetadataConditionMessage;

extern void recordMemObj(ExecutionState &state, const MemoryObject *mo);

namespace {
  cl::opt<bool>
  ReadablePosix("readable-posix-inputs",
            cl::init(false),
            cl::desc("Prefer creation of POSIX inputs (command-line arguments, files, etc.) with human readable bytes. "
                     "Note: option is expensive when creating lots of tests (default=false)"));

  cl::opt<bool>
  SilentKleeAssume("silent-klee-assume",
                   cl::init(false),
                   cl::desc("Silently terminate paths with an infeasible "
                            "condition given to klee_assume() rather than "
                            "emitting an error (default=false)"));
}


/* SYSREL EXTENSION */
 typedef std::pair<ExecutionState*,ExecutionState*> StatePair;
std::set<std::string> assemblyFunctions;
 typedef std::pair<ExecutionState*,ExecutionState*> StatePair;
extern Interpreter *theInterpreter;
extern const Module * moduleHandle;
extern KModule *kmoduleExt;
extern std::string getTypeName(llvm::Type*);
extern bool isLazyInit(Type *t, bool &single, int &count);
extern bool isAllocTypeLazyInit(Type *t, bool &single, int &count) ;
extern int primArraySize;
extern void addSingleOrDerivative(ExecutionState &state, ref<Expr> address);

inline std::string& ltrim(std::string& s, const char* t = " \t\n\r\f\v")
{
    s.erase(0, s.find_first_not_of(t));
    return s;
}

// trim from right
inline std::string& rtrim(std::string& s, const char* t = " \t\n\r\f\v")
{
    s.erase(s.find_last_not_of(t) + 1);
    return s;
}

AllocAPIHandler *APIHandler::allocAPIHandler = NULL;
FreeAPIHandler *APIHandler::freeAPIHandler = NULL;
IgnoreAPIHandler *APIHandler::ignoreAPIHandler = NULL;
SideEffectAPIHandler *APIHandler::sideEffectAPIHandler = NULL;
ReturnAPIHandler *APIHandler::returnAPIHandler = NULL;
RefCountAPIHandler *APIHandler::refcountAPIHandler = NULL;
CallbackAPIHandler *APIHandler::callbackAPIHandler = NULL;
TerminateAPIHandler *APIHandler::terminateAPIHandler = NULL;
std::map<std::string, std::set<APIAction*>> APIHandler::apiModel;
std::map<std::string, APIAction*> APIHandler::symbolTable;
/* SYSREL EXTENSION */

/// \todo Almost all of the demands in this file should be replaced
/// with terminateState calls.

///



// FIXME: We are more or less committed to requiring an intrinsic
// library these days. We can move some of this stuff there,
// especially things like realloc which have complicated semantics
// w.r.t. forking. Among other things this makes delayed query
// dispatch easier to implement.
static SpecialFunctionHandler::HandlerInfo handlerInfo[] = {
#define add(name, handler, ret) { name, \
                                  &SpecialFunctionHandler::handler, \
                                  false, ret, false }
#define addDNR(name, handler) { name, \
                                &SpecialFunctionHandler::handler, \
                                true, false, false }
  addDNR("__assert_rtn", handleAssertFail),
  addDNR("__assert_fail", handleAssertFail),
  addDNR("_assert", handleAssert),
  addDNR("abort", handleAbort),
  addDNR("_exit", handleExit),
  { "exit", &SpecialFunctionHandler::handleExit, true, false, true },
  addDNR("klee_abort", handleAbort),
  addDNR("klee_silent_exit", handleSilentExit),
  addDNR("klee_report_error", handleReportError),
  add("calloc", handleCalloc, true),
  add("free", handleFree, false),
  add("klee_assume", handleAssume, false),
  add("klee_check_memory_access", handleCheckMemoryAccess, false),
  add("klee_get_valuef", handleGetValue, true),
  add("klee_get_valued", handleGetValue, true),
  add("klee_get_valuel", handleGetValue, true),
  add("klee_get_valuell", handleGetValue, true),
  add("klee_get_value_i32", handleGetValue, true),
  add("klee_get_value_i64", handleGetValue, true),
  add("klee_define_fixed_object", handleDefineFixedObject, false),
  add("klee_get_obj_size", handleGetObjSize, true),
  add("klee_get_errno", handleGetErrno, true),
#ifndef __APPLE__
  add("__errno_location", handleErrnoLocation, true),
#else
  add("__error", handleErrnoLocation, true),
#endif
  add("klee_is_symbolic", handleIsSymbolic, true),
  add("klee_make_symbolic", handleMakeSymbolic, false),
  add("klee_mark_global", handleMarkGlobal, false),
  add("klee_open_merge", handleOpenMerge, false),
  add("klee_close_merge", handleCloseMerge, false),
  add("klee_prefer_cex", handlePreferCex, false),
  add("klee_posix_prefer_cex", handlePosixPreferCex, false),
  add("klee_print_expr", handlePrintExpr, false),
  add("klee_print_range", handlePrintRange, false),
  add("klee_set_forking", handleSetForking, false),
  add("klee_stack_trace", handleStackTrace, false),
  add("klee_warning", handleWarning, false),
  add("klee_warning_once", handleWarningOnce, false),
  add("klee_alias_function", handleAliasFunction, false),
  add("malloc", handleMalloc, true),
  add("realloc", handleRealloc, true),

  /* SYSREL EXTENSION */
  add("klee_set_metadata", handleSetMetadata, false),
  add("klee_get_metadata", handleGetMetadata, true),
  add("klee_add_metadata_globally", handleAddMetadataGlobally, false),
  add("klee_add_metadata_locally", handleAddMetadataLocally, false),
  add("klee_add_metadata_globally_on_condition", handleAddMetadataGloballyOnCondition, false),
  add("klee_add_metadata_locally_on_condition", handleAddMetadataLocallyOnCondition, false),
  add("klee_record_metadata_globally_on_condition", handleRecordMetadataGloballyOnCondition, false),
  add("klee_record_metadata_locally_on_condition", handleRecordMetadataLocallyOnCondition, false),
  add("klee_diff_and_check_metadata_globally", handleReportDiffMetadataGlobally, true),
  add("klee_diff_and_check_metadata_locally", handleReportDiffMetadataLocally, true),
  add("klee_check_metadata_membership_globally", handleCheckMetadataMembershipGlobally, true),
  add("klee_check_metadata_membership_locally", handleCheckMetadataMembershipLocally, true),
  /* SYSREL EXTENSION */

  // operator delete[](void*)
  add("_ZdaPv", handleDeleteArray, false),
  // operator delete(void*)
  add("_ZdlPv", handleDelete, false),

  // operator new[](unsigned int)
  add("_Znaj", handleNewArray, true),
  // operator new(unsigned int)
  add("_Znwj", handleNew, true),

  // FIXME-64: This is wrong for 64-bit long...

  // operator new[](unsigned long)
  add("_Znam", handleNewArray, true),
  // operator new(unsigned long)
  add("_Znwm", handleNew, true),

  // Run clang with -fsanitize=signed-integer-overflow and/or
  // -fsanitize=unsigned-integer-overflow
  add("__ubsan_handle_add_overflow", handleAddOverflow, false),
  add("__ubsan_handle_sub_overflow", handleSubOverflow, false),
  add("__ubsan_handle_mul_overflow", handleMulOverflow, false),
  add("__ubsan_handle_divrem_overflow", handleDivRemOverflow, false),

#undef addDNR
#undef add
};

SpecialFunctionHandler::const_iterator SpecialFunctionHandler::begin() {
  return SpecialFunctionHandler::const_iterator(handlerInfo);
}

SpecialFunctionHandler::const_iterator SpecialFunctionHandler::end() {
  // NULL pointer is sentinel
  return SpecialFunctionHandler::const_iterator(0);
}

SpecialFunctionHandler::const_iterator& SpecialFunctionHandler::const_iterator::operator++() {
  ++index;
  if ( index >= SpecialFunctionHandler::size())
  {
    // Out of range, return .end()
    base=0; // Sentinel
    index=0;
  }

  return *this;
}

int SpecialFunctionHandler::size() {
	return sizeof(handlerInfo)/sizeof(handlerInfo[0]);
}

SpecialFunctionHandler::SpecialFunctionHandler(Executor &_executor) 
  : executor(_executor) {}


void SpecialFunctionHandler::prepare() {
  unsigned N = size();

  for (unsigned i=0; i<N; ++i) {
    HandlerInfo &hi = handlerInfo[i];
    Function *f = executor.kmodule->module->getFunction(hi.name);
    
    // No need to create if the function doesn't exist, since it cannot
    // be called in that case.
  
    if (f && (!hi.doNotOverride || f->isDeclaration())) {
      // Make sure NoReturn attribute is set, for optimization and
      // coverage counting.
      if (hi.doesNotReturn)
        f->addFnAttr(Attribute::NoReturn);

      // Change to a declaration since we handle internally (simplifies
      // module and allows deleting dead code).
      if (!f->isDeclaration())
        f->deleteBody();
    }
  }
}

void SpecialFunctionHandler::bind() {
  unsigned N = sizeof(handlerInfo)/sizeof(handlerInfo[0]);

  for (unsigned i=0; i<N; ++i) {
    HandlerInfo &hi = handlerInfo[i];
    Function *f = executor.kmodule->module->getFunction(hi.name);
    
    if (f && (!hi.doNotOverride || f->isDeclaration()))
      handlers[f] = std::make_pair(hi.handler, hi.hasReturnValue);
  }
}


bool SpecialFunctionHandler::handle(ExecutionState &state, 
                                    Function *f,
                                    KInstruction *target,
                                    std::vector< ref<Expr> > &arguments) {
  handlers_ty::iterator it = handlers.find(f);
  if (it != handlers.end()) {    
    Handler h = it->second.first;
    bool hasReturnValue = it->second.second;
     // FIXME: Check this... add test?
    if (!hasReturnValue && !target->inst->use_empty()) {
      executor.terminateStateOnExecError(state, 
                                         "expected return value from void special function");
    } else {
      (this->*h)(state, target, arguments);
    }
    return true;
  } else {
    return false;
  }
}

/****/

// reads a concrete string from memory
std::string 
SpecialFunctionHandler::readStringAtAddress(ExecutionState &state, 
                                            ref<Expr> addressExpr) {
  ObjectPair op;
  addressExpr = executor.toUnique(state, addressExpr);
  if (!isa<ConstantExpr>(addressExpr)) {
    executor.terminateStateOnError(
        state, "Symbolic string pointer passed to one of the klee_ functions",
        Executor::TerminateReason::User);
    return "";
  }
  ref<ConstantExpr> address = cast<ConstantExpr>(addressExpr);
  if (!state.addressSpace.resolveOne(address, op)) {
    executor.terminateStateOnError(
        state, "Invalid string pointer passed to one of the klee_ functions",
        Executor::TerminateReason::User);
    return "";
  }
  bool res __attribute__ ((unused));
  assert(executor.solver->mustBeTrue(state, 
                                     EqExpr::create(address, 
                                                    op.first->getBaseExpr()),
                                     res) &&
         res &&
         "XXX interior pointer unhandled");
  const MemoryObject *mo = op.first;
  const ObjectState *os = op.second;

  char *buf = new char[mo->size];

  unsigned i;
  for (i = 0; i < mo->size - 1; i++) {
    ref<Expr> cur = os->read8(i);
    cur = executor.toUnique(state, cur);
    assert(isa<ConstantExpr>(cur) && 
           "hit symbolic char while reading concrete string");
    buf[i] = cast<ConstantExpr>(cur)->getZExtValue(8);
  }
  buf[i] = 0;
  
  std::string result(buf);
  delete[] buf;
  return result;
}

/****/

void SpecialFunctionHandler::handleAbort(ExecutionState &state,
                           KInstruction *target,
                           std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==0 && "invalid number of arguments to abort");
  executor.terminateStateOnError(state, "abort failure", Executor::Abort);
}

void SpecialFunctionHandler::handleExit(ExecutionState &state,
                           KInstruction *target,
                           std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 && "invalid number of arguments to exit");
  executor.terminateStateOnExit(state);
}

void SpecialFunctionHandler::handleSilentExit(ExecutionState &state,
                                              KInstruction *target,
                                              std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 && "invalid number of arguments to exit");
  executor.terminateState(state);
}

void SpecialFunctionHandler::handleAliasFunction(ExecutionState &state,
						 KInstruction *target,
						 std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==2 && 
         "invalid number of arguments to klee_alias_function");
  std::string old_fn = readStringAtAddress(state, arguments[0]);
  std::string new_fn = readStringAtAddress(state, arguments[1]);
  KLEE_DEBUG_WITH_TYPE("alias_handling", llvm::errs() << "Replacing " << old_fn
                                           << "() with " << new_fn << "()\n");
  if (old_fn == new_fn)
    state.removeFnAlias(old_fn);
  else state.addFnAlias(old_fn, new_fn);
}

void SpecialFunctionHandler::handleAssert(ExecutionState &state,
                                          KInstruction *target,
                                          std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==3 && "invalid number of arguments to _assert");  
  executor.terminateStateOnError(state,
				 "ASSERTION FAIL: " + readStringAtAddress(state, arguments[0]),
				 Executor::Assert);
}

void SpecialFunctionHandler::handleAssertFail(ExecutionState &state,
                                              KInstruction *target,
                                              std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==4 && "invalid number of arguments to __assert_fail");
  executor.terminateStateOnError(state,
				 "ASSERTION FAIL: " + readStringAtAddress(state, arguments[0]),
				 Executor::Assert);
}

void SpecialFunctionHandler::handleReportError(ExecutionState &state,
                                               KInstruction *target,
                                               std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==4 && "invalid number of arguments to klee_report_error");
  
  // arguments[0], arguments[1] are file, line
  executor.terminateStateOnError(state,
				 readStringAtAddress(state, arguments[2]),
				 Executor::ReportError,
				 readStringAtAddress(state, arguments[3]).c_str());
}

void SpecialFunctionHandler::handleOpenMerge(ExecutionState &state,
    KInstruction *target,
    std::vector<ref<Expr> > &arguments) {
  if (!UseMerge) {
    klee_warning_once(0, "klee_open_merge ignored, use '-use-merge'");
    return;
  }

  state.openMergeStack.push_back(
      ref<MergeHandler>(new MergeHandler(&executor, &state)));

  if (DebugLogMerge)
    llvm::errs() << "open merge: " << &state << "\n";
}

void SpecialFunctionHandler::handleCloseMerge(ExecutionState &state,
    KInstruction *target,
    std::vector<ref<Expr> > &arguments) {
  if (!UseMerge) {
    klee_warning_once(0, "klee_close_merge ignored, use '-use-merge'");
    return;
  }
  Instruction *i = target->inst;

  if (DebugLogMerge)
    llvm::errs() << "close merge: " << &state << " at " << i << '\n';

  if (state.openMergeStack.empty()) {
    std::ostringstream warning;
    warning << &state << " ran into a close at " << i << " without a preceding open";
    klee_warning("%s", warning.str().c_str());
  } else {
    executor.inCloseMerge.insert(&state);
    state.openMergeStack.back()->addClosedState(&state, i);
    state.openMergeStack.pop_back();
  }
}

void SpecialFunctionHandler::handleNew(ExecutionState &state,
                         KInstruction *target,
                         std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  assert(arguments.size()==1 && "invalid number of arguments to new");

  executor.executeAlloc(state, arguments[0], false, target);
}

void SpecialFunctionHandler::handleDelete(ExecutionState &state,
                            KInstruction *target,
                            std::vector<ref<Expr> > &arguments) {
  // FIXME: Should check proper pairing with allocation type (malloc/free,
  // new/delete, new[]/delete[]).

  // XXX should type check args
  assert(arguments.size()==1 && "invalid number of arguments to delete");
  executor.executeFree(state, arguments[0]);
}

void SpecialFunctionHandler::handleNewArray(ExecutionState &state,
                              KInstruction *target,
                              std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  assert(arguments.size()==1 && "invalid number of arguments to new[]");
  executor.executeAlloc(state, arguments[0], false, target);
}

void SpecialFunctionHandler::handleDeleteArray(ExecutionState &state,
                                 KInstruction *target,
                                 std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  assert(arguments.size()==1 && "invalid number of arguments to delete[]");
  executor.executeFree(state, arguments[0]);
}

void SpecialFunctionHandler::handleMalloc(ExecutionState &state,
                                  KInstruction *target,
                                  std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  /* SYSREL EXTENSION */
  // we need this to handle kmalloc and kzalloc via malloc
  assert(arguments.size()>=1 && "invalid number of arguments to malloc");
  //assert(arguments.size()==1 && "invalid number of arguments to malloc");
  llvm::outs() << "argument to malloc: " << arguments[0] << "\n";
  /* SYSREL EXTENSION */
  executor.executeAlloc(state, arguments[0], false, target, false, true);
}

void SpecialFunctionHandler::handleAssume(ExecutionState &state,
                            KInstruction *target,
                            std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 && "invalid number of arguments to klee_assume");
  
  ref<Expr> e = arguments[0];
  
  if (e->getWidth() != Expr::Bool)
    e = NeExpr::create(e, ConstantExpr::create(0, e->getWidth()));
  
  bool res;
  bool success __attribute__ ((unused)) = executor.solver->mustBeFalse(state, e, res);
  assert(success && "FIXME: Unhandled solver failure");
  if (res) {
    if (SilentKleeAssume) {
      executor.terminateState(state);
    } else {
      executor.terminateStateOnError(state,
                                     "invalid klee_assume call (provably false)",
                                     Executor::User);
    }
  } else {
    executor.addConstraint(state, e);
  }
}

void SpecialFunctionHandler::handleIsSymbolic(ExecutionState &state,
                                KInstruction *target,
                                std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 && "invalid number of arguments to klee_is_symbolic");

  executor.bindLocal(target, state, 
                     ConstantExpr::create(!isa<ConstantExpr>(arguments[0]),
                                          Expr::Int32));
}

void SpecialFunctionHandler::handlePreferCex(ExecutionState &state,
                                             KInstruction *target,
                                             std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==2 &&
         "invalid number of arguments to klee_prefex_cex");

  ref<Expr> cond = arguments[1];
  if (cond->getWidth() != Expr::Bool)
    cond = NeExpr::create(cond, ConstantExpr::alloc(0, cond->getWidth()));

  Executor::ExactResolutionList rl;
  executor.resolveExact(state, arguments[0], rl, "prefex_cex");
  
  assert(rl.size() == 1 &&
         "prefer_cex target must resolve to precisely one object");

  rl[0].first.first->cexPreferences.push_back(cond);
}

void SpecialFunctionHandler::handlePosixPreferCex(ExecutionState &state,
                                             KInstruction *target,
                                             std::vector<ref<Expr> > &arguments) {
  if (ReadablePosix)
    return handlePreferCex(state, target, arguments);
}

void SpecialFunctionHandler::handlePrintExpr(ExecutionState &state,
                                  KInstruction *target,
                                  std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==2 &&
         "invalid number of arguments to klee_print_expr");

  std::string msg_str = readStringAtAddress(state, arguments[0]);
  llvm::errs() << msg_str << ":" << arguments[1] << "\n";
}

void SpecialFunctionHandler::handleSetForking(ExecutionState &state,
                                              KInstruction *target,
                                              std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 &&
         "invalid number of arguments to klee_set_forking");
  ref<Expr> value = executor.toUnique(state, arguments[0]);
  
  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(value)) {
    state.forkDisabled = CE->isZero();
  } else {
    executor.terminateStateOnError(state, 
                                   "klee_set_forking requires a constant arg",
                                   Executor::User);
  }
}

void SpecialFunctionHandler::handleStackTrace(ExecutionState &state,
                                              KInstruction *target,
                                              std::vector<ref<Expr> > &arguments) {
  state.dumpStack(outs());
}

void SpecialFunctionHandler::handleWarning(ExecutionState &state,
                                           KInstruction *target,
                                           std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 && "invalid number of arguments to klee_warning");

  std::string msg_str = readStringAtAddress(state, arguments[0]);
  klee_warning("%s: %s", state.stack.back().kf->function->getName().data(), 
               msg_str.c_str());
}

void SpecialFunctionHandler::handleWarningOnce(ExecutionState &state,
                                               KInstruction *target,
                                               std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 &&
         "invalid number of arguments to klee_warning_once");

  std::string msg_str = readStringAtAddress(state, arguments[0]);
  klee_warning_once(0, "%s: %s", state.stack.back().kf->function->getName().data(),
                    msg_str.c_str());
}

void SpecialFunctionHandler::handlePrintRange(ExecutionState &state,
                                  KInstruction *target,
                                  std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==2 &&
         "invalid number of arguments to klee_print_range");

  std::string msg_str = readStringAtAddress(state, arguments[0]);
  llvm::errs() << msg_str << ":" << arguments[1];
  if (!isa<ConstantExpr>(arguments[1])) {
    // FIXME: Pull into a unique value method?
    ref<ConstantExpr> value;
    bool success __attribute__ ((unused)) = executor.solver->getValue(state, arguments[1], value);
    assert(success && "FIXME: Unhandled solver failure");
    bool res;
    success = executor.solver->mustBeTrue(state, 
                                          EqExpr::create(arguments[1], value), 
                                          res);
    assert(success && "FIXME: Unhandled solver failure");
    if (res) {
      llvm::errs() << " == " << value;
    } else { 
      llvm::errs() << " ~= " << value;
      std::pair< ref<Expr>, ref<Expr> > res =
        executor.solver->getRange(state, arguments[1]);
      llvm::errs() << " (in [" << res.first << ", " << res.second <<"])";
    }
  }
  llvm::errs() << "\n";
}

void SpecialFunctionHandler::handleGetObjSize(ExecutionState &state,
                                  KInstruction *target,
                                  std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  assert(arguments.size()==1 &&
         "invalid number of arguments to klee_get_obj_size");
  Executor::ExactResolutionList rl;
  executor.resolveExact(state, arguments[0], rl, "klee_get_obj_size");
  for (Executor::ExactResolutionList::iterator it = rl.begin(), 
         ie = rl.end(); it != ie; ++it) {
    executor.bindLocal(
        target, *it->second,
        ConstantExpr::create(it->first.first->size,
                             executor.kmodule->targetData->getTypeSizeInBits(
                                 target->inst->getType())));
  }
}

void SpecialFunctionHandler::handleGetErrno(ExecutionState &state,
                                            KInstruction *target,
                                            std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  assert(arguments.size()==0 &&
         "invalid number of arguments to klee_get_errno");
#ifndef WINDOWS
  int *errno_addr = executor.getErrnoLocation(state);
#else
  int *errno_addr = nullptr;
#endif

  // Retrieve the memory object of the errno variable
  ObjectPair result;
  bool resolved = state.addressSpace.resolveOne(
      ConstantExpr::create((uint64_t)errno_addr, Expr::Int64), result);
  if (!resolved)
    executor.terminateStateOnError(state, "Could not resolve address for errno",
                                   Executor::User);
  executor.bindLocal(target, state, result.second->read(0, Expr::Int32));
}

void SpecialFunctionHandler::handleErrnoLocation(
    ExecutionState &state, KInstruction *target,
    std::vector<ref<Expr> > &arguments) {
  // Returns the address of the errno variable
  assert(arguments.size() == 0 &&
         "invalid number of arguments to __errno_location/__error");

#ifndef WINDOWS
  int *errno_addr = executor.getErrnoLocation(state);
#else
  int *errno_addr = nullptr;
#endif

  executor.bindLocal(
      target, state,
      ConstantExpr::create((uint64_t)errno_addr,
                           executor.kmodule->targetData->getTypeSizeInBits(
                               target->inst->getType())));
}
void SpecialFunctionHandler::handleCalloc(ExecutionState &state,
                            KInstruction *target,
                            std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  assert(arguments.size()==2 &&
         "invalid number of arguments to calloc");

  ref<Expr> size = MulExpr::create(arguments[0],
                                   arguments[1]);
  executor.executeAlloc(state, size, false, target, true, true);
}

void SpecialFunctionHandler::handleRealloc(ExecutionState &state,
                            KInstruction *target,
                            std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  assert(arguments.size()==2 &&
         "invalid number of arguments to realloc");
  ref<Expr> address = arguments[0];
  ref<Expr> size = arguments[1];

  Executor::StatePair zeroSize = executor.fork(state, 
                                               Expr::createIsZero(size), 
                                               true);
  
  if (zeroSize.first) { // size == 0
    executor.executeFree(*zeroSize.first, address, target);   
  }
  if (zeroSize.second) { // size != 0
    Executor::StatePair zeroPointer = executor.fork(*zeroSize.second, 
                                                    Expr::createIsZero(address), 
                                                    true);
    
    if (zeroPointer.first) { // address == 0
      executor.executeAlloc(*zeroPointer.first, size, false, target, false, true);
    } 
    if (zeroPointer.second) { // address != 0
      Executor::ExactResolutionList rl;
      executor.resolveExact(*zeroPointer.second, address, rl, "realloc");
      
      for (Executor::ExactResolutionList::iterator it = rl.begin(), 
             ie = rl.end(); it != ie; ++it) {
        executor.executeAlloc(*it->second, size, false, target, false, true,
                              it->first.second);
      }
    }
  }
}

void SpecialFunctionHandler::handleFree(ExecutionState &state,
                          KInstruction *target,
                          std::vector<ref<Expr> > &arguments) {
  // XXX should type check args
  assert(arguments.size()==1 &&
         "invalid number of arguments to free");
  executor.executeFree(state, arguments[0]);
}

void SpecialFunctionHandler::handleCheckMemoryAccess(ExecutionState &state,
                                                     KInstruction *target,
                                                     std::vector<ref<Expr> > 
                                                       &arguments) {
  assert(arguments.size()==2 &&
         "invalid number of arguments to klee_check_memory_access");

  ref<Expr> address = executor.toUnique(state, arguments[0]);
  ref<Expr> size = executor.toUnique(state, arguments[1]);
  if (!isa<ConstantExpr>(address) || !isa<ConstantExpr>(size)) {
    executor.terminateStateOnError(state, 
                                   "check_memory_access requires constant args",
				   Executor::User);
  } else {
    ObjectPair op;

    if (!state.addressSpace.resolveOne(cast<ConstantExpr>(address), op)) {
      executor.terminateStateOnError(state,
                                     "check_memory_access: memory error",
				     Executor::Ptr, NULL,
                                     executor.getAddressInfo(state, address));
    } else {
      ref<Expr> chk = 
        op.first->getBoundsCheckPointer(address, 
                                        cast<ConstantExpr>(size)->getZExtValue());
      if (!chk->isTrue()) {
        executor.terminateStateOnError(state,
                                       "check_memory_access: memory error",
				       Executor::Ptr, NULL,
                                       executor.getAddressInfo(state, address));
      }
    }
  }
}

void SpecialFunctionHandler::handleGetValue(ExecutionState &state,
                                            KInstruction *target,
                                            std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 &&
         "invalid number of arguments to klee_get_value");

  executor.executeGetValue(state, arguments[0], target);
}

void SpecialFunctionHandler::handleDefineFixedObject(ExecutionState &state,
                                                     KInstruction *target,
                                                     std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==2 &&
         "invalid number of arguments to klee_define_fixed_object");
  assert(isa<ConstantExpr>(arguments[0]) &&
         "expect constant address argument to klee_define_fixed_object");
  assert(isa<ConstantExpr>(arguments[1]) &&
         "expect constant size argument to klee_define_fixed_object");
  
  uint64_t address = cast<ConstantExpr>(arguments[0])->getZExtValue();
  uint64_t size = cast<ConstantExpr>(arguments[1])->getZExtValue();
  MemoryObject *mo = executor.memory->allocateFixed(address, size, state.prevPC->inst);
  executor.bindObjectInState(state, mo, false);
  mo->isUserSpecified = true; // XXX hack;
}

/* SYSREL extension */
void SpecialFunctionHandler::handleSetMetadata(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {
     state.setMetadata(arguments[0], arguments[1]);
}

void SpecialFunctionHandler::handleGetMetadata(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {
     ref<Expr> cv = state.getMetadata(arguments[0]);
     executor.bindLocal(target, state, cv);
}


/* arguments[0]: condition
   arguments[1]: key for true cases
   arguments[2]: key for false cases
   Records the conditions and the sets to be checked at the end of the execution
*/
void SpecialFunctionHandler::handleRecordMetadataGloballyOnCondition(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {

  llvm::errs() << "HANDLE RECORD METADATA args " << arguments.size() << "\n";

  ref<Expr> e = arguments[0];
  
  if (e->getWidth() != Expr::Bool)
    e = NeExpr::create(e, ConstantExpr::create(0, e->getWidth()));

  std::pair<ref<Expr>, ref<Expr> > sets;
  sets.first = arguments[1];
  sets.second = arguments[2];

  globalRecordMetadataMap[e] = sets;
  globalMetadataConditionMessage[e] = readStringAtAddress(state, arguments[3]);
}

void SpecialFunctionHandler::handleRecordMetadataLocallyOnCondition(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {

  llvm::errs() << "HANDLE RECORD METADATA args " << arguments.size() << "\n";

  ref<Expr> e = arguments[0];
  
  if (e->getWidth() != Expr::Bool)
    e = NeExpr::create(e, ConstantExpr::create(0, e->getWidth()));

  std::pair<ref<Expr>, ref<Expr> > sets;
  sets.first = arguments[1];
  sets.second = arguments[2];

  std::map<ref<Expr>, std::pair<ref<Expr>, ref<Expr> > > m;
  if (localRecordMetadataMap.find((long)&state) != localRecordMetadataMap.end())
     m = localRecordMetadataMap[(long)&state]; 
  m[e] = sets;
  localRecordMetadataMap[(long)&state] = m;
  std::map<ref<Expr>, std::string> m2;
  if (localMetadataConditionMessage.find((long)&state) != localMetadataConditionMessage.end())
     m2 = localMetadataConditionMessage[(long)&state];
  m2[e] = readStringAtAddress(state, arguments[3]);
  localMetadataConditionMessage[(long)&state] = m2;
}


/* arguments[0]: condition
   arguments[1]: key for true cases
   arguments[2]: key for false cases
   Checks the conditions upon execution in the system under test
*/
void SpecialFunctionHandler::handleAddMetadataGloballyOnCondition(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {

  llvm::errs() << "HANDLE ADD METADATA args " << arguments.size() << "\n";

  ref<Expr> e = arguments[0];
  
  if (e->getWidth() != Expr::Bool)
    e = NeExpr::create(e, ConstantExpr::create(0, e->getWidth()));
  

  bool resF, resT;
  bool successF __attribute__ ((unused)) = executor.solver->mustBeFalse(state, e, resF);
  bool successT __attribute__ ((unused)) = executor.solver->mustBeTrue(state, e, resT);

  llvm::errs() << "checking metadata condition " << e << " " << resT << " " << resF << "\n";
  llvm::errs() << "keys: " << arguments[1] << " " << arguments[2] << "\n";
  ExprPPrinter::printConstraints(llvm::errs(), state.constraints);

  assert(successF && successT && "FIXME: Unhandled solver failure");
  if (resT) {
     std::set<ref<Expr> > ms;
     if (globalMetadataSetMap.find(arguments[1]) != globalMetadataSetMap.end()) 
       ms = globalMetadataSetMap[arguments[1]]; 
     ms.insert(ConstantExpr::create((long)&state,64));
     globalMetadataSetMap[arguments[1]] = ms;
    llvm::errs() << "Adding metadata " << ((long)&state) << " to the set of " << arguments[1] << "\n";
  }
  else if (resF) {
     std::set<ref<Expr> > ms;
     if (globalMetadataSetMap.find(arguments[2]) != globalMetadataSetMap.end()) 
       ms = globalMetadataSetMap[arguments[2]]; 
     ms.insert(ConstantExpr::create((long)&state,64));
     globalMetadataSetMap[arguments[2]] = ms;
    llvm::errs() << "Adding metadata " << ((long)&state) << " to the set of " << arguments[2] << "\n";
  } else { // both are feasible so add the state pointer to both sets
     std::set<ref<Expr> > ms1;
     if (globalMetadataSetMap.find(arguments[1]) != globalMetadataSetMap.end()) 
       ms1 = globalMetadataSetMap[arguments[1]]; 
     ms1.insert(ConstantExpr::create((long)&state,64));
     globalMetadataSetMap[arguments[1]] = ms1;
    llvm::errs() << "Adding metadata " << ((long)&state) << " to the set of " << arguments[1] << "\n";
 
    std::set<ref<Expr> > ms;
    if (globalMetadataSetMap.find(arguments[2]) != globalMetadataSetMap.end()) 
       ms = globalMetadataSetMap[arguments[2]]; 
    ms.insert(ConstantExpr::create((long)&state,64));
    globalMetadataSetMap[arguments[2]] = ms;
    llvm::errs() << "Adding metadata " << ((long)&state) << " to the set of " << arguments[2] << "\n";
        
  }

  std::pair<long,long> dp;
  if (globalMetadataSetMap.find(arguments[1]) != globalMetadataSetMap.end()) 
       dp.first = (long)&globalMetadataSetMap[arguments[1]];
  if (globalMetadataSetMap.find(arguments[2]) != globalMetadataSetMap.end()) 
       dp.second = (long)&globalMetadataSetMap[arguments[2]];
  llvm::errs() << "metadata set addresses: " << dp.first << " " << dp.second << "\n";
  globalMetadataSetsToBeChecked.insert(dp);

  globalMetadataMessage[dp] = readStringAtAddress(state, arguments[3]);
}

/* arguments[0]: condition
   arguments[1]: key for true cases
   arguments[2]: key for false cases
   Checks the conditions upon execution in the system under test
*/
void SpecialFunctionHandler::handleAddMetadataLocallyOnCondition(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {

  llvm::errs() << "HANDLE ADD METADATA args " << arguments.size() << "\n";

  ref<Expr> e = arguments[0];
  
  if (e->getWidth() != Expr::Bool)
    e = NeExpr::create(e, ConstantExpr::create(0, e->getWidth()));
  

  bool resF, resT;
  bool successF __attribute__ ((unused)) = executor.solver->mustBeFalse(state, e, resF);
  bool successT __attribute__ ((unused)) = executor.solver->mustBeTrue(state, e, resT);

  llvm::errs() << "checking metadata condition " << e << " " << resT << " " << resF << "\n";
  llvm::errs() << "keys: " << arguments[1] << " " << arguments[2] << "\n";
  ExprPPrinter::printConstraints(llvm::errs(), state.constraints);

  assert(successF && successT && "FIXME: Unhandled solver failure");
  std::map<ref<Expr>, std::set<ref<Expr> > > gm;
  if (localMetadataSetMap.find((long)&state) != localMetadataSetMap.end())
     gm = localMetadataSetMap[(long)&state];

  if (resT) {
     std::set<ref<Expr> > ms;
     if (gm.find(arguments[1]) != gm.end()) 
       ms = gm[arguments[1]]; 
     ms.insert(ConstantExpr::create((long)&state,64));
     gm[arguments[1]] = ms;
     localMetadataSetMap[(long)&state] = gm;
    llvm::errs() << "Adding metadata " << ((long)&state) << " to the set of " << arguments[1] << "\n";
  }
  else if (resF) {
     std::set<ref<Expr> > ms;
     if (gm.find(arguments[2]) != gm.end()) 
       ms = gm[arguments[2]]; 
     ms.insert(ConstantExpr::create((long)&state,64));
     gm[arguments[2]] = ms;
     localMetadataSetMap[(long)&state] = gm;
    llvm::errs() << "Adding metadata " << ((long)&state) << " to the set of " << arguments[2] << "\n";
  } else { // both are feasible so add the state pointer to both sets
     std::set<ref<Expr> > ms1;
     if (gm.find(arguments[1]) != gm.end()) 
       ms1 = gm[arguments[1]]; 
     ms1.insert(ConstantExpr::create((long)&state,64));
     gm[arguments[1]] = ms1;
    llvm::errs() << "Adding metadata " << ((long)&state) << " to the set of " << arguments[1] << "\n";
 
    std::set<ref<Expr> > ms;
    if (gm.find(arguments[2]) != gm.end()) 
       ms = gm[arguments[2]]; 
    ms.insert(ConstantExpr::create((long)&state,64));
    gm[arguments[2]] = ms;
    llvm::errs() << "Adding metadata " << ((long)&state) << " to the set of " << arguments[2] << "\n";

    localMetadataSetMap[(long)&state] = gm;
        
  }

  std::pair<long,long> dp;
  if (gm.find(arguments[1]) != gm.end()) 
       dp.first = (long)&gm[arguments[1]];
  if (gm.find(arguments[2]) != gm.end()) 
       dp.second = (long)&gm[arguments[2]];
  llvm::errs() << "metadata set addresses: " << dp.first << " " << dp.second << "\n";
  std::set<std::pair<long,long> > ls;
  if (localMetadataSetsToBeChecked.find((long)&state) != localMetadataSetsToBeChecked.end())
     ls = localMetadataSetsToBeChecked[(long)&state];
  ls.insert(dp);
  localMetadataSetsToBeChecked[(long)&state] = ls;
  std::map<std::pair<long,long>, std::string>  lm2;
  if (localMetadataMessage.find((long)&state) != localMetadataMessage.end())
     lm2 = localMetadataMessage[(long)&state];
  lm2[dp] = readStringAtAddress(state, arguments[3]);
  localMetadataMessage[(long)&state] = lm2;
}

void SpecialFunctionHandler::handleAddMetadataLocally(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {

    std::map<ref<Expr>, std::set<ref<Expr> > > gm;
    if (localMetadataSetMap.find((long)&state) != localMetadataSetMap.end())
        gm = localMetadataSetMap[(long)&state];
    std::set<ref<Expr> > ms;
    if (gm.find(arguments[0]) != gm.end()) 
       ms = gm[arguments[0]]; 
    ms.insert(arguments[1]);
    gm[arguments[0]] = ms;
    localMetadataSetMap[(long)&state] = gm;
    llvm::errs() << "Adding metadata " << arguments[1] << " to the set of " << arguments[0] << "\n";
}

void SpecialFunctionHandler::handleAddMetadataGlobally(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {
    std::set<ref<Expr> > ms;
    if (globalMetadataSetMap.find(arguments[0]) != globalMetadataSetMap.end()) 
       ms = globalMetadataSetMap[arguments[0]]; 
    ms.insert(arguments[1]);
    globalMetadataSetMap[arguments[0]] = ms;
    llvm::errs() << "Adding metadata " << arguments[1] << " to the set of " << arguments[0] << "\n";
}



void SpecialFunctionHandler::handleCheckMetadataMembershipLocally(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {

    std::map<ref<Expr>, std::set<ref<Expr> > > gm;
    if (localMetadataSetMap.find((long)&state) != localMetadataSetMap.end())
        gm = localMetadataSetMap[(long)&state];
    std::set<ref<Expr> > ms;
    if (gm.find(arguments[0]) != gm.end()) 
       ms = gm[arguments[0]]; 
    llvm::errs() << "Checking for membership of " << arguments[1] << "\n";
    llvm::errs() << "On the path with constraint:\n"; 
    ExprPPrinter::printConstraints(llvm::errs(), state.constraints);
    if (ms.find(arguments[1]) != ms.end()) {
       std::string message = readStringAtAddress(state, arguments[2]);
       llvm::errs() << (message == "" ? "Metadata membership holds! " : message) << arguments[1]
                    << " in the set of " << arguments[0] << "\n";
    }

}

void SpecialFunctionHandler::handleCheckMetadataMembershipGlobally(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {

    std::set<ref<Expr> > ms;
    if (globalMetadataSetMap.find(arguments[0]) != globalMetadataSetMap.end()) 
       ms = globalMetadataSetMap[arguments[0]]; 
    llvm::errs() << "Checking for membership of " << arguments[1] << "\n";
    if (ms.find(arguments[1]) != ms.end()) {
       std::string message = readStringAtAddress(state, arguments[2]);
       llvm::errs() << (message == "" ? "Metadata membership holds! " : message) << arguments[1]
                    << " in the set of " << arguments[0] << "\n";
    }

}


void SpecialFunctionHandler::handleReportDiffMetadataLocally(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {
    std::map<ref<Expr>, std::set<ref<Expr> > > gm;
    if (localMetadataSetMap.find((long)&state) != localMetadataSetMap.end())
        gm = localMetadataSetMap[(long)&state];
    std::pair<long,long> dp;
    if (gm.find(arguments[0]) != gm.end()) 
       dp.first = (long)&gm[arguments[0]];
    if (gm.find(arguments[1]) != gm.end()) 
       dp.second = (long)&gm[arguments[1]];
    std::set<std::pair<long,long> > ls;
    if (localMetadataSetsToBeChecked.find((long)&state) != localMetadataSetsToBeChecked.end())
       ls = localMetadataSetsToBeChecked[(long)&state];
    ls.insert(dp);
    localMetadataSetsToBeChecked[(long)&state] = ls;
    std::map<std::pair<long,long>, std::string> lm;
    if (localMetadataMessage.find((long)&state) != localMetadataMessage.end())
       lm = localMetadataMessage[(long)&state];
    lm[dp] = readStringAtAddress(state, arguments[2]);
    localMetadataMessage[(long)&state] = lm;
}

void SpecialFunctionHandler::handleReportDiffMetadataGlobally(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {
    std::pair<long,long> dp;
    if (globalMetadataSetMap.find(arguments[0]) != globalMetadataSetMap.end()) 
       dp.first = (long)&globalMetadataSetMap[arguments[0]];
    if (globalMetadataSetMap.find(arguments[1]) != globalMetadataSetMap.end()) 
       dp.second = (long)&globalMetadataSetMap[arguments[1]];
    globalMetadataSetsToBeChecked.insert(dp);
    globalMetadataMessage[dp] = readStringAtAddress(state, arguments[2]);
}


/* SYSREL extension */




void SpecialFunctionHandler::handleMakeSymbolic(ExecutionState &state,
                                                KInstruction *target,
                                                std::vector<ref<Expr> > &arguments) {
  std::string name;

  // FIXME: For backwards compatibility. We should eventually enforce the
  // correct arguments and types.
  switch (arguments.size()) {
    case 2:
      klee_warning("klee_make_symbolic: deprecated number of arguments (2 instead of 3)");
      break;
    case 3:
      name = readStringAtAddress(state, arguments[2]);
      break;
    default:
      executor.terminateStateOnError(state, "illegal number of arguments to klee_make_symbolic(void*, size_t, char*)", Executor::User);
      return;
  }
  if (name.length() == 0) {
    name = "unnamed";
    klee_warning("klee_make_symbolic: renamed empty name to \"unnamed\"");
  }

  Executor::ExactResolutionList rl;
  executor.resolveExact(state, arguments[0], rl, "make_symbolic");
  
  for (Executor::ExactResolutionList::iterator it = rl.begin(), 
         ie = rl.end(); it != ie; ++it) {
    const MemoryObject *mo = it->first.first;
    mo->setName(name);
    
    const ObjectState *old = it->first.second;
    ExecutionState *s = it->second;
    
    if (old->readOnly) {
      executor.terminateStateOnError(*s, "cannot make readonly object symbolic",
                                     Executor::User);
      return;
    } 

    // FIXME: Type coercion should be done consistently somewhere.
    bool res;
    bool success __attribute__ ((unused)) =
      executor.solver->mustBeTrue(*s, 
                                  EqExpr::create(ZExtExpr::create(arguments[1],
                                                                  Context::get().getPointerWidth()),
                                                 mo->getSizeExpr()),
                                  res);
    assert(success && "FIXME: Unhandled solver failure");
    
    if (res) {
      executor.executeMakeSymbolic(*s, mo, name);
    } else {      
      executor.terminateStateOnError(*s, 
                                     "wrong size given to klee_make_symbolic[_name]", 
                                     Executor::User);
    }
  }
}

void SpecialFunctionHandler::handleMarkGlobal(ExecutionState &state,
                                              KInstruction *target,
                                              std::vector<ref<Expr> > &arguments) {
  assert(arguments.size()==1 &&
         "invalid number of arguments to klee_mark_global");  

  Executor::ExactResolutionList rl;
  executor.resolveExact(state, arguments[0], rl, "mark_global");
  
  for (Executor::ExactResolutionList::iterator it = rl.begin(), 
         ie = rl.end(); it != ie; ++it) {
    const MemoryObject *mo = it->first.first;
    assert(!mo->isLocal);
    mo->isGlobal = true;
  }
}

void SpecialFunctionHandler::handleAddOverflow(ExecutionState &state,
                                               KInstruction *target,
                                               std::vector<ref<Expr> > &arguments) {
  executor.terminateStateOnError(state, "overflow on addition",
                                 Executor::Overflow);
}

void SpecialFunctionHandler::handleSubOverflow(ExecutionState &state,
                                               KInstruction *target,
                                               std::vector<ref<Expr> > &arguments) {
  executor.terminateStateOnError(state, "overflow on subtraction",
                                 Executor::Overflow);
}

void SpecialFunctionHandler::handleMulOverflow(ExecutionState &state,
                                               KInstruction *target,
                                               std::vector<ref<Expr> > &arguments) {
  executor.terminateStateOnError(state, "overflow on multiplication",
                                 Executor::Overflow);
}

void SpecialFunctionHandler::handleDivRemOverflow(ExecutionState &state,
                                               KInstruction *target,
                                               std::vector<ref<Expr> > &arguments) {
  executor.terminateStateOnError(state, "overflow on division or remainder",
                                 Executor::Overflow);
}


ReturnAPIHandler::ReturnAPIHandler() : APIHandler() {}

bool ReturnAPIHandler::interpret(PMFrame &pmf, APIAction *action,ExecutionState &state,  
          std::vector< ref<Expr> > &arguments, KInstruction *target, bool &term, bool &comp, bool &abort, ref<Expr> &offendingAddress, int tid) {

  comp = true;
  std::vector<std::string> par = action->getParams();
  std::string api = par[0];
  if (par[1].find("arg") != std::string::npos || par[1].find("alloc") != std::string::npos) {
     const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();
     llvm::CallSite cs(target->inst);
     Value *fp = cs.getCalledValue();
     Function *caller = ((Executor*)theInterpreter)->getTargetFunction(fp, state);
     ref<Expr> refobjaddr = eval(state,  dl, caller, arguments, par[1], target, true, abort);
     if (abort)
        return false; 
     for(int i=0; i<arguments.size(); i++)
        llvm::outs() << "arg " << i << " " << arguments[i] << "\n";
     llvm::outs() << "returning value " << refobjaddr << "\n";
     ((Executor*)(theInterpreter))->bindLocal(target, state, refobjaddr);
  }
  else {     
     int val = std::stoi(par[1]);
     ((Executor*)(theInterpreter))->bindLocal(target, state, ConstantExpr::create(val, Expr::Int64)); 
  }  
  return true;
}
     
bool ReturnAPIHandler::assignsRetValue(APIAction *action) {
  llvm::errs() << "return API handler..\n";
  return true;
}


RefCountAPIHandler::RefCountAPIHandler() : APIHandler() {}

bool RefCountAPIHandler::assignsRetValue(APIAction *action) {
  return false;   
}

bool RefCountAPIHandler::interpret(PMFrame &pmf, APIAction *action, ExecutionState &state, 
    std::vector< ref<Expr> > &arguments, KInstruction *target, bool &temp, bool &comp, bool &abort,ref<Expr> &offendingAddress,  int tid){   

  std::vector<std::string> par = action->getParams();
  std::string api = par[0];
  std::string op = par[1];
  const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();
  llvm::CallSite cs(target->inst);
  Value *fp = cs.getCalledValue();
  Function *caller = ((Executor*)theInterpreter)->getTargetFunction(fp, state);
  bool address = false;
  std::string expr = par[2]; 
  if (expr[0] == '&') {
     address = true;
     expr = expr.substr(1);
  }
  if (expr[0] == '*') {
     address = false;
     expr = expr.substr(1);
  }
  ref<Expr> refobjaddr = eval(state,  dl, caller, arguments, expr, target, address, abort);
  if (abort) {
     return false;
  }
  llvm::errs() << "memory object at base addr " << refobjaddr  << "\n";
  int value = std::stoi(par[3]);
  std::string onzerocb = par[4]; 
 
  if (op == "set") {
     state.setRefCount(refobjaddr, value);
     llvm::errs() << "refcount for " << refobjaddr  << " set to " << value << "\n";
     assert(value >= 0 && "Negative refcount value set!");
     state.recordRefcountOp(refobjaddr, api + " :set to " + std::to_string(value));
     comp = true;
  }
  else if (op == "inc") {
     int cv = state.getRefCount(refobjaddr);
     llvm::errs() << "refcount for " << refobjaddr  << " set to " << cv + value << "\n";
     state.setRefCount(refobjaddr, cv + value);
     state.recordRefcountOp(refobjaddr, api + " :inc to " + std::to_string(cv + value));
     comp = true;
  }
  else if (op == "dec") {
     int cv = state.getRefCount(refobjaddr);
     state.setRefCount(refobjaddr, cv - value);
     llvm::errs() << "refcount for " << refobjaddr  << " set to " << cv - value << "\n";
     state.recordRefcountOp(refobjaddr, api + " :dec to " +  std::to_string(cv - value));
     if ((cv - value) < 0)
        ((Executor*)(theInterpreter))->terminateStateOnError(state,
        "Negative refcount encountered in decrement!",Executor::TerminateReason::NegativeRefcount);
     //assert((cv - value) >= 0 && "Negative refcount encountered in decrement!");
     if ((cv - value) == 0) {
        if (onzerocb != "none") {
           if (onzerocb.find("arg") != std::string::npos) { 
              llvm::outs() << "executing callback " << onzerocb << " on zero refcount\n";
              executeCallback(state, onzerocb, arguments, target, comp, abort, tid);
              if (abort) return false; 
           }
           else {
             llvm::outs() << "executing subblock " << onzerocb << " on zero refcount\n";
             APIAction *action = APIHandler::lookup(onzerocb);
             llvm::errs() << "onzerocb=" << onzerocb << "\n";
             assert(action);
             bool term2 = false;
             if (action) {
                llvm::errs() << "args before pushing frame for apisubblock\n";
                for(auto a: arguments) 
                   llvm::errs() << "arg " << a << "\n";    

                std::vector<ref<Expr> > ar;
                for(auto a: arguments) 
                   ar.push_back(a);

                state.pushPMFrame(action, ar, target, tid);
                comp = false;
                // old way of doing things.. 
                //action->execute(state, arguments, target, term2, comp, tid);
             }
             else { 
                llvm::errs() << "Couldn't find subblock " << onzerocb << "\n"; 
                assert(false);
             }
           }
        }
        else comp = true;
     }
  }
  return true;
};

AllocAPIHandler::AllocAPIHandler() : APIHandler() {
}

bool AllocAPIHandler::assignsRetValue(APIAction *action) {
     std::vector<std::string> pars = action->getParams();
     llvm::outs() << "Alloc API assigns to return value? " << pars[4] << "entered\n";
     return (pars[4] == "true");   
}

bool AllocAPIHandler::interpret(PMFrame &pmf, APIAction *action, ExecutionState &state,
         std::vector< ref<Expr> > &arguments, KInstruction *target, bool &term, bool &comp, bool &abort, ref<Expr> &offendingAddress, int tid) {
    comp = true;
    std::vector<std::string> par = action->getParams();
    LLVMContext &ctx = moduleHandle->getContext();
    if (par[0] == "anonymous") {
       if (!par[1].empty() && std::all_of(par[1].begin(), par[1].end(), ::isdigit)) {
          // spec with size
          size_t allocationSize = std::stoi(par[1]);
          Type *t = llvm::IntegerType::get(((Executor*)theInterpreter)->kmodule->module->getContext(),8);
          bool sym = (par[3] == "true");
          const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();
          size_t allocationAlignment = dl.getPrefTypeAlignment(t);
          MemoryObject *mo = ((Executor*)(theInterpreter))->memory->allocate(allocationSize, false, false,
                         target->inst, allocationAlignment, allocationSize, Type::getInt8Ty(ctx));
          if (!mo) {
             llvm::outs() << "Could not allocate memory object while handling anonymous alloc API!\n";
             return false;
          }
          recordMemObj(state, mo);
          llvm::errs() << "Allocated memory object of size " << allocationSize << " at " << mo->getBaseExpr() << " to handle anonymous alloc " << par[5] << "\n"; 

          state.recordAlloc(mo->getBaseExpr());
          if (par.size() > 5) {
             state.addSymbolDef(par[5], mo->getBaseExpr());
             state.addSymbolType(par[5], t);
          }
          if (sym) {
             mo->name = state.getUnique("anonymous") + "_" + par[5];
             if (tid == -1) {
                ((Executor*)(theInterpreter))->executeMakeSymbolic(state, mo, mo->name, 
                                                                         true, t, true);
             } 
             else {
                ((Executor*)(theInterpreter))->executeMakeSymbolicThread(state, mo, mo->name, tid); 
             }
          }        
          else {
             ObjectState *os = ((Executor*)(theInterpreter))->bindObjectInState(state, mo, false, 0);
             if (par[2] == "true")
                os->initializeToZero();
          }
          return true;
          
       }
       llvm::TypeFinder StructTypes;
       StructTypes.run(*(((Executor*)theInterpreter)->kmodule->module), true);
       bool found = false;
       Type *t = NULL;
       for (auto *STy : StructTypes) {
          if (getTypeName(STy) == par[1]) {
             found = true;
             t = STy;
             break;
          }
       }
       if (found) {
          bool sym = (par[3] == "true");
          const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();
          size_t allocationAlignment = dl.getPrefTypeAlignment(t);
          size_t allocationSize = dl.getTypeAllocSize(t);
          MemoryObject *mo = ((Executor*)(theInterpreter))->memory->allocate(allocationSize, false, false,
                         target->inst, allocationAlignment, 1, t);
          if (!mo) {
             llvm::outs() << "Could not allocate memory object while handling anonymous alloc API!\n";
             return false;
          }
          recordMemObj(state, mo);
          llvm::errs() << "Allocated memory object of size " << allocationSize << " at " << mo->getBaseExpr() << " to handle anonymous alloc " << par[5] << "\n"; 
          state.recordAlloc(mo->getBaseExpr());
          if (par.size() > 5) {
             state.addSymbolDef(par[5], mo->getBaseExpr());
             state.addSymbolType(par[5], t);
          }

          llvm::StructType *st = dyn_cast<llvm::StructType>(t);
          if (st) {
             std::string tname = getTypeName(t); 
             state.typeToAddr[t] = mo->getBaseExpr();
             llvm::outs() << "mapping lazy instance of " << tname << " to " << mo->getBaseExpr() << "\n";
             bool isSingle; int count;
             bool li = isAllocTypeLazyInit(t,isSingle,count);
             if (li && isSingle) {
                if (state.lazyInitSingleInstances.find(t) != state.lazyInitSingleInstances.end()) {
                   llvm::errs() << "Cannot allocate object of singleton type " << t << " due to contradiction!\n"; 
                   exit(1);
                }
                state.lazyInitSingleInstances[t] = mo;
                llvm::outs() << "storing address " << mo->getBaseExpr() << " as single instance of type " << tname << "\n"; 
                addSingleOrDerivative(state, mo->getBaseExpr());
                llvm::errs() << "recording singleton or derivative " <<  mo->getBaseExpr() << "\n";
            }
          }   


     
          if (sym) {
             mo->name = state.getUnique("anonymous") + "_" + par[5];
             if (tid == -1) {
                ((Executor*)(theInterpreter))->executeMakeSymbolic(state, mo, mo->name, 
                                                                            true, t, true);
             } 
             else {
                ((Executor*)(theInterpreter))->executeMakeSymbolicThread(state, mo, mo->name, tid); 
             }
          }        
          else {
             ObjectState *os = ((Executor*)(theInterpreter))->bindObjectInState(state, mo, false, 0);
             if (par[2] == "true")
                os->initializeToZero();
          }
          return true;
       }
       assert(false && "Could not find anonymous alloc type!");
    }
    std::string fname = par[0];
    llvm::outs() << "Handling alloc api " << fname << " in thread " << tid << "\n";
    llvm::outs() << "Target instruction " << (*target->inst) << "\n";
    bool zeroMemory = (par[2] == "true");
    llvm::CallInst *ci = dyn_cast<CallInst>(target->inst);
    if (!ci)
       assert(false && "Expected a call instruction for allocation API!\n");
    int param = std::stoi(par[1]); 
    llvm::errs() << "size=" << arguments[param] << " vs " << ConstantExpr::create(0,32) << "\n"; 
    if (arguments[param] == ConstantExpr::create(0,32)) {
       llvm::errs() << "Skipping 0 size alloc API: \n"; action->print(); 
       return true;
    }
    bool sym = (par[3] == "true");
    bool retAssign = (par[4] == "true");
    size_t allocationAlignment;
    size_t allocationSize;
    const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();
    Type *t = ci->getArgOperand(param)->getType();
    if (t->isPointerTy()) {
       t = t->getPointerElementType();
       if (t->isPointerTy()) {
          t = t->getPointerElementType();
          allocationAlignment = dl.getPrefTypeAlignment(t);
          allocationSize = dl.getTypeAllocSize(t);
       }
       else assert(false && "Alloc API param type must be a double-pointer!\n");
    }
    else {
       //const llvm::Value *allocSite = state.prevPC->inst;
       const llvm::Value *allocSite = target->inst;
       allocationAlignment = ((Executor*)(theInterpreter))->getAllocationAlignment(allocSite);
       ConstantExpr *constexp = dyn_cast<ConstantExpr>(arguments[param]);
       if (constexp)
          allocationSize = constexp->getZExtValue();
      else {
           // check if we can derive a solution consistent with primArraySize
           ref<Expr> primeq = EqExpr::create(arguments[param], ConstantExpr::create(primArraySize, arguments[param]->getWidth()));
           bool ret = false;
           bool success = ((Executor*)(theInterpreter))->solver->mayBeTrue(state, primeq, ret);
           if(!success || !ret) {
             llvm::errs() << "Terminating path due to a symbolic size for AllocAPIHandler!\n";  
             ((Executor*)(theInterpreter))->terminateStateOnError(state, "concretized symbolic size",
                                Executor::Model, NULL, "A symbolic size is passed to an AllocAPIHandler"); 
             return false;
           }
           else  {
              llvm::errs() << "Using " << primArraySize << " for the symbolic size expression \ 
                         and constraining the path condition accordingly\n";
              ((Executor*)(theInterpreter))->addConstraint(state, primeq); 
              allocationSize = primArraySize;
           }
      }
    }
    MemoryObject *mo = ((Executor*)(theInterpreter))->memory->allocate(allocationSize, false, false,
                         ci, allocationAlignment, allocationSize, Type::getInt8Ty(ctx));
    if (!mo) {
       llvm::outs() << "Could not allocate memory object while handling alloc API!\n";
       return false;
    }
    recordMemObj(state, mo);
    llvm::outs() << "Allocated memory object at " << mo->getBaseExpr() << " to handle alloc API " << fname << "\n"; 
    state.recordAlloc(mo->getBaseExpr());
    if (par.size() > 5) {  
       state.addSymbolDef(par[5], mo->getBaseExpr());
       state.addSymbolType(par[5], t);
    } 

    llvm::StructType *st = dyn_cast<llvm::StructType>(t);
    if (st) {
       std::string tname = getTypeName(t); 
       state.typeToAddr[t] = mo->getBaseExpr();
       llvm::outs() << "mapping lazy instance of " << tname << " to " << mo->getBaseExpr() << "\n";
       bool isSingle; int count;
       bool li = isAllocTypeLazyInit(t,isSingle,count);
       if (li && isSingle) {
          if (state.lazyInitSingleInstances.find(t) != state.lazyInitSingleInstances.end()) {
                   llvm::errs() << "Cannot allocate object of singleton type " << t << " due to conttradiction!\n";
                   exit(1);
          }
          state.lazyInitSingleInstances[t] = mo;
          llvm::outs() << "storing address " << mo->getBaseExpr() << " as single instance of type " << tname << "\n"; 
          addSingleOrDerivative(state, mo->getBaseExpr());
          llvm::errs() << "recording singleton or derivative " <<  mo->getBaseExpr() << "\n";
       }
    }   
     
 
    if (sym) {
        mo->name = state.getUnique(fname) + "_" + std::to_string(param);

       if (tid == -1) {
          ((Executor*)(theInterpreter))->executeMakeSymbolic(state, mo, mo->name, true, t, true);
          abort = ((Executor*)(theInterpreter))->executeMemoryOperation(state, true, arguments[param], mo->getBaseExpr(), 0);
          if (abort) return false;
       } 
       else {
          ((Executor*)(theInterpreter))->executeMakeSymbolicThread(state, mo, mo->name, tid); 
          ((Executor*)(theInterpreter))->executeMemoryOperationThread(state, true, arguments[param], mo->getBaseExpr(), 0, tid); 
       }
    }
    else { 
       ObjectState *os = ((Executor*)(theInterpreter))->bindObjectInState(state, mo, false, 0);
       if (par[2] == "true")
          os->initializeToZero();
    }

    if (retAssign) {
       ((Executor*)(theInterpreter))->bindLocal(target, state, mo->getBaseExpr());
    }

    return true;
}


FreeAPIHandler::FreeAPIHandler() : APIHandler() {}

bool FreeAPIHandler::assignsRetValue(APIAction *action) {
  return false;
}

       
bool FreeAPIHandler::interpret(PMFrame &pmf, APIAction *action, ExecutionState &state, 
          std::vector< ref<Expr> > &arguments, KInstruction *target, bool &term, bool &comp, bool &abort, ref<Expr> &offendingAddress, int tid) {
     comp = true;
     std::vector<std::string> pars = action->getParams();
     llvm::outs() << "Handling free api " << pars[0] << "\n";

     if (pars[0] == "anonymous") {
        Function *f = kmoduleExt->module->getFunction(action->getFunctionName());
        const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();
        ref<Expr> addr = eval(state, dl, f, arguments, pars[1], target, true, abort);
        if (abort) return false; 
        llvm::errs() << "Freeing address " << addr << " as anonymous free of function";         
        if (tid == -1)  
           ((Executor*)(theInterpreter))->executeFree(state, addr, NULL);
        else
           ((Executor*)(theInterpreter))->executeFreeThread(state, addr, NULL, tid);      
        return true;
     }

     int arg =  std::stoi(pars[1]);
     if (tid == -1)  
         ((Executor*)(theInterpreter))->executeFree(state, arguments[arg], NULL);
     else
         ((Executor*)(theInterpreter))->executeFreeThread(state, arguments[arg], NULL, tid);     
     return true;
}

IgnoreAPIHandler::IgnoreAPIHandler() : APIHandler() {
}


bool IgnoreAPIHandler::interpret(PMFrame &pmf, APIAction *action, ExecutionState &state, 
				 std::vector< ref<Expr> > &arguments, KInstruction *target, bool &term, bool &comp, bool &abort, ref<Expr> &offendingAddress,  int tid) {
    comp = true;
    std::vector<std::string> pars = action->getParams();
    llvm::outs() << "Handling ignore api " << pars[0] << "\n";
    Function *function = kmoduleExt->module->getFunction(pars[0]);
    // load pointer type parameters to detect memory issues precisely
    abort = ! ((Executor*)theInterpreter)->loadPointerArguments(state, target, function, arguments, offendingAddress); 
    return true;
}

bool IgnoreAPIHandler::assignsRetValue(APIAction *action) {
  return false;
}

void APIHandler::executeCallback(ExecutionState &state, std::string cbexpr, std::vector< ref<Expr> > &arguments, 
         KInstruction *target, bool &comp, bool &abort, int tid) {
   llvm::outs() << "cbexpr= " << cbexpr << "\n";
   APIAction *sub = APIHandler::getSubblock(cbexpr);
   if (sub) {
      llvm::outs() << "executing subblock " << cbexpr << " on condition\n";
      bool term2 = false;
      llvm::errs() << "args before pushing frame for apisubblock\n";
      for(auto a: arguments) 
         llvm::errs() << "arg " << a << "\n";    

      std::vector<ref<Expr> > ar;
      for(auto a: arguments) 
         ar.push_back(a);

      state.pushPMFrame(sub, ar, target, tid);
      comp = false;
      return;
   } 
   const Function *f = NULL;
   if (cbexpr.find("arg") == 0 || cbexpr.find("alloc") == 0) {
      llvm::CallSite cs(target->inst);
      Value *fp = cs.getCalledValue();
      Function *caller = ((Executor*)theInterpreter)->getTargetFunction(fp, state);
      const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();
      ref<Expr> cbaddr = eval(state,  dl, caller, arguments, cbexpr, target, false, abort) ;
      if (abort) return;
      llvm::errs() << "cbaddr=" << cbaddr << "\n";
      f = ((Executor*)theInterpreter)->getFunctionFromAddress(cbaddr);
   }
   else 
      f = kmoduleExt->module->getFunction(cbexpr);
   llvm::errs() << "callback expr: " << cbexpr << "\n";
   if (!f) {
      //assert(f && "Callback function not defined!\n");
      llvm::errs() << "WARNING: Callback function not defined, expr=" << cbexpr << "!\n";
      comp = true;
      return;
   }
   llvm::errs() << "calling callback " << f->getName() << "\n";
   Function *ncf = target->inst->getParent()->getParent()->getParent()->getFunction(f->getName());
   KFunction *kf = kmoduleExt->functionMap[ncf];      
   if (kf) {
      state.setPMCallback(f->getName());
      comp = false; 
     state.pushFrame(state.prevPC, kf);
    state.pc = kf->instructions;

   StatsTracker * statsTracker = ((Executor*)theInterpreter)->getStatsTracker();
   if (statsTracker) {
      if (tid == -1)
         statsTracker->framePushed(state, &state.stack[state.stack.size()-2]);
      else
         statsTracker->framePushedThread(state, &state.stack[state.stack.size()-2], tid);
   }
   // allocate symbolic arguments
   ((Executor*)theInterpreter)->initArgsAsSymbolic(state, kf->function, abort, true);
   if (abort) return;       
  }
  else {
     llvm::errs() << "WARNING: Callback function is an external function, expr=" << cbexpr << "!\n";
     comp = true;
     return ;
  }
}  

CallbackAPIHandler::CallbackAPIHandler() : APIHandler() {}

bool CallbackAPIHandler::assignsRetValue(APIAction *action) {
  return false;
}

bool APIHandler::checkCondition(APIAction *action, ExecutionState &state, 
      std::vector< ref<Expr> > &arguments, std::string cexpr, KInstruction *target, bool &abort) {
  std::vector<std::string> par = action->getParams();
  bool negate = false;
  bool address = true;
  if (cexpr[0] == '!') {
     negate = true;
     cexpr = cexpr.substr(1);
  }
  if (cexpr[0] == '*') {
     address = false;
     cexpr = cexpr.substr(1);   
  }
  Function *f = kmoduleExt->module->getFunction(par[0]);
  const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();  
  ref<Expr> result = eval(state, dl, f, arguments, cexpr, target, address, abort);
  if (abort) return false;
  llvm::errs() << "condition eval " << cexpr << "=" << result << "\n"; 
  ConstantExpr *CE;
  if (!negate)
     return (result == Expr::createPointer(0) || !((CE = dyn_cast<ConstantExpr>(result))));
  else return (result != Expr::createPointer(0) && (CE = dyn_cast<ConstantExpr>(result)));
}

bool CallbackAPIHandler::interpret(PMFrame &pmf, APIAction *action, ExecutionState &state, 
      std::vector< ref<Expr> > &arguments, KInstruction *target, bool &term, bool &comp, bool &abort, ref<Expr> &offendingAddress, int tid) {
   std::vector<std::string> par = action->getParams();
   bool cond = true;
   if (par.size() == 3) {
      // check the condition
      cond = checkCondition(action, state, arguments, par[2], target, abort);
      if (abort) return false; 
      llvm::errs() << "Callback condition " << par[2] << "? " << cond << "\n";
   }
   if (cond) {
      executeCallback(state, par[1], arguments, target, comp, abort, tid);
      if (abort) return false; 
   }
   else comp = true;
   return true; 
}
 

TerminateAPIHandler::TerminateAPIHandler() : APIHandler() {}

bool TerminateAPIHandler::interpret(PMFrame &pmf, APIAction *action, ExecutionState &state, 
                                std::vector< ref<Expr> > &arguments, 
				    KInstruction *target, bool &term, bool &comp,bool &abort, ref<Expr> &offendingAddress, int tid) {
  comp = true;
  llvm::errs() << "Handling terminate api\n " ; action->print();
  std::vector<std::string>  par = action->getParams();
  std::string texpr = par[1];
  term = checkCondition(action, state, arguments, texpr, target, abort);
  if (abort) return false; 
  return true;
}       

bool TerminateAPIHandler::assignsRetValue(APIAction *action) {
  return false;
}


SideEffectAPIHandler::SideEffectAPIHandler() : APIHandler() {}

// syntax argi([-> | .]fieldindex)+
// we assume that argi holds base address of the memory object pointed by that pointer type argument
// to do: handle the * operator
ref<Expr> APIHandler::eval(ExecutionState &state,  const DataLayout &dl, Function *f, 
     std::vector< ref<Expr> > &arguments, std::string oexpr, KInstruction *target, bool address, bool &abort) {

   if (oexpr == "NULL")
      return Expr::createPointer(0);

   if (!oexpr.empty() && std::all_of(oexpr.begin(), oexpr.end(), ::isdigit)) {
      int val = std::stoi(oexpr);
      return ConstantExpr::create(val,64);
   }

   std::string expr;

   if (oexpr[0] == '&') {
      address = true;
      expr = oexpr.substr(1);
   }
   else expr = oexpr;

   llvm::errs() << "In SE eval for " <<  expr << "\n";
   bool modelsymbol = false;
   std::string hint("struct.usb_interface");
   ref<Expr> cur;
   llvm::Type *t = NULL;
   llvm::StructType *st = NULL;
   llvm::Type *ptrtype = NULL;
   unsigned i; 
   auto pos = expr.find("arg");
   if (pos != std::string::npos) {
    for(i = pos + 3; expr[i] != '-' && expr[i] != '.' && i < expr.length() ; i++) ;
    std::string index;
    int argindex; 
    if (i == expr.length()) 
       index = expr.substr(pos+3);
    else {
       index = expr.substr(pos+3, i);
    }     
    argindex = std::stoi(index); 
    // find the type of the argument
    int j = 0;
    for(llvm::Argument & arg : f->args()) {
       if (j == argindex) {
           t = arg.getType();
           break;
       }
       j++;
    }
    if (t->isPointerTy()) {
       ptrtype = t;
       t = t->getPointerElementType(); 
    } 
    st = dyn_cast<StructType>(t);
    cur = arguments[argindex];
    llvm::errs() << "In SE:  arguments[" << argindex << "] is " <<  cur << "\n";
 }
 else { 
       pos = expr.find("alloc");
       if (pos == std::string::npos) {
          llvm::outs() <<  expr << "\n";
          assert(0 && "expression does not refer to an argument or an alloc symbol");
       }
       else {
          modelsymbol = true;
          for(i = pos + 5; expr[i] != '-' && expr[i] != '.' && i < expr.length() ; i++) ;
          std::string symb;
          if (i == expr.length()) 
             symb = expr.substr(pos);
          else 
             symb = expr.substr(pos, i);
          if ((t=state.getSymbolType(symb))) {
             cur = state.getSymbolDef(symb);
             if (dyn_cast<ConstantExpr>(cur)) {
                const auto CE = dyn_cast<ConstantExpr>(cur);
                if (!CE->getZExtValue()) {
                   llvm::errs() << "Symbol " << symb  << " NULL!";
                   //assert(0 && "Alloc symbol not defined!");
                   return cur;
                }
             }
             if (t->isPointerTy()) {
                ptrtype = t;
                t = t->getPointerElementType(); 
             } 
             st = dyn_cast<StructType>(t);
             llvm::errs() << "In SE: " << symb << " is " << cur << " of type " << getTypeName(t) << "\n";
          }
          else return Expr::createPointer(0);
       }
  }

    bool exprParsed = false;
    int last = 0;
    std::string field;
    int fieldIndex; 
    ref<Expr> addressRes = cur;
    bool simple = true;
    while (i < expr.length()) {
        llvm::errs() <<"parsing loop \n";
        if ((expr[i] == '-' || expr[i] == '.')) {
           simple = false;
           if (!st)
              assert(0 && "Dereferencing into a non-struct type pointer!\n");
           if (expr[i] == '-') {
              assert(expr[i+1] == '>' && "Unexpected dereferencing operator in the update expression!\n");
              i = i + 2;
           }
           else  i = i + 1;
           last = i;
           if (i == expr.length())
              assert(0 && "Incomplete update expression field name does not follow the dereferencing operator!\n");
           else {
              while (i < expr.length() && expr[i] != '-' && expr[i] != '.') {
                i++;
              }  
              exprParsed =  (i == expr.length());
              field = expr.substr(last, i);
              fieldIndex = std::stoi(field); 
              Type *fieldType = st->getElementType(fieldIndex);
              uint64_t offset = dl.getStructLayout(st)->getElementOffset(fieldIndex);
              llvm::errs() << "using " << cur << "\n"; 
              cur = AddExpr::create(ConstantExpr::create(offset, Expr::Int64), cur);
              llvm::errs() << "computed addr " << cur << "\n";
              if (fieldType->isPointerTy()) {
                 ptrtype = t;
                 // load the pointer object and update cur with the base address
                 bool asuccess;
                 ObjectPair op;
                 ((Executor*)(theInterpreter))->solver->setTimeout(((Executor*)(theInterpreter))->coreSolverTimeout);
                 if (!state.addressSpace.resolveOne(state, ((Executor*)(theInterpreter))->solver, cur, op, asuccess)) {
                    cur = ((Executor*)(theInterpreter))->toConstant(state, cur, "resolveOne failure");
                    asuccess = state.addressSpace.resolveOne(cast<ConstantExpr>(cur), op);
                 }
                 ((Executor*)(theInterpreter))->solver->setTimeout(0);             
                 if (asuccess) {
                    addressRes = cur;
                    ref<Expr> offsetExpr = SubExpr::create(cur, op.first->getBaseExpr()); 
                    cur = op.second->read(offsetExpr,Context::get().getPointerWidth()/*dl.getPointerTypeSizeInBits(ptrtype)*/);
                    llvm::errs() << "after updating with the value, cur=" << cur << "\n";
                    // read the field string           
                 }
                 else {
                   if (t->isPointerTy())
                      t = t->getPointerElementType();
                   llvm::Type *rallocType;
                   ref<Expr> resaddr; 
                   bool sym;
                   int count = 0;
                   bool singleInstance = false;
                   bool lazyInitTemp = isLazyInit(t, singleInstance, count);
                   if (!lazyInitTemp)
                      count = 1;
                   const MemoryObject *mo = ((Executor*)(theInterpreter))->memory->allocateLazyForTypeOrEmbedding(state, target->inst, 
                              t, t, singleInstance, count, rallocType, resaddr, sym, abort, 
                              NULL, hint.c_str());
                   if (abort) return Expr::createPointer(0);
                   mo->name = "sym_" + state.getUnique(getTypeName(t)); 
                   if (sym) {
                      llvm::errs() << "lazy initializing, new object at " << resaddr << " while evaluating expression\n";
                      ((Executor*)(theInterpreter))->executeMakeSymbolic(state, mo, mo->name, 
                                                                         true, t, true);  
                      abort = ((Executor*)(theInterpreter))->executeMemoryOperation(state, true, cur, resaddr, 0);
                      if (abort) return Expr::createPointer(0);
                      addressRes = cur;
                      cur = resaddr;
                   }
                   else { 
                      assert(resaddr == cur);
                      llvm::errs() << "returned an existing instance " <<   resaddr << " (inside " << mo->getBaseExpr() << ")\n"; 
                      addressRes = resaddr;
                      // read from addressRes and store into cur 
                      const ObjectState *os = state.addressSpace.findObject(mo);
                      ref<Expr> offsetExpr = SubExpr::create(resaddr, mo->getBaseExpr()); 
                      llvm::errs() << "reading from " << mo->getBaseExpr() << " offset=" << offsetExpr << "\n";
                      cur = os->read(offsetExpr,Context::get().getPointerWidth());
                      llvm::errs() << "read value=" << cur << " from " << addressRes << "\n";	
                   }
                 }

              }  
              else if (exprParsed) {
                 // done reading the expression; should read the value and note the address
                 bool asuccess;
                 ObjectPair op;
                 ((Executor*)(theInterpreter))->solver->setTimeout(((Executor*)(theInterpreter))->coreSolverTimeout);
                 if (!state.addressSpace.resolveOne(state, ((Executor*)(theInterpreter))->solver, cur, op, asuccess)) {
                    cur = ((Executor*)(theInterpreter))->toConstant(state, cur, "resolveOne failure");
                    asuccess = state.addressSpace.resolveOne(cast<ConstantExpr>(cur), op);
                 }
                 ((Executor*)(theInterpreter))->solver->setTimeout(0);             
                 if (asuccess) {
                    addressRes = cur;
                    ref<Expr> offsetExpr = SubExpr::create(cur, op.first->getBaseExpr()); 
                    cur = op.second->read(offsetExpr,Context::get().getPointerWidth()/*dl.getPointerTypeSizeInBits(ptrtype)*/);
                    llvm::errs() << "after updating with the value, cur=" << cur << "\n";
                    // read the field string           
                 }                 
              } // otherwise keep dereferencing
              t = fieldType;
              std::string type_str;
              llvm::raw_string_ostream rso(type_str);
              t->print(rso);
              llvm::errs() << "type in SE expr: " << rso.str() << "\n";
              if (t->isPointerTy())
                 st = dyn_cast<StructType>(t->getPointerElementType());
              else 
                 st = dyn_cast<StructType>(t);
           }
        }
        else {
           assert(0 && "Unexpected dereferencing operator in the update expression!\n");
        }
    } 
    if (address)
       return addressRes;
    else {
       if (modelsymbol && simple) {
          bool asuccess;
          ObjectPair op;
          ((Executor*)(theInterpreter))->solver->setTimeout(((Executor*)(theInterpreter))->coreSolverTimeout);
          if (!state.addressSpace.resolveOne(state, ((Executor*)(theInterpreter))->solver, cur, op, asuccess)) {
             cur = ((Executor*)(theInterpreter))->toConstant(state, cur, "resolveOne failure");
             asuccess = state.addressSpace.resolveOne(cast<ConstantExpr>(cur), op);
          }
          ((Executor*)(theInterpreter))->solver->setTimeout(0);             
          if (asuccess) {
             addressRes = cur;
             ref<Expr> offsetExpr = SubExpr::create(cur, op.first->getBaseExpr()); 
             cur = op.second->read(offsetExpr,Context::get().getPointerWidth()/*dl.getPointerTypeSizeInBits(ptrtype)*/);
             llvm::errs() << "after updating with the value, cur=" << cur << "\n";
                    // read the field string           
             return cur;
          }
          assert(false && "Model symbol couldn't be read!");
       }
       else  
          return cur;   
    }
}

bool SideEffectAPIHandler::assignsRetValue(APIAction *action) {
     return false;
}

bool SideEffectAPIHandler::interpret(PMFrame &pmf, APIAction *action, ExecutionState &state, std::vector< ref<Expr> > &arguments, 
      KInstruction *target, bool &term, bool &comp, bool &abort, ref<Expr> &offendingAddress, int tid) {
   comp = true;
   std::vector<std::string> pars = action->getParams();
   std::string fname = pars[0];
   llvm::outs() << "Handling side-effect api " << fname << "\n";
   Function *f = kmoduleExt->module->getFunction(fname);
   const DataLayout &dl = target->inst->getParent()->getParent()->getParent()->getDataLayout();
   std::string uexpr = pars[1];
      std::string lhs, rhs; 
      std::istringstream ss(uexpr);
      getline(ss, lhs, '=');
      getline(ss, rhs, '=');
      lhs = ltrim(rtrim(lhs));
      rhs = ltrim(rtrim(rhs));
      llvm::errs() << "lhs=" << lhs << "\n";
      llvm::errs() << "rhs=" << rhs << "\n";
      ref<Expr> addr = eval(state, dl, f, arguments, lhs, target, true, abort);
      if (abort) return false;
      ref<Expr> value = eval(state, dl, f, arguments, rhs, target, false, abort);
      if (abort) return false;
      llvm::errs() << "addr=" << addr << "\n";
      llvm::errs() << "value=" << value << "\n";
      // write value to addr
      bool asuccess;
      ObjectPair op; 
      ((Executor*)(theInterpreter))->solver->setTimeout(((Executor*)(theInterpreter))->coreSolverTimeout);
      if (!state.addressSpace.resolveOne(state, ((Executor*)(theInterpreter))->solver, addr, op, asuccess)) {
         addr = ((Executor*)(theInterpreter))->toConstant(state, addr, "resolveOne failure");
         asuccess = state.addressSpace.resolveOne(cast<ConstantExpr>(addr), op);
      }
      ((Executor*)(theInterpreter))->solver->setTimeout(0);             
      if (asuccess) {
         ObjectState *wos = state.addressSpace.getWriteable(op.first, op.second);
         ref<Expr> offsetexpr =  SubExpr::create(addr, op.first->getBaseExpr());
         llvm::errs() << "executing side-effect expr: " << uexpr << " and writing " << value << 
                         " to address " << op.first->getBaseExpr() << " at offset " << offsetexpr << "\n";
         wos->write(offsetexpr, value);         
      }      
   return true;
}


APIHandler::APIHandler() {
}

APIAction* APIHandler::lookup(std::string label) {
  if (symbolTable.find(label) != symbolTable.end())
     return symbolTable[label];
  return NULL;
}

bool APIHandler::assignsRetValue(APIAction *action) {
  return false;
}

bool APIHandler::handles(std::string fname) {
  return (apiModel.find(fname) != apiModel.end());
}

bool APIHandler::isIgnore(std::string fname) {
  if (apiModel.find(fname) == apiModel.end())
     return false;
  for(auto action : apiModel[fname]) {
     if (action->desc == "ignore")
        return true;
  }
  return false;
}

bool APIHandler::handle(ExecutionState &state, 
                               std::vector<ExecutionState*> &branches,
                               std::string fname, 
                               std::vector< ref<Expr> > &arguments, 
			KInstruction *target, bool &abort, ref<Expr> &offendingAddress,
                               int tid) {
  if (apiModel.find(fname) == apiModel.end()) {
     llvm::outs() << "external function " << fname << " not handled\n"; 
     return false;
  }
  Function *function = kmoduleExt->module->getFunction(fname);
  std::set<RetCond> conds;
  bool symbolizeRetValueOK = true;
  //bool initArgs = false;
  for(auto action : apiModel[fname]) {
     conds.insert(action->getReturnCond());
     if (action->assignsRetValue())
        symbolizeRetValueOK = false;
     //if (action->setsArgs())
       // initArgs = false;
  }
  bool branching = false;
  for(auto c : conds) {
     if (c != TRUE) {
        branching = true;
        break; 
     }
  }
  bool term = false;
  if (!branching || !symbolizeRetValueOK) {
     if (branching && !symbolizeRetValueOK)
        llvm::outs() << "WARNING: api both branching and requesting not to symbolize the return value!\n";

     if (symbolizeRetValueOK) {
        llvm::outs() << "symbolizing ret value in handler for function " << function->getName() << "\n";
        ((Executor*)(theInterpreter))->symbolizeReturnValue(state, target, function, abort);
        if (abort) return false;
     }
     
     if (apiModel[fname].size() > 1)
        assert(false && "Cannot interpret an API in multiple ways in the same state!");

     std::vector<ref<Expr> > ar;
     for(auto a: arguments) 
        ar.push_back(a);

     for(auto action : apiModel[fname]) {
        state.pushPMFrame(action, ar, target, tid);
     }

  }
  else {
   llvm::outs() << "Branching semantics, current path condition:\n";
   Function *f = kmoduleExt->module->getFunction(fname);
   assert(f);
   const MemoryObject *srt = ((Executor*)(theInterpreter))->symbolizeReturnValue(state, target, function, abort);
   if (abort) return false;
   bool asuccess;
   ObjectPair op;
   if (srt) { 
    ref<Expr> srtbase = srt->getBaseExpr();
    ((Executor*)(theInterpreter))->solver->setTimeout(((Executor*)(theInterpreter))->coreSolverTimeout);
    if (!state.addressSpace.resolveOne(state, ((Executor*)(theInterpreter))->solver, srtbase, op, asuccess)) {
       srtbase = ((Executor*)(theInterpreter))->toConstant(state, srtbase, "resolveOne failure");
       asuccess = state.addressSpace.resolveOne(cast<ConstantExpr>(srtbase), op);
    }
    else asuccess = true;
    ((Executor*)(theInterpreter))->solver->setTimeout(0);             
    if (asuccess) {
       // generate all possible branches
       bool ltzero = conds.find(LTZERO) != conds.end();
       bool lteqzero = conds.find(LTEQZERO) != conds.end();
       bool gtzero = conds.find(GTZERO) != conds.end();
       bool gteqzero = conds.find(GTEQZERO) != conds.end();
       bool zero = conds.find(ZERO) != conds.end();
       bool notzero = conds.find(NOTZERO) != conds.end();
       std::map<RetCond, std::set<ExecutionState*> > partition;        
       std::set<ExecutionState*> empty;
       partition[ZERO] = empty;
       partition[LTZERO] = empty;
       partition[LTEQZERO] = empty;
       partition[GTZERO] = empty;
       partition[GTEQZERO] = empty;
       partition[NOTZERO] = empty;  
       Expr::Width retwidth = ((Executor*)(theInterpreter))->getWidthForLLVMType(target->inst->getType());
       ref<Expr> retexpr = op.second->read(0, retwidth);
       if ((ltzero && gtzero) || (lteqzero && gteqzero) || 
           ((zero || notzero) && (ltzero || lteqzero || gtzero || gteqzero))) {
          StatePair p = ((Executor*)(theInterpreter))->fork(state,
                  EqExpr::create(retexpr, ConstantExpr::create(0, retwidth)),
                  false);
          branches.push_back(p.first);
          partition[ZERO].insert(p.first);
          partition[LTEQZERO].insert(p.first);
          partition[GTEQZERO].insert(p.first);
          StatePair p2 = ((Executor*)(theInterpreter))->fork(*p.second, 
                     SltExpr::create(retexpr, ConstantExpr::create(0, retwidth)), 
                 false);           
          branches.push_back(p2.first);
          partition[LTZERO].insert(p2.first);
          partition[NOTZERO].insert(p2.first);
          partition[LTEQZERO].insert(p2.first);
          branches.push_back(p2.second);
          partition[GTZERO].insert(p2.second);
          partition[NOTZERO].insert(p2.second);
          partition[GTEQZERO].insert(p2.second);
          llvm::outs() << "generated =0, <0, and >0 partitions on the ret val\n";
       }
       else if (zero || notzero) { 
          StatePair p = ((Executor*)(theInterpreter))->fork(state,
               EqExpr::create(retexpr, ConstantExpr::create(0, retwidth)),
               false);
          branches.push_back(p.first);
          partition[ZERO].insert(p.first); 
          branches.push_back(p.second);
          partition[NOTZERO].insert(p.second);
          llvm::outs() << "generated =0 and <>0 partitions on the ret val\n";
      }
      else {
          if (lteqzero) {
             
             StatePair p = ((Executor*)(theInterpreter))->fork(state, 
                     SleExpr::create(retexpr, ConstantExpr::create(0, retwidth)), 
                   false);
             branches.push_back(p.first);
             partition[LTEQZERO].insert(p.first);
             branches.push_back(p.second);           
             partition[GTZERO].insert(p.second);
             llvm::outs() << "generated =<0 and >0 partitions on the ret val\n";
          }
          else if (gteqzero) {
             ref<Expr> cond = SgeExpr::create(retexpr, ConstantExpr::create(0, retwidth));
             StatePair p = ((Executor*)(theInterpreter))->fork(state,cond,false);
             branches.push_back(p.first);
             partition[GTEQZERO].insert(p.first);
             branches.push_back(p.second);           
             llvm::outs() << " fork condition: " << cond << "\n";
             partition[LTZERO].insert(p.second);
             llvm::outs() << "generated <0 and >=0 partitions on the ret val\n";
         }        
         else {
           partition[TRUE].insert(&state);
           llvm::outs() << "No partitions generated on the ret val\n";
         }
      } 
    
      std::vector<ref<Expr> > ar;
      for(auto a: arguments) 
         ar.push_back(a);

      for(auto action : apiModel[fname]) {
         llvm::outs() << "checking branches in the partition " << action->getReturnCond() << "\n";
         action->print();
         for(auto branch : partition[action->getReturnCond()]) {
            if (branch) {
               branch->pushPMFrame(action, ar, target, tid);
            }
         }
      }

     }
     else {
        llvm::outs() << "Failure in memory resolution for the return value object\n";
     }
    }
    else {
     llvm::outs() << "Return value object null\n";
    }

  }
  return true;  
}

void APIHandler::addSubblock(std::string label, APIAction *action) {
   symbolTable[label] = action;
}

APIAction *APIHandler::getSubblock(std::string label) {
   if (symbolTable.find(label) == symbolTable.end())
      return NULL;
   return symbolTable[label];
}

void APIHandler::addAction(std::string api, APIAction *action) {
  std::set<APIAction*> set;
  if (apiModel.find(api) != apiModel.end())
      set = apiModel[api];
  set.insert(action);
  apiModel[api] = set;
  llvm::outs() << "Added API action for " << api << "\n";
}

void read(std::istringstream& iss, std::vector<std::string> &par) {
     std::string item = "";
     while(getline(iss, item, ',')) {
       item = ltrim(rtrim(item));
       par.push_back(item);
    }
      
}

void APIHandler::addIgnoreHandler(std::string fname) {
  if (handles(fname)) return; 
  std::vector<std::string> par(0);
  par.insert(par.begin(), fname); 
  if (!ignoreAPIHandler)
     ignoreAPIHandler = new IgnoreAPIHandler();
  APIAction *a = new APIAction("ignore",par,ignoreAPIHandler);
  addAction(par[0],a);
}

void APIHandler::readProgModelSpec(const char *name) {
  allocAPIHandler = new AllocAPIHandler();
  ignoreAPIHandler = new IgnoreAPIHandler();
  callbackAPIHandler = new CallbackAPIHandler();
  returnAPIHandler = new ReturnAPIHandler();
  refcountAPIHandler = new RefCountAPIHandler();
  freeAPIHandler = new FreeAPIHandler();
  sideEffectAPIHandler = new SideEffectAPIHandler();
  terminateAPIHandler = new TerminateAPIHandler();
  std::fstream cf(name, std::fstream::in);
  if (cf.is_open()) {
     std::string line, desc, data;
     APIBlock *apiblock = NULL;
     std::string mainapi = "";
     std::string subblocklabel = ""; 
     RetCond rcond = TRUE; 
     while(std::getline(cf,line)) { 
       desc = data = "";  
       std::istringstream iss(line);
       getline(iss, desc, ':');
       desc = ltrim(rtrim(desc));
       getline(iss, data);
       llvm::outs() << desc << ":" << data << "\n";
       if (desc == "apiblock") {
          std::string rcondst;
          std::istringstream iss2(data);
          getline(iss2, mainapi, ',');
          getline(iss2, rcondst, ','); 
          mainapi = ltrim(rtrim(mainapi));
          rcondst = ltrim(rtrim(rcondst));           
          if (rcondst == "zero")
             rcond = ZERO;
          else if (rcondst == "ltzero")
             rcond = LTZERO;
          else if (rcondst == "lteqzero")
             rcond = LTEQZERO;
          else if (rcondst == "gtzero")
             rcond = GTZERO;
          else if (rcondst == "gteqzero")
             rcond = GTEQZERO;
          else if (rcondst == "nonzero")
             rcond = NOTZERO;
          apiblock = new APIBlock();
          apiblock->setReturnCond(rcond);
       }
       else if (desc == "endapiblock") {
          addAction(mainapi, apiblock);  
          addSubblock(mainapi, apiblock);
          mainapi = "";        
          apiblock = NULL;
          rcond = TRUE;
       } 
       else if (desc == "apisubblock") {
          std::istringstream iss2(data); 
          getline(iss2, mainapi, ',');
          getline(iss2, subblocklabel, ',');
          mainapi = ltrim(rtrim(mainapi));
          subblocklabel = ltrim(rtrim(subblocklabel));
          apiblock = new APIBlock();
       }
       else if (desc == "endapisubblock") {
          addSubblock(subblocklabel, apiblock);
          mainapi = "";  
          subblocklabel = "";
          apiblock = NULL;
          rcond = TRUE;
       }
       else if (desc == "assembly") {
          std::string afunc;
          afunc = ltrim(rtrim(data));
          assemblyFunctions.insert(afunc);
          llvm::outs() << "assembly " << afunc << "\n"; 
       }
       else {
          std::vector<std::string> par(0);
          std::istringstream iss2(data);
          read(iss2, par);
          APIAction *a = NULL;
          if (desc[0] == '/' && desc[1] == '/') 
             continue;
          if (desc == "terminate") {
             if (par.size() == 1)
                par.insert(par.begin(), mainapi);
             a = new APIAction(desc, par, terminateAPIHandler);
             llvm::outs() << "registering terminate expr "; a->print();
             assert(par.size() == 2 && "Incorrect number of params for terminate spec!");
          }
          else if (desc == "side-effect") {
             if (par.size() == 1)
                par.insert(par.begin(), mainapi);
             a = new APIAction(desc,par,sideEffectAPIHandler);
             llvm::outs() << "registering sideeffect expr "; a->print();
             assert(par.size() == 2 && "Incorrect number of params for side-effect spec!");
          }
          else if (desc == "anon_alloc,type,initzero,symbolic,return,symname") {
            if (par.size() == 5)
               par.insert(par.begin(), "anonymous");
            a = new APIAction(desc,par,allocAPIHandler);
            llvm::outs() << "anon_alloc,type,sym,symname"; a->print();
            assert(par.size() == 6 && "Incorrect number of params for anonymous alloc spec!");  
          }
          else if (desc == "alloc,parameter,initzero,symbolic,return,symname") {
             if (par.size() == 5)
                par.insert(par.begin(), mainapi); 
             a = new APIAction(desc,par,allocAPIHandler);
             llvm::outs() << " alloc,parameter,initzero,sym interface "; a->print();
             assert(par.size() == 6 && "Incorrect number of params for alloc spec!"); 
          }
          else if (desc == "anon_alloc,size,initzero,symbolic,return,symname") {
             if (par.size() == 5)
                par.insert(par.begin(), "anonymous"); 
             a = new APIAction(desc,par,allocAPIHandler);
             llvm::outs() << " alloc,size,initzero,sym interface "; a->print();
             assert(par.size() == 6 && "Incorrect number of params for alloc spec!"); 
          }
          else if (desc == "anon_free,parameter") {
             if (par.size() == 1)
                par.insert(par.begin(), "anonymous");
             a = new APIAction(desc, par, freeAPIHandler);
             llvm::outs() << "anon_free,parameter interface "; a->print();
             assert(par.size() == 2 && "Incorrect number of params for anonymous free spec!"); 
          }
          else if (desc == "free,parameter") {
             if (par.size() == 1)
                par.insert(par.begin(), mainapi); 
             a = new APIAction(desc, par, freeAPIHandler);
             llvm::outs() << " free,parameter interface "; a->print(); 
             assert(par.size() == 2 && "Incorrect number of params for free spec!");
          }
          else if (desc == "return") {
             if (par.size() == 1)
                par.insert(par.begin(), mainapi); 
             a = new APIAction(desc, par, returnAPIHandler);
             llvm::outs() << " return interface "; a->print();
             assert(par.size() == 2 && "Incorrect number of params for return spec!");
          }
          else if (desc == "refcount,op,expr,value,onzerocb") {
             if (par.size() == 4)
                par.insert(par.begin(), mainapi); 
             a = new APIAction(desc, par, refcountAPIHandler);
             llvm::outs() << " refcount,op,expr,value,onzerocb interface "; a->print();
             assert(par.size() == 5 && "Incorrect number of params for refcount spec!");
          }
          else if (desc == "callback") {
             if (par.size() == 1)
                par.insert(par.begin(), mainapi); 
             a = new APIAction(desc, par, callbackAPIHandler); 
             llvm::outs() << "callback interface "; a->print();
             assert(par.size() == 2 && "Incorrect number of params for callback spec!");
          }
          else if (desc == "cond_callback") {
             if (par.size() == 2)
                par.insert(par.begin(), mainapi); 
             a = new APIAction(desc, par, callbackAPIHandler); 
             llvm::outs() << "cond_callback interface "; a->print();
             assert(par.size() == 3 && "Incorrect number of params for cond_callback spec!");
          }          
          else if (desc == "ignore") {
             if (par.size() == 0)
                par.insert(par.begin(), mainapi); 
             a = new APIAction(desc,par,ignoreAPIHandler);
             llvm::outs() << "ignore interface "; a->print();
             assert(par.size() == 1 && "Incorrect number of params for ignore spec!");
          }
          if (apiblock) {
             if (a) {
                a->setFunctionName(mainapi);
                apiblock->addNextAction(a, rcond);
                a = NULL;
             }
          }
          else {
             if (a) {
                addAction(par[0],a);
                a = NULL;
             }
          }
       }
      
     }
     llvm::outs() << "Parsed Prog Model Spec \n";     
     for(auto acs : apiModel) {
        llvm::outs() << acs.first << ":\n";
        for(auto ac : acs.second) {
           ac->print();
        }
     } 
     for(auto st : symbolTable) {
       llvm::outs() << "subblock labeled " << st.first << "\n";
       st.second->print();
     }
     cf.close();
  }
}


bool APIHandler::interpret(PMFrame &pmf, APIAction *action, ExecutionState &state, std::vector< ref<Expr> > &arguments, 
            KInstruction *target, bool &term, bool &comp, bool &abort,ref<Expr> &offendingAddress,  int tid) {
     llvm::outs() << "Superclass interpret should not be executing!\n";
     return true;
}


bool APIHandler::setsArgs() {
   return true;
}


APIAction::APIAction()  {
  handler = NULL;
  terminated = false;
  std::vector<std::string> p(0);
  param = p;
  fname = "";
}

       
APIAction::APIAction(std::string desc, std::vector<std::string> param, APIHandler *handler, RetCond retCond) {
   this->desc = desc;
   this->param = param;
   this->handler = handler;
   returnCondition = retCond;
   terminated = false;
   fname = "";
}

APIAction::APIAction(const APIAction &a) {
   desc = a.desc;
   param = a.param;
   handler = a.handler;
   returnCondition = a.returnCondition;
   terminated = a.terminated;
   fname = a.fname;
}

bool APIAction::hasTerminated() {
  return terminated;
}

void APIAction::terminate() {
  terminated = true;
}

int APIAction::getNumActions() {
  return 1;
}

std::vector<std::string> APIAction::getParams() {
    return param;
}

RetCond APIAction::getReturnCond() {
   return returnCondition;
}

void APIAction::setReturnCond(RetCond rt) {
  returnCondition = rt;
}

void APIAction::setFunctionName(std::string fn) {
   fname = fn;
}
       
std::string APIAction::getFunctionName() {
  return fname;
}

       
bool APIAction::assignsRetValue() {
   llvm::errs() << "Checking return value with the handler..\n";
   return handler->assignsRetValue(this);
}

bool APIAction::setsArgs() {
   return handler->setsArgs();
}


void APIAction::execute(PMFrame &pmf, ExecutionState &state, std::vector< ref<Expr> > &arguments, 
          KInstruction *target, bool &term, bool &comp, bool &abort, ref<Expr> &offendingAddress,  int tid) {
  handler->interpret(pmf, this, state, arguments, target, term, comp, abort, offendingAddress, tid);
}

void APIAction::print() {
   llvm::errs() << desc << ":" ;
   for(auto p : param) {
      llvm::errs() << p << ",";
   }
   llvm::errs() << "\n";
}

APIBlock::APIBlock() : APIAction() {
  returnCondition = TRUE;
}

APIBlock::APIBlock(const APIBlock &ab) : APIAction(ab) {
  body = ab.body;
  returnCondition = ab.returnCondition;
}

void APIBlock::addNextAction(APIAction *action, RetCond rcond) {
   action->setReturnCond(rcond);
   body.push_back(action);
}

bool APIBlock::assignsRetValue() {
   llvm::errs() << "Checking return value for " << desc << "\n";
   for(auto a : body) {
       a->print();
       if (a->assignsRetValue()) {
          llvm::errs() << "Assigns return value!\n";
          return true;
       }
   }
   return false;
}

bool APIBlock::setsArgs() {
   for(auto action : body) {
       if (action->setsArgs())
          return true;
   }
   return false;
}

int APIBlock::getNumActions() {
  return body.size();
}

void APIBlock::execute(PMFrame &pmf, ExecutionState &state, std::vector< ref<Expr> > &arguments, 
         KInstruction *target, bool &term, bool &comp, bool &abort, ref<Expr> &offendingAddress, int tid) {
     term = false;
     comp = true;
     int i = state.getPMAction();
     for(int i = state.getPMAction(); i < body.size(); i++) {
        if (!term)  {
           bool term2 = false;
           bool comp2 = false;
           body[i]->execute(pmf, state, arguments, target, term2, comp2, abort, offendingAddress, tid);
           if (abort) return;
           if (term2) {
              term = term2;
              break;
           }
           if (!comp2) {
              // we use the handle to the relevant PMFrame
              // in case another frame has been pushed on the PMstack, e.g., apisubblock	
              pmf.setPMAction(i+1);
              comp = false;
              break;
           } 
        }
     }
     if (comp)
        pmf.setPMAction(body.size());
}

void APIBlock::print() {
     llvm::outs() << "Return condition=" << returnCondition << "\n";
     for(auto action : body) {
        action->print();
     }
}

/* SYSREL EXTENSION */



