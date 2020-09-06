# 1 "/home/tuba/Documents/experiments/driverVerification/PMGuided/models/sound/sound_model.mod.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 316 "<built-in>" 3
# 1 "<command line>" 1
# 15 "<command line>"
# 1 "././include/linux/kconfig.h" 1



# 1 "./include/generated/autoconf.h" 1
# 5 "././include/linux/kconfig.h" 2
# 16 "<command line>" 2
# 1 "<built-in>" 2
# 1 "/home/tuba/Documents/experiments/driverVerification/PMGuided/models/sound/sound_model.mod.c" 2
# 1 "./include/linux/module.h" 1








# 1 "./include/linux/list.h" 1



# 1 "./include/linux/types.h" 1




# 1 "./include/uapi/linux/types.h" 1



# 1 "./arch/x86/include/uapi/asm/types.h" 1



# 1 "./include/uapi/asm-generic/types.h" 1





# 1 "./include/asm-generic/int-ll64.h" 1
# 10 "./include/asm-generic/int-ll64.h"
# 1 "./include/uapi/asm-generic/int-ll64.h" 1
# 11 "./include/uapi/asm-generic/int-ll64.h"
# 1 "./arch/x86/include/uapi/asm/bitsperlong.h" 1
# 10 "./arch/x86/include/uapi/asm/bitsperlong.h"
# 1 "./include/asm-generic/bitsperlong.h" 1



# 1 "./include/uapi/asm-generic/bitsperlong.h" 1
# 5 "./include/asm-generic/bitsperlong.h" 2
# 11 "./arch/x86/include/uapi/asm/bitsperlong.h" 2
# 12 "./include/uapi/asm-generic/int-ll64.h" 2







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 11 "./include/asm-generic/int-ll64.h" 2




typedef signed char s8;
typedef unsigned char u8;

typedef signed short s16;
typedef unsigned short u16;

typedef signed int s32;
typedef unsigned int u32;

typedef signed long long s64;
typedef unsigned long long u64;
# 7 "./include/uapi/asm-generic/types.h" 2
# 5 "./arch/x86/include/uapi/asm/types.h" 2
# 5 "./include/uapi/linux/types.h" 2








# 1 "./include/uapi/linux/posix_types.h" 1



# 1 "./include/linux/stddef.h" 1



# 1 "./include/uapi/linux/stddef.h" 1
# 1 "./include/linux/compiler.h" 1
# 62 "./include/linux/compiler.h"
# 1 "./include/linux/compiler-gcc.h" 1
# 63 "./include/linux/compiler.h" 2
# 82 "./include/linux/compiler.h"
# 1 "./include/linux/compiler-clang.h" 1
# 83 "./include/linux/compiler.h" 2








struct ftrace_branch_data {
 const char *func;
 const char *file;
 unsigned line;
 union {
  struct {
   unsigned long correct;
   unsigned long incorrect;
  };
  struct {
   unsigned long miss;
   unsigned long hit;
  };
  unsigned long miss_hit[2];
 };
};

struct ftrace_likely_data {
 struct ftrace_branch_data data;
 unsigned long constant;
};
# 235 "./include/linux/compiler.h"
# 1 "./include/uapi/linux/types.h" 1
# 236 "./include/linux/compiler.h" 2
# 251 "./include/linux/compiler.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline))
void __read_once_size(const volatile void *p, void *res, int size)
{
 ({ switch (size) { case 1: *(__u8 *)res = *(volatile __u8 *)p; break; case 2: *(__u16 *)res = *(volatile __u16 *)p; break; case 4: *(__u32 *)res = *(volatile __u32 *)p; break; case 8: *(__u64 *)res = *(volatile __u64 *)p; break; default: __asm__ __volatile__("": : :"memory"); __builtin_memcpy((void *)res, (const void *)p, size); __asm__ __volatile__("": : :"memory"); } });
}
# 270 "./include/linux/compiler.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline))
void __read_once_size_nocheck(const volatile void *p, void *res, int size)
{
 ({ switch (size) { case 1: *(__u8 *)res = *(volatile __u8 *)p; break; case 2: *(__u16 *)res = *(volatile __u16 *)p; break; case 4: *(__u32 *)res = *(volatile __u32 *)p; break; case 8: *(__u64 *)res = *(volatile __u64 *)p; break; default: __asm__ __volatile__("": : :"memory"); __builtin_memcpy((void *)res, (const void *)p, size); __asm__ __volatile__("": : :"memory"); } });
}


static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __write_once_size(volatile void *p, void *res, int size)
{
 switch (size) {
 case 1: *(volatile __u8 *)p = *(__u8 *)res; break;
 case 2: *(volatile __u16 *)p = *(__u16 *)res; break;
 case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
 case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
 default:
  __asm__ __volatile__("": : :"memory");
  __builtin_memcpy((void *)p, (const void *)res, size);
  __asm__ __volatile__("": : :"memory");
 }
}
# 2 "./include/uapi/linux/stddef.h" 2
# 5 "./include/linux/stddef.h" 2




enum {
 false = 0,
 true = 1
};
# 5 "./include/uapi/linux/posix_types.h" 2
# 24 "./include/uapi/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;


# 1 "./arch/x86/include/asm/posix_types.h" 1



# 1 "./arch/x86/include/uapi/asm/posix_types_64.h" 1
# 10 "./arch/x86/include/uapi/asm/posix_types_64.h"
typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;


typedef unsigned long __kernel_old_dev_t;



# 1 "./include/uapi/asm-generic/posix_types.h" 1
# 14 "./include/uapi/asm-generic/posix_types.h"
typedef long __kernel_long_t;
typedef unsigned long __kernel_ulong_t;



typedef __kernel_ulong_t __kernel_ino_t;



typedef unsigned int __kernel_mode_t;



typedef int __kernel_pid_t;



typedef int __kernel_ipc_pid_t;



typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;



typedef __kernel_long_t __kernel_suseconds_t;



typedef int __kernel_daddr_t;



typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
# 71 "./include/uapi/asm-generic/posix_types.h"
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef __kernel_long_t __kernel_ptrdiff_t;




typedef struct {
 int val[2];
} __kernel_fsid_t;





typedef __kernel_long_t __kernel_off_t;
typedef long long __kernel_loff_t;
typedef __kernel_long_t __kernel_time_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
# 18 "./arch/x86/include/uapi/asm/posix_types_64.h" 2
# 5 "./arch/x86/include/asm/posix_types.h" 2
# 36 "./include/uapi/linux/posix_types.h" 2
# 14 "./include/uapi/linux/types.h" 2
# 28 "./include/uapi/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 6 "./include/linux/types.h" 2






typedef __u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ino_t ino_t;
typedef __kernel_mode_t mode_t;
typedef unsigned short umode_t;
typedef __u32 nlink_t;
typedef __kernel_off_t off_t;
typedef __kernel_pid_t pid_t;
typedef __kernel_daddr_t daddr_t;
typedef __kernel_key_t key_t;
typedef __kernel_suseconds_t suseconds_t;
typedef __kernel_timer_t timer_t;
typedef __kernel_clockid_t clockid_t;
typedef __kernel_mqd_t mqd_t;

typedef _Bool bool;

typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_uid16_t uid16_t;
typedef __kernel_gid16_t gid16_t;

typedef unsigned long uintptr_t;



typedef __kernel_old_uid_t old_uid_t;
typedef __kernel_old_gid_t old_gid_t;



typedef __kernel_loff_t loff_t;
# 54 "./include/linux/types.h"
typedef __kernel_size_t size_t;




typedef __kernel_ssize_t ssize_t;




typedef __kernel_ptrdiff_t ptrdiff_t;




typedef __kernel_time_t time_t;




typedef __kernel_clock_t clock_t;




typedef __kernel_caddr_t caddr_t;



typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;


typedef unsigned char unchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;




typedef __u8 u_int8_t;
typedef __s8 int8_t;
typedef __u16 u_int16_t;
typedef __s16 int16_t;
typedef __u32 u_int32_t;
typedef __s32 int32_t;



typedef __u8 uint8_t;
typedef __u16 uint16_t;
typedef __u32 uint32_t;


typedef __u64 uint64_t;
typedef __u64 u_int64_t;
typedef __s64 int64_t;
# 133 "./include/linux/types.h"
typedef unsigned long sector_t;
typedef unsigned long blkcnt_t;
# 152 "./include/linux/types.h"
typedef u64 dma_addr_t;




typedef unsigned gfp_t;
typedef unsigned fmode_t;


typedef u64 phys_addr_t;




typedef phys_addr_t resource_size_t;





typedef unsigned long irq_hw_number_t;

typedef struct {
 int counter;
} atomic_t;


typedef struct {
 long counter;
} atomic64_t;


struct list_head {
 struct list_head *next, *prev;
};

struct hlist_head {
 struct hlist_node *first;
};

struct hlist_node {
 struct hlist_node *next, **pprev;
};

struct ustat {
 __kernel_daddr_t f_tfree;
 __kernel_ino_t f_tinode;
 char f_fname[6];
 char f_fpack[6];
};
# 222 "./include/linux/types.h"
struct callback_head {
 struct callback_head *next;
 void (*func)(struct callback_head *head);
} __attribute__((aligned(sizeof(void *))));


typedef void (*rcu_callback_t)(struct callback_head *head);
typedef void (*call_rcu_func_t)(struct callback_head *head, rcu_callback_t func);
# 5 "./include/linux/list.h" 2

# 1 "./include/linux/poison.h" 1
# 7 "./include/linux/list.h" 2
# 1 "./include/uapi/linux/const.h" 1
# 8 "./include/linux/list.h" 2
# 1 "./include/linux/kernel.h" 1




# 1 "/usr/lib/llvm-3.8/bin/../lib/clang/3.8.0/include/stdarg.h" 1 3
# 30 "/usr/lib/llvm-3.8/bin/../lib/clang/3.8.0/include/stdarg.h" 3
typedef __builtin_va_list va_list;
# 50 "/usr/lib/llvm-3.8/bin/../lib/clang/3.8.0/include/stdarg.h" 3
typedef __builtin_va_list __gnuc_va_list;
# 6 "./include/linux/kernel.h" 2
# 1 "./include/linux/linkage.h" 1




# 1 "./include/linux/stringify.h" 1
# 6 "./include/linux/linkage.h" 2
# 1 "./include/linux/export.h" 1
# 27 "./include/linux/export.h"
struct kernel_symbol
{
 unsigned long value;
 const char *name;
};


extern struct module __this_module;
# 7 "./include/linux/linkage.h" 2
# 1 "./arch/x86/include/asm/linkage.h" 1
# 8 "./include/linux/linkage.h" 2
# 7 "./include/linux/kernel.h" 2



# 1 "./include/linux/bitops.h" 1
# 27 "./include/linux/bitops.h"
extern unsigned int __sw_hweight8(unsigned int w);
extern unsigned int __sw_hweight16(unsigned int w);
extern unsigned int __sw_hweight32(unsigned int w);
extern unsigned long __sw_hweight64(__u64 w);






# 1 "./arch/x86/include/asm/bitops.h" 1
# 16 "./arch/x86/include/asm/bitops.h"
# 1 "./arch/x86/include/asm/alternative.h" 1








# 1 "./arch/x86/include/asm/asm.h" 1
# 10 "./arch/x86/include/asm/alternative.h" 2
# 47 "./arch/x86/include/asm/alternative.h"
struct alt_instr {
 s32 instr_offset;
 s32 repl_offset;
 u16 cpuid;
 u8 instrlen;
 u8 replacementlen;
 u8 padlen;
} __attribute__((packed));





extern int alternatives_patched;

extern void alternative_instructions(void);
extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);

struct module;


extern void alternatives_smp_module_add(struct module *mod, char *name,
     void *locks, void *locks_end,
     void *text, void *text_end);
extern void alternatives_smp_module_del(struct module *mod);
extern void alternatives_enable_smp(void);
extern int alternatives_text_reserved(void *start, void *end);
extern bool skip_smp_alternatives;
# 17 "./arch/x86/include/asm/bitops.h" 2
# 1 "./arch/x86/include/asm/rmwcc.h" 1
# 18 "./arch/x86/include/asm/bitops.h" 2
# 1 "./arch/x86/include/asm/barrier.h" 1




# 1 "./arch/x86/include/asm/nops.h" 1
# 142 "./arch/x86/include/asm/nops.h"
extern const unsigned char * const *ideal_nops;
extern void arch_init_ideal_nops(void);
# 6 "./arch/x86/include/asm/barrier.h" 2
# 83 "./arch/x86/include/asm/barrier.h"
# 1 "./include/asm-generic/barrier.h" 1
# 84 "./arch/x86/include/asm/barrier.h" 2
# 19 "./arch/x86/include/asm/bitops.h" 2
# 71 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void
set_bit(long nr, volatile unsigned long *addr)
{
 if ((__builtin_constant_p(nr))) {
  asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "orb %1,%0"
   : "+m" (*(volatile long *) ((void *)(addr) + ((nr)>>3)))
   : "iq" ((u8)(1 << ((nr) & 7)))
   : "memory");
 } else {
  asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "bts %1,%0"
   : "+m" (*(volatile long *) (addr)) : "Ir" (nr) : "memory");
 }
}
# 94 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __set_bit(long nr, volatile unsigned long *addr)
{
 asm volatile("bts %1,%0" : "+m" (*(volatile long *) (addr)) : "Ir" (nr) : "memory");
}
# 109 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void
clear_bit(long nr, volatile unsigned long *addr)
{
 if ((__builtin_constant_p(nr))) {
  asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "andb %1,%0"
   : "+m" (*(volatile long *) ((void *)(addr) + ((nr)>>3)))
   : "iq" ((u8)~(1 << ((nr) & 7))));
 } else {
  asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "btr %1,%0"
   : "+m" (*(volatile long *) (addr))
   : "Ir" (nr));
 }
}
# 131 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void clear_bit_unlock(long nr, volatile unsigned long *addr)
{
 __asm__ __volatile__("": : :"memory");
 clear_bit(nr, addr);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __clear_bit(long nr, volatile unsigned long *addr)
{
 asm volatile("btr %1,%0" : "+m" (*(volatile long *) (addr)) : "Ir" (nr));
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
{
 bool negative;
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "andb %2,%1\n\t"
  "\n\tset" "s" " %[_cc_" "s" "]\n"
  : [_cc_s] "=qm" (negative), "+m" (*(volatile long *) (addr))
  : "ir" ((char) ~(1 << nr)) : "memory");
 return negative;
}
# 167 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __clear_bit_unlock(long nr, volatile unsigned long *addr)
{
 __asm__ __volatile__("": : :"memory");
 __clear_bit(nr, addr);
}
# 182 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __change_bit(long nr, volatile unsigned long *addr)
{
 asm volatile("btc %1,%0" : "+m" (*(volatile long *) (addr)) : "Ir" (nr));
}
# 196 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void change_bit(long nr, volatile unsigned long *addr)
{
 if ((__builtin_constant_p(nr))) {
  asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xorb %1,%0"
   : "+m" (*(volatile long *) ((void *)(addr) + ((nr)>>3)))
   : "iq" ((u8)(1 << ((nr) & 7))));
 } else {
  asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "btc %1,%0"
   : "+m" (*(volatile long *) (addr))
   : "Ir" (nr));
 }
}
# 217 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool test_and_set_bit(long nr, volatile unsigned long *addr)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "bts" " %2, " "%0" ";" "\n\tset" "c" " %[_cc_" "c" "]\n" : "+m" (*addr), [_cc_c] "=qm" (c) : "Ir" (nr) : "memory"); return c; } while (0);
}
# 229 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool
test_and_set_bit_lock(long nr, volatile unsigned long *addr)
{
 return test_and_set_bit(nr, addr);
}
# 244 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool __test_and_set_bit(long nr, volatile unsigned long *addr)
{
 bool oldbit;

 asm("bts %2,%1\n\t"
     "\n\tset" "c" " %[_cc_" "c" "]\n"
     : [_cc_c] "=qm" (oldbit), "+m" (*(volatile long *) (addr))
     : "Ir" (nr));
 return oldbit;
}
# 263 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool test_and_clear_bit(long nr, volatile unsigned long *addr)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "btr" " %2, " "%0" ";" "\n\tset" "c" " %[_cc_" "c" "]\n" : "+m" (*addr), [_cc_c] "=qm" (c) : "Ir" (nr) : "memory"); return c; } while (0);
}
# 284 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
{
 bool oldbit;

 asm volatile("btr %2,%1\n\t"
       "\n\tset" "c" " %[_cc_" "c" "]\n"
       : [_cc_c] "=qm" (oldbit), "+m" (*(volatile long *) (addr))
       : "Ir" (nr));
 return oldbit;
}


static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool __test_and_change_bit(long nr, volatile unsigned long *addr)
{
 bool oldbit;

 asm volatile("btc %2,%1\n\t"
       "\n\tset" "c" " %[_cc_" "c" "]\n"
       : [_cc_c] "=qm" (oldbit), "+m" (*(volatile long *) (addr))
       : "Ir" (nr) : "memory");

 return oldbit;
}
# 316 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool test_and_change_bit(long nr, volatile unsigned long *addr)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "btc" " %2, " "%0" ";" "\n\tset" "c" " %[_cc_" "c" "]\n" : "+m" (*addr), [_cc_c] "=qm" (c) : "Ir" (nr) : "memory"); return c; } while (0);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool constant_test_bit(long nr, const volatile unsigned long *addr)
{
 return ((1UL << (nr & (64 -1))) &
  (addr[nr >> 6])) != 0;
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool variable_test_bit(long nr, volatile const unsigned long *addr)
{
 bool oldbit;

 asm volatile("bt %2,%1\n\t"
       "\n\tset" "c" " %[_cc_" "c" "]\n"
       : [_cc_c] "=qm" (oldbit)
       : "m" (*(unsigned long *)addr), "Ir" (nr));

 return oldbit;
}
# 359 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long __ffs(unsigned long word)
{
 asm("rep; bsf %1,%0"
  : "=r" (word)
  : "rm" (word));
 return word;
}







static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long ffz(unsigned long word)
{
 asm("rep; bsf %1,%0"
  : "=r" (word)
  : "r" (~word));
 return word;
}







static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long __fls(unsigned long word)
{
 asm("bsr %1,%0"
     : "=r" (word)
     : "rm" (word));
 return word;
}
# 409 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int ffs(int x)
{
 int r;
# 423 "./arch/x86/include/asm/bitops.h"
 asm("bsfl %1,%0"
     : "=r" (r)
     : "rm" (x), "0" (-1));
# 436 "./arch/x86/include/asm/bitops.h"
 return r + 1;
}
# 450 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int fls(int x)
{
 int r;
# 464 "./arch/x86/include/asm/bitops.h"
 asm("bsrl %1,%0"
     : "=r" (r)
     : "rm" (x), "0" (-1));
# 477 "./arch/x86/include/asm/bitops.h"
 return r + 1;
}
# 492 "./arch/x86/include/asm/bitops.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int fls64(__u64 x)
{
 int bitpos = -1;





 asm("bsrq %1,%q0"
     : "+r" (bitpos)
     : "rm" (x));
 return bitpos + 1;
}





# 1 "./include/asm-generic/bitops/find.h" 1
# 14 "./include/asm-generic/bitops/find.h"
extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
  size, unsigned long offset);
# 28 "./include/asm-generic/bitops/find.h"
extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
  long size, unsigned long offset);
# 42 "./include/asm-generic/bitops/find.h"
extern unsigned long find_first_bit(const unsigned long *addr,
        unsigned long size);
# 53 "./include/asm-generic/bitops/find.h"
extern unsigned long find_first_zero_bit(const unsigned long *addr,
      unsigned long size);
# 510 "./arch/x86/include/asm/bitops.h" 2

# 1 "./include/asm-generic/bitops/sched.h" 1
# 12 "./include/asm-generic/bitops/sched.h"
static inline __attribute__((no_instrument_function)) int sched_find_first_bit(const unsigned long *b)
{

 if (b[0])
  return __ffs(b[0]);
 return __ffs(b[1]) + 64;
# 29 "./include/asm-generic/bitops/sched.h"
}
# 512 "./arch/x86/include/asm/bitops.h" 2

# 1 "./arch/x86/include/asm/arch_hweight.h" 1



# 1 "./arch/x86/include/asm/cpufeatures.h" 1




# 1 "./arch/x86/include/asm/required-features.h" 1
# 6 "./arch/x86/include/asm/cpufeatures.h" 2



# 1 "./arch/x86/include/asm/disabled-features.h" 1
# 10 "./arch/x86/include/asm/cpufeatures.h" 2
# 5 "./arch/x86/include/asm/arch_hweight.h" 2
# 22 "./arch/x86/include/asm/arch_hweight.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned int __arch_hweight32(unsigned int w)
{
 unsigned int res;

 asm ("661:\n\t" "call __sw_hweight32" "\n662:\n" ".skip -(((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")) > 0) * " "((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")),0x90\n" "663" ":\n" ".pushsection .altinstructions,\"a\"\n" " .long 661b - .\n" " .long " "664""1""f - .\n" " .word " "( 4*32+23)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""1""f-""664""1""f" "\n" " .byte " "663""b-662b" "\n" ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" "664""1"":\n\t" ".byte 0xf3,0x0f,0xb8,0xc7" "\n" "665""1" ":\n\t" ".popsection"
    : "=""a" (res)
    : "D" (w));

 return res;
}

static inline __attribute__((no_instrument_function)) unsigned int __arch_hweight16(unsigned int w)
{
 return __arch_hweight32(w & 0xffff);
}

static inline __attribute__((no_instrument_function)) unsigned int __arch_hweight8(unsigned int w)
{
 return __arch_hweight32(w & 0xff);
}
# 50 "./arch/x86/include/asm/arch_hweight.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long __arch_hweight64(__u64 w)
{
 unsigned long res;

 asm ("661:\n\t" "call __sw_hweight64" "\n662:\n" ".skip -(((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")) > 0) * " "((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")),0x90\n" "663" ":\n" ".pushsection .altinstructions,\"a\"\n" " .long 661b - .\n" " .long " "664""1""f - .\n" " .word " "( 4*32+23)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""1""f-""664""1""f" "\n" " .byte " "663""b-662b" "\n" ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" "664""1"":\n\t" ".byte 0xf3,0x48,0x0f,0xb8,0xc7" "\n" "665""1" ":\n\t" ".popsection"
    : "=""a" (res)
    : "D" (w));

 return res;
}
# 514 "./arch/x86/include/asm/bitops.h" 2

# 1 "./include/asm-generic/bitops/const_hweight.h" 1
# 516 "./arch/x86/include/asm/bitops.h" 2

# 1 "./include/asm-generic/bitops/le.h" 1




# 1 "./arch/x86/include/uapi/asm/byteorder.h" 1



# 1 "./include/linux/byteorder/little_endian.h" 1



# 1 "./include/uapi/linux/byteorder/little_endian.h" 1
# 12 "./include/uapi/linux/byteorder/little_endian.h"
# 1 "./include/linux/swab.h" 1



# 1 "./include/uapi/linux/swab.h" 1





# 1 "./arch/x86/include/uapi/asm/swab.h" 1






static inline __attribute__((no_instrument_function)) __attribute__((__const__)) __u32 __arch_swab32(__u32 val)
{
 asm("bswapl %0" : "=r" (val) : "0" (val));
 return val;
}


static inline __attribute__((no_instrument_function)) __attribute__((__const__)) __u64 __arch_swab64(__u64 val)
{
# 30 "./arch/x86/include/uapi/asm/swab.h"
 asm("bswapq %0" : "=r" (val) : "0" (val));
 return val;

}
# 7 "./include/uapi/linux/swab.h" 2
# 46 "./include/uapi/linux/swab.h"
static inline __attribute__((no_instrument_function)) __attribute__((__const__)) __u16 __fswab16(__u16 val)
{



 return ((__u16)( (((__u16)(val) & (__u16)0x00ffU) << 8) | (((__u16)(val) & (__u16)0xff00U) >> 8)));

}

static inline __attribute__((no_instrument_function)) __attribute__((__const__)) __u32 __fswab32(__u32 val)
{

 return __arch_swab32(val);



}

static inline __attribute__((no_instrument_function)) __attribute__((__const__)) __u64 __fswab64(__u64 val)
{

 return __arch_swab64(val);







}

static inline __attribute__((no_instrument_function)) __attribute__((__const__)) __u32 __fswahw32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x0000ffffUL) << 16) | (((__u32)(val) & (__u32)0xffff0000UL) >> 16)));

}

static inline __attribute__((no_instrument_function)) __attribute__((__const__)) __u32 __fswahb32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(val) & (__u32)0xff00ff00UL) >> 8)));

}
# 160 "./include/uapi/linux/swab.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u16 __swab16p(const __u16 *p)
{



 return (__builtin_constant_p((__u16)(*p)) ? ((__u16)( (((__u16)(*p) & (__u16)0x00ffU) << 8) | (((__u16)(*p) & (__u16)0xff00U) >> 8))) : __fswab16(*p));

}





static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u32 __swab32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x000000ffUL) << 24) | (((__u32)(*p) & (__u32)0x0000ff00UL) << 8) | (((__u32)(*p) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(*p) & (__u32)0xff000000UL) >> 24))) : __fswab32(*p));

}





static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u64 __swab64p(const __u64 *p)
{



 return (__builtin_constant_p((__u64)(*p)) ? ((__u64)( (((__u64)(*p) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(*p) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(*p) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(*p) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(*p) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(*p) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(*p) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(*p) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(*p));

}







static inline __attribute__((no_instrument_function)) __u32 __swahw32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x0000ffffUL) << 16) | (((__u32)(*p) & (__u32)0xffff0000UL) >> 16))) : __fswahw32(*p));

}







static inline __attribute__((no_instrument_function)) __u32 __swahb32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(*p) & (__u32)0xff00ff00UL) >> 8))) : __fswahb32(*p));

}





static inline __attribute__((no_instrument_function)) void __swab16s(__u16 *p)
{



 *p = __swab16p(p);

}




static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __swab32s(__u32 *p)
{



 *p = __swab32p(p);

}





static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __swab64s(__u64 *p)
{



 *p = __swab64p(p);

}







static inline __attribute__((no_instrument_function)) void __swahw32s(__u32 *p)
{



 *p = __swahw32p(p);

}







static inline __attribute__((no_instrument_function)) void __swahb32s(__u32 *p)
{



 *p = __swahb32p(p);

}
# 5 "./include/linux/swab.h" 2
# 13 "./include/uapi/linux/byteorder/little_endian.h" 2
# 43 "./include/uapi/linux/byteorder/little_endian.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __le64 __cpu_to_le64p(const __u64 *p)
{
 return ( __le64)*p;
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u64 __le64_to_cpup(const __le64 *p)
{
 return ( __u64)*p;
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __le32 __cpu_to_le32p(const __u32 *p)
{
 return ( __le32)*p;
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u32 __le32_to_cpup(const __le32 *p)
{
 return ( __u32)*p;
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __le16 __cpu_to_le16p(const __u16 *p)
{
 return ( __le16)*p;
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u16 __le16_to_cpup(const __le16 *p)
{
 return ( __u16)*p;
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __be64 __cpu_to_be64p(const __u64 *p)
{
 return ( __be64)__swab64p(p);
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u64 __be64_to_cpup(const __be64 *p)
{
 return __swab64p((__u64 *)p);
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __be32 __cpu_to_be32p(const __u32 *p)
{
 return ( __be32)__swab32p(p);
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u32 __be32_to_cpup(const __be32 *p)
{
 return __swab32p((__u32 *)p);
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __be16 __cpu_to_be16p(const __u16 *p)
{
 return ( __be16)__swab16p(p);
}
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __u16 __be16_to_cpup(const __be16 *p)
{
 return __swab16p((__u16 *)p);
}
# 5 "./include/linux/byteorder/little_endian.h" 2

# 1 "./include/linux/byteorder/generic.h" 1
# 143 "./include/linux/byteorder/generic.h"
static inline __attribute__((no_instrument_function)) void le16_add_cpu(__le16 *var, u16 val)
{
 *var = (( __le16)(__u16)((( __u16)(__le16)(*var)) + val));
}

static inline __attribute__((no_instrument_function)) void le32_add_cpu(__le32 *var, u32 val)
{
 *var = (( __le32)(__u32)((( __u32)(__le32)(*var)) + val));
}

static inline __attribute__((no_instrument_function)) void le64_add_cpu(__le64 *var, u64 val)
{
 *var = (( __le64)(__u64)((( __u64)(__le64)(*var)) + val));
}

static inline __attribute__((no_instrument_function)) void be16_add_cpu(__be16 *var, u16 val)
{
 *var = (( __be16)(__builtin_constant_p((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))) ? ((__u16)( (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0x00ffU) << 8) | (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0xff00U) >> 8))) : __fswab16(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))));
}

static inline __attribute__((no_instrument_function)) void be32_add_cpu(__be32 *var, u32 val)
{
 *var = (( __be32)(__builtin_constant_p((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))) ? ((__u32)( (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))));
}

static inline __attribute__((no_instrument_function)) void be64_add_cpu(__be64 *var, u64 val)
{
 *var = (( __be64)(__builtin_constant_p((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))) ? ((__u64)( (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))));
}
# 7 "./include/linux/byteorder/little_endian.h" 2
# 5 "./arch/x86/include/uapi/asm/byteorder.h" 2
# 6 "./include/asm-generic/bitops/le.h" 2





static inline __attribute__((no_instrument_function)) unsigned long find_next_zero_bit_le(const void *addr,
  unsigned long size, unsigned long offset)
{
 return find_next_zero_bit(addr, size, offset);
}

static inline __attribute__((no_instrument_function)) unsigned long find_next_bit_le(const void *addr,
  unsigned long size, unsigned long offset)
{
 return find_next_bit(addr, size, offset);
}

static inline __attribute__((no_instrument_function)) unsigned long find_first_zero_bit_le(const void *addr,
  unsigned long size)
{
 return find_first_zero_bit(addr, size);
}
# 52 "./include/asm-generic/bitops/le.h"
static inline __attribute__((no_instrument_function)) int test_bit_le(int nr, const void *addr)
{
 return (__builtin_constant_p((nr ^ 0)) ? constant_test_bit((nr ^ 0), (addr)) : variable_test_bit((nr ^ 0), (addr)));
}

static inline __attribute__((no_instrument_function)) void set_bit_le(int nr, void *addr)
{
 set_bit(nr ^ 0, addr);
}

static inline __attribute__((no_instrument_function)) void clear_bit_le(int nr, void *addr)
{
 clear_bit(nr ^ 0, addr);
}

static inline __attribute__((no_instrument_function)) void __set_bit_le(int nr, void *addr)
{
 __set_bit(nr ^ 0, addr);
}

static inline __attribute__((no_instrument_function)) void __clear_bit_le(int nr, void *addr)
{
 __clear_bit(nr ^ 0, addr);
}

static inline __attribute__((no_instrument_function)) int test_and_set_bit_le(int nr, void *addr)
{
 return test_and_set_bit(nr ^ 0, addr);
}

static inline __attribute__((no_instrument_function)) int test_and_clear_bit_le(int nr, void *addr)
{
 return test_and_clear_bit(nr ^ 0, addr);
}

static inline __attribute__((no_instrument_function)) int __test_and_set_bit_le(int nr, void *addr)
{
 return __test_and_set_bit(nr ^ 0, addr);
}

static inline __attribute__((no_instrument_function)) int __test_and_clear_bit_le(int nr, void *addr)
{
 return __test_and_clear_bit(nr ^ 0, addr);
}
# 518 "./arch/x86/include/asm/bitops.h" 2

# 1 "./include/asm-generic/bitops/ext2-atomic-setbit.h" 1
# 520 "./arch/x86/include/asm/bitops.h" 2
# 37 "./include/linux/bitops.h" 2
# 60 "./include/linux/bitops.h"
static inline __attribute__((no_instrument_function)) int get_bitmask_order(unsigned int count)
{
 int order;

 order = fls(count);
 return order;
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long hweight_long(unsigned long w)
{
 return sizeof(w) == 4 ? (__builtin_constant_p(w) ? ((((unsigned int) ((!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))))) + ((unsigned int) ((!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))))))) : __arch_hweight32(w)) : (__builtin_constant_p(w) ? (((((unsigned int) ((!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))))) + ((unsigned int) ((!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))))))) + ((((unsigned int) ((!!(((w) >> 32) & (1ULL << 0))) + (!!(((w) >> 32) & (1ULL << 1))) + (!!(((w) >> 32) & (1ULL << 2))) + (!!(((w) >> 32) & (1ULL << 3))) + (!!(((w) >> 32) & (1ULL << 4))) + (!!(((w) >> 32) & (1ULL << 5))) + (!!(((w) >> 32) & (1ULL << 6))) + (!!(((w) >> 32) & (1ULL << 7))))) + ((unsigned int) ((!!((((w) >> 32) >> 8) & (1ULL << 0))) + (!!((((w) >> 32) >> 8) & (1ULL << 1))) + (!!((((w) >> 32) >> 8) & (1ULL << 2))) + (!!((((w) >> 32) >> 8) & (1ULL << 3))) + (!!((((w) >> 32) >> 8) & (1ULL << 4))) + (!!((((w) >> 32) >> 8) & (1ULL << 5))) + (!!((((w) >> 32) >> 8) & (1ULL << 6))) + (!!((((w) >> 32) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!((((w) >> 32) >> 16) & (1ULL << 0))) + (!!((((w) >> 32) >> 16) & (1ULL << 1))) + (!!((((w) >> 32) >> 16) & (1ULL << 2))) + (!!((((w) >> 32) >> 16) & (1ULL << 3))) + (!!((((w) >> 32) >> 16) & (1ULL << 4))) + (!!((((w) >> 32) >> 16) & (1ULL << 5))) + (!!((((w) >> 32) >> 16) & (1ULL << 6))) + (!!((((w) >> 32) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 0))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 1))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 2))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 3))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 4))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 5))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 6))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 7)))))))) : __arch_hweight64(w));
}






static inline __attribute__((no_instrument_function)) __u64 rol64(__u64 word, unsigned int shift)
{
 return (word << shift) | (word >> (64 - shift));
}






static inline __attribute__((no_instrument_function)) __u64 ror64(__u64 word, unsigned int shift)
{
 return (word >> shift) | (word << (64 - shift));
}






static inline __attribute__((no_instrument_function)) __u32 rol32(__u32 word, unsigned int shift)
{
 return (word << shift) | (word >> ((-shift) & 31));
}






static inline __attribute__((no_instrument_function)) __u32 ror32(__u32 word, unsigned int shift)
{
 return (word >> shift) | (word << (32 - shift));
}






static inline __attribute__((no_instrument_function)) __u16 rol16(__u16 word, unsigned int shift)
{
 return (word << shift) | (word >> (16 - shift));
}






static inline __attribute__((no_instrument_function)) __u16 ror16(__u16 word, unsigned int shift)
{
 return (word >> shift) | (word << (16 - shift));
}






static inline __attribute__((no_instrument_function)) __u8 rol8(__u8 word, unsigned int shift)
{
 return (word << shift) | (word >> (8 - shift));
}






static inline __attribute__((no_instrument_function)) __u8 ror8(__u8 word, unsigned int shift)
{
 return (word >> shift) | (word << (8 - shift));
}
# 160 "./include/linux/bitops.h"
static inline __attribute__((no_instrument_function)) __s32 sign_extend32(__u32 value, int index)
{
 __u8 shift = 31 - index;
 return (__s32)(value << shift) >> shift;
}






static inline __attribute__((no_instrument_function)) __s64 sign_extend64(__u64 value, int index)
{
 __u8 shift = 63 - index;
 return (__s64)(value << shift) >> shift;
}

static inline __attribute__((no_instrument_function)) unsigned fls_long(unsigned long l)
{
 if (sizeof(l) == 4)
  return fls(l);
 return fls64(l);
}

static inline __attribute__((no_instrument_function)) int get_count_order(unsigned int count)
{
 int order;

 order = fls(count) - 1;
 if (count & (count - 1))
  order++;
 return order;
}







static inline __attribute__((no_instrument_function)) int get_count_order_long(unsigned long l)
{
 if (l == 0UL)
  return -1;
 else if (l & (l - 1UL))
  return (int)fls_long(l);
 else
  return (int)fls_long(l) - 1;
}
# 218 "./include/linux/bitops.h"
static inline __attribute__((no_instrument_function)) unsigned long __ffs64(u64 word)
{






 return __ffs((unsigned long)word);
}
# 270 "./include/linux/bitops.h"
extern unsigned long find_last_bit(const unsigned long *addr,
       unsigned long size);
# 11 "./include/linux/kernel.h" 2
# 1 "./include/linux/log2.h" 1
# 25 "./include/linux/log2.h"
static inline __attribute__((no_instrument_function)) __attribute__((const))
int __ilog2_u32(u32 n)
{
 return fls(n) - 1;
}



static inline __attribute__((no_instrument_function)) __attribute__((const))
int __ilog2_u64(u64 n)
{
 return fls64(n) - 1;
}







static inline __attribute__((no_instrument_function)) __attribute__((const))
bool is_power_of_2(unsigned long n)
{
 return (n != 0 && ((n & (n - 1)) == 0));
}




static inline __attribute__((no_instrument_function)) __attribute__((const))
unsigned long __roundup_pow_of_two(unsigned long n)
{
 return 1UL << fls_long(n - 1);
}




static inline __attribute__((no_instrument_function)) __attribute__((const))
unsigned long __rounddown_pow_of_two(unsigned long n)
{
 return 1UL << (fls_long(n) - 1);
}
# 197 "./include/linux/log2.h"
static inline __attribute__((no_instrument_function)) __attribute__((__const__))
int __order_base_2(unsigned long n)
{
 return n > 1 ? ( __builtin_constant_p(n - 1) ? ( (n - 1) < 2 ? 0 : (n - 1) & (1ULL << 63) ? 63 : (n - 1) & (1ULL << 62) ? 62 : (n - 1) & (1ULL << 61) ? 61 : (n - 1) & (1ULL << 60) ? 60 : (n - 1) & (1ULL << 59) ? 59 : (n - 1) & (1ULL << 58) ? 58 : (n - 1) & (1ULL << 57) ? 57 : (n - 1) & (1ULL << 56) ? 56 : (n - 1) & (1ULL << 55) ? 55 : (n - 1) & (1ULL << 54) ? 54 : (n - 1) & (1ULL << 53) ? 53 : (n - 1) & (1ULL << 52) ? 52 : (n - 1) & (1ULL << 51) ? 51 : (n - 1) & (1ULL << 50) ? 50 : (n - 1) & (1ULL << 49) ? 49 : (n - 1) & (1ULL << 48) ? 48 : (n - 1) & (1ULL << 47) ? 47 : (n - 1) & (1ULL << 46) ? 46 : (n - 1) & (1ULL << 45) ? 45 : (n - 1) & (1ULL << 44) ? 44 : (n - 1) & (1ULL << 43) ? 43 : (n - 1) & (1ULL << 42) ? 42 : (n - 1) & (1ULL << 41) ? 41 : (n - 1) & (1ULL << 40) ? 40 : (n - 1) & (1ULL << 39) ? 39 : (n - 1) & (1ULL << 38) ? 38 : (n - 1) & (1ULL << 37) ? 37 : (n - 1) & (1ULL << 36) ? 36 : (n - 1) & (1ULL << 35) ? 35 : (n - 1) & (1ULL << 34) ? 34 : (n - 1) & (1ULL << 33) ? 33 : (n - 1) & (1ULL << 32) ? 32 : (n - 1) & (1ULL << 31) ? 31 : (n - 1) & (1ULL << 30) ? 30 : (n - 1) & (1ULL << 29) ? 29 : (n - 1) & (1ULL << 28) ? 28 : (n - 1) & (1ULL << 27) ? 27 : (n - 1) & (1ULL << 26) ? 26 : (n - 1) & (1ULL << 25) ? 25 : (n - 1) & (1ULL << 24) ? 24 : (n - 1) & (1ULL << 23) ? 23 : (n - 1) & (1ULL << 22) ? 22 : (n - 1) & (1ULL << 21) ? 21 : (n - 1) & (1ULL << 20) ? 20 : (n - 1) & (1ULL << 19) ? 19 : (n - 1) & (1ULL << 18) ? 18 : (n - 1) & (1ULL << 17) ? 17 : (n - 1) & (1ULL << 16) ? 16 : (n - 1) & (1ULL << 15) ? 15 : (n - 1) & (1ULL << 14) ? 14 : (n - 1) & (1ULL << 13) ? 13 : (n - 1) & (1ULL << 12) ? 12 : (n - 1) & (1ULL << 11) ? 11 : (n - 1) & (1ULL << 10) ? 10 : (n - 1) & (1ULL << 9) ? 9 : (n - 1) & (1ULL << 8) ? 8 : (n - 1) & (1ULL << 7) ? 7 : (n - 1) & (1ULL << 6) ? 6 : (n - 1) & (1ULL << 5) ? 5 : (n - 1) & (1ULL << 4) ? 4 : (n - 1) & (1ULL << 3) ? 3 : (n - 1) & (1ULL << 2) ? 2 : 1 ) : (sizeof(n - 1) <= 4) ? __ilog2_u32(n - 1) : __ilog2_u64(n - 1) ) + 1 : 0;
}
# 12 "./include/linux/kernel.h" 2
# 1 "./include/linux/typecheck.h" 1
# 13 "./include/linux/kernel.h" 2
# 1 "./include/linux/printk.h" 1




# 1 "./include/linux/init.h" 1
# 108 "./include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);

extern initcall_t __con_initcall_start[], __con_initcall_end[];
extern initcall_t __security_initcall_start[], __security_initcall_end[];


typedef void (*ctor_fn_t)(void);


extern int do_one_initcall(initcall_t fn);
extern char __attribute__ ((__section__(".init.data"))) boot_command_line[];
extern char *saved_command_line;
extern unsigned int reset_devices;


void setup_arch(char **);
void prepare_namespace(void);
void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) load_default_modules(void);
int __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) init_rootfs(void);


extern bool rodata_enabled;


void mark_rodata_ro(void);


extern void (*late_time_init)(void);

extern bool initcall_debug;
# 6 "./include/linux/printk.h" 2
# 1 "./include/linux/kern_levels.h" 1
# 7 "./include/linux/printk.h" 2

# 1 "./include/linux/cache.h" 1



# 1 "./include/uapi/linux/kernel.h" 1



# 1 "./include/uapi/linux/sysinfo.h" 1






struct sysinfo {
 __kernel_long_t uptime;
 __kernel_ulong_t loads[3];
 __kernel_ulong_t totalram;
 __kernel_ulong_t freeram;
 __kernel_ulong_t sharedram;
 __kernel_ulong_t bufferram;
 __kernel_ulong_t totalswap;
 __kernel_ulong_t freeswap;
 __u16 procs;
 __u16 pad;
 __kernel_ulong_t totalhigh;
 __kernel_ulong_t freehigh;
 __u32 mem_unit;
 char _f[20-2*sizeof(__kernel_ulong_t)-sizeof(__u32)];
};
# 5 "./include/uapi/linux/kernel.h" 2
# 5 "./include/linux/cache.h" 2
# 1 "./arch/x86/include/asm/cache.h" 1
# 6 "./include/linux/cache.h" 2
# 9 "./include/linux/printk.h" 2

extern const char linux_banner[];
extern const char linux_proc_banner[];



static inline __attribute__((no_instrument_function)) int printk_get_level(const char *buffer)
{
 if (buffer[0] == '\001' && buffer[1]) {
  switch (buffer[1]) {
  case '0' ... '7':
  case 'd':
  case 'c':
   return buffer[1];
  }
 }
 return 0;
}

static inline __attribute__((no_instrument_function)) const char *printk_skip_level(const char *buffer)
{
 if (printk_get_level(buffer))
  return buffer + 2;

 return buffer;
}

static inline __attribute__((no_instrument_function)) const char *printk_skip_headers(const char *buffer)
{
 while (printk_get_level(buffer))
  buffer = printk_skip_level(buffer);

 return buffer;
}
# 62 "./include/linux/printk.h"
extern int console_printk[];






static inline __attribute__((no_instrument_function)) void console_silent(void)
{
 (console_printk[0]) = 0;
}

static inline __attribute__((no_instrument_function)) void console_verbose(void)
{
 if ((console_printk[0]))
  (console_printk[0]) = 15;
}



extern char devkmsg_log_str[];
struct ctl_table;

struct va_format {
 const char *fmt;
 va_list *va;
};
# 142 "./include/linux/printk.h"
extern __attribute__((format(printf, 1, 2)))
void early_printk(const char *fmt, ...);






extern void printk_nmi_enter(void);
extern void printk_nmi_exit(void);






           __attribute__((format(printf, 5, 0)))
int vprintk_emit(int facility, int level,
   const char *dict, size_t dictlen,
   const char *fmt, va_list args);

           __attribute__((format(printf, 1, 0)))
int vprintk(const char *fmt, va_list args);

           __attribute__((format(printf, 5, 6)))
int printk_emit(int facility, int level,
  const char *dict, size_t dictlen,
  const char *fmt, ...);

           __attribute__((format(printf, 1, 2)))
int printk(const char *fmt, ...);




__attribute__((format(printf, 1, 2))) int printk_deferred(const char *fmt, ...);






extern int __printk_ratelimit(const char *func);

extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
       unsigned int interval_msec);

extern int printk_delay_msec;
extern int dmesg_restrict;
extern int kptr_restrict;

extern int
devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write, void *buf,
     size_t *lenp, loff_t *ppos);

extern void wake_up_klogd(void);

char *log_buf_addr_get(void);
u32 log_buf_len_get(void);
void log_buf_kexec_setup(void);
void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) setup_log_buf(int early);
__attribute__((format(printf, 1, 2))) void dump_stack_set_arch_desc(const char *fmt, ...);
void dump_stack_print_info(const char *log_lvl);
void show_regs_print_info(const char *log_lvl);
extern void printk_safe_init(void);
extern void printk_safe_flush(void);
extern void printk_safe_flush_on_panic(void);
# 282 "./include/linux/printk.h"
extern void dump_stack(void) ;
# 474 "./include/linux/printk.h"
extern const struct file_operations kmsg_fops;

enum {
 DUMP_PREFIX_NONE,
 DUMP_PREFIX_ADDRESS,
 DUMP_PREFIX_OFFSET
};
extern int hex_dump_to_buffer(const void *buf, size_t len, int rowsize,
         int groupsize, char *linebuf, size_t linebuflen,
         bool ascii);

extern void print_hex_dump(const char *level, const char *prefix_str,
      int prefix_type, int rowsize, int groupsize,
      const void *buf, size_t len, bool ascii);




extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
     const void *buf, size_t len);
# 519 "./include/linux/printk.h"
static inline __attribute__((no_instrument_function)) void print_hex_dump_debug(const char *prefix_str, int prefix_type,
     int rowsize, int groupsize,
     const void *buf, size_t len, bool ascii)
{
}
# 14 "./include/linux/kernel.h" 2
# 178 "./include/linux/kernel.h"
struct completion;
struct pt_regs;
struct user;


extern int _cond_resched(void);
# 206 "./include/linux/kernel.h"
  static inline __attribute__((no_instrument_function)) void ___might_sleep(const char *file, int line,
       int preempt_offset) { }
  static inline __attribute__((no_instrument_function)) void __might_sleep(const char *file, int line,
       int preempt_offset) { }
# 253 "./include/linux/kernel.h"
static inline __attribute__((no_instrument_function)) u32 reciprocal_scale(u32 val, u32 ep_ro)
{
 return (u32)(((u64) val * ep_ro) >> 32);
}






static inline __attribute__((no_instrument_function)) void might_fault(void) { }


extern struct atomic_notifier_head panic_notifier_list;
extern long (*panic_blink)(int state);
__attribute__((format(printf, 1, 2)))
void panic(const char *fmt, ...) __attribute__((noreturn)) ;
void nmi_panic(struct pt_regs *regs, const char *msg);
extern void oops_enter(void);
extern void oops_exit(void);
void print_oops_end_marker(void);
extern int oops_may_print(void);
void do_exit(long error_code) __attribute__((noreturn));
void complete_and_exit(struct completion *, long) __attribute__((noreturn));


int __attribute__((warn_unused_result)) _kstrtoul(const char *s, unsigned int base, unsigned long *res);
int __attribute__((warn_unused_result)) _kstrtol(const char *s, unsigned int base, long *res);

int __attribute__((warn_unused_result)) kstrtoull(const char *s, unsigned int base, unsigned long long *res);
int __attribute__((warn_unused_result)) kstrtoll(const char *s, unsigned int base, long long *res);
# 301 "./include/linux/kernel.h"
static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtoul(const char *s, unsigned int base, unsigned long *res)
{




 if (sizeof(unsigned long) == sizeof(unsigned long long) &&
     __alignof__(unsigned long) == __alignof__(unsigned long long))
  return kstrtoull(s, base, (unsigned long long *)res);
 else
  return _kstrtoul(s, base, res);
}
# 330 "./include/linux/kernel.h"
static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtol(const char *s, unsigned int base, long *res)
{




 if (sizeof(long) == sizeof(long long) &&
     __alignof__(long) == __alignof__(long long))
  return kstrtoll(s, base, (long long *)res);
 else
  return _kstrtol(s, base, res);
}

int __attribute__((warn_unused_result)) kstrtouint(const char *s, unsigned int base, unsigned int *res);
int __attribute__((warn_unused_result)) kstrtoint(const char *s, unsigned int base, int *res);

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtou64(const char *s, unsigned int base, u64 *res)
{
 return kstrtoull(s, base, res);
}

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtos64(const char *s, unsigned int base, s64 *res)
{
 return kstrtoll(s, base, res);
}

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtou32(const char *s, unsigned int base, u32 *res)
{
 return kstrtouint(s, base, res);
}

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtos32(const char *s, unsigned int base, s32 *res)
{
 return kstrtoint(s, base, res);
}

int __attribute__((warn_unused_result)) kstrtou16(const char *s, unsigned int base, u16 *res);
int __attribute__((warn_unused_result)) kstrtos16(const char *s, unsigned int base, s16 *res);
int __attribute__((warn_unused_result)) kstrtou8(const char *s, unsigned int base, u8 *res);
int __attribute__((warn_unused_result)) kstrtos8(const char *s, unsigned int base, s8 *res);
int __attribute__((warn_unused_result)) kstrtobool(const char *s, bool *res);

int __attribute__((warn_unused_result)) kstrtoull_from_user(const char *s, size_t count, unsigned int base, unsigned long long *res);
int __attribute__((warn_unused_result)) kstrtoll_from_user(const char *s, size_t count, unsigned int base, long long *res);
int __attribute__((warn_unused_result)) kstrtoul_from_user(const char *s, size_t count, unsigned int base, unsigned long *res);
int __attribute__((warn_unused_result)) kstrtol_from_user(const char *s, size_t count, unsigned int base, long *res);
int __attribute__((warn_unused_result)) kstrtouint_from_user(const char *s, size_t count, unsigned int base, unsigned int *res);
int __attribute__((warn_unused_result)) kstrtoint_from_user(const char *s, size_t count, unsigned int base, int *res);
int __attribute__((warn_unused_result)) kstrtou16_from_user(const char *s, size_t count, unsigned int base, u16 *res);
int __attribute__((warn_unused_result)) kstrtos16_from_user(const char *s, size_t count, unsigned int base, s16 *res);
int __attribute__((warn_unused_result)) kstrtou8_from_user(const char *s, size_t count, unsigned int base, u8 *res);
int __attribute__((warn_unused_result)) kstrtos8_from_user(const char *s, size_t count, unsigned int base, s8 *res);
int __attribute__((warn_unused_result)) kstrtobool_from_user(const char *s, size_t count, bool *res);

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtou64_from_user(const char *s, size_t count, unsigned int base, u64 *res)
{
 return kstrtoull_from_user(s, count, base, res);
}

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtos64_from_user(const char *s, size_t count, unsigned int base, s64 *res)
{
 return kstrtoll_from_user(s, count, base, res);
}

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtou32_from_user(const char *s, size_t count, unsigned int base, u32 *res)
{
 return kstrtouint_from_user(s, count, base, res);
}

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtos32_from_user(const char *s, size_t count, unsigned int base, s32 *res)
{
 return kstrtoint_from_user(s, count, base, res);
}



extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);

extern int num_to_str(char *buf, int size, unsigned long long num);



extern __attribute__((format(printf, 2, 3))) int sprintf(char *buf, const char * fmt, ...);
extern __attribute__((format(printf, 2, 0))) int vsprintf(char *buf, const char *, va_list);
extern __attribute__((format(printf, 3, 4)))
int snprintf(char *buf, size_t size, const char *fmt, ...);
extern __attribute__((format(printf, 3, 0)))
int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
extern __attribute__((format(printf, 3, 4)))
int scnprintf(char *buf, size_t size, const char *fmt, ...);
extern __attribute__((format(printf, 3, 0)))
int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);
extern __attribute__((format(printf, 2, 3))) __attribute__((__malloc__))
char *kasprintf(gfp_t gfp, const char *fmt, ...);
extern __attribute__((format(printf, 2, 0))) __attribute__((__malloc__))
char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
extern __attribute__((format(printf, 2, 0)))
const char *kvasprintf_const(gfp_t gfp, const char *fmt, va_list args);

extern __attribute__((format(scanf, 2, 3)))
int sscanf(const char *, const char *, ...);
extern __attribute__((format(scanf, 2, 0)))
int vsscanf(const char *, const char *, va_list);

extern int get_option(char **str, int *pint);
extern char *get_options(const char *str, int nints, int *ints);
extern unsigned long long memparse(const char *ptr, char **retptr);
extern bool parse_option_str(const char *str, const char *option);

extern int core_kernel_text(unsigned long addr);
extern int core_kernel_data(unsigned long addr);
extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int func_ptr_is_kernel_text(void *ptr);

unsigned long int_sqrt(unsigned long);

extern void bust_spinlocks(int yes);
extern int oops_in_progress;
extern int panic_timeout;
extern int panic_on_oops;
extern int panic_on_unrecovered_nmi;
extern int panic_on_io_nmi;
extern int panic_on_warn;
extern int sysctl_panic_on_rcu_stall;
extern int sysctl_panic_on_stackoverflow;

extern bool crash_kexec_post_notifiers;






extern atomic_t panic_cpu;






static inline __attribute__((no_instrument_function)) void set_arch_panic_timeout(int timeout, int arch_default_timeout)
{
 if (panic_timeout == arch_default_timeout)
  panic_timeout = timeout;
}
extern const char *print_tainted(void);
enum lockdep_ok {
 LOCKDEP_STILL_OK,
 LOCKDEP_NOW_UNRELIABLE
};
extern void add_taint(unsigned flag, enum lockdep_ok);
extern int test_taint(unsigned flag);
extern unsigned long get_taint(void);
extern int root_mountflags;

extern bool early_boot_irqs_disabled;


extern enum system_states {
 SYSTEM_BOOTING,
 SYSTEM_RUNNING,
 SYSTEM_HALT,
 SYSTEM_POWER_OFF,
 SYSTEM_RESTART,
} system_state;
# 518 "./include/linux/kernel.h"
struct taint_flag {
 char c_true;
 char c_false;
 bool module;
};

extern const struct taint_flag taint_flags[16];

extern const char hex_asc[];



static inline __attribute__((no_instrument_function)) char *hex_byte_pack(char *buf, u8 byte)
{
 *buf++ = hex_asc[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc[((byte) & 0x0f)];
 return buf;
}

extern const char hex_asc_upper[];



static inline __attribute__((no_instrument_function)) char *hex_byte_pack_upper(char *buf, u8 byte)
{
 *buf++ = hex_asc_upper[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc_upper[((byte) & 0x0f)];
 return buf;
}

extern int hex_to_bin(char ch);
extern int __attribute__((warn_unused_result)) hex2bin(u8 *dst, const char *src, size_t count);
extern char *bin2hex(char *dst, const void *src, size_t count);

bool mac_pton(const char *s, u8 *mac);
# 574 "./include/linux/kernel.h"
enum ftrace_dump_mode {
 DUMP_NONE,
 DUMP_ALL,
 DUMP_ORIG,
};


void tracing_on(void);
void tracing_off(void);
int tracing_is_on(void);
void tracing_snapshot(void);
void tracing_snapshot_alloc(void);

extern void tracing_start(void);
extern void tracing_stop(void);

static inline __attribute__((no_instrument_function)) __attribute__((format(printf, 1, 2)))
void ____trace_printk_check_format(const char *fmt, ...)
{
}
# 653 "./include/linux/kernel.h"
extern __attribute__((format(printf, 2, 3)))
int __trace_bprintk(unsigned long ip, const char *fmt, ...);

extern __attribute__((format(printf, 2, 3)))
int __trace_printk(unsigned long ip, const char *fmt, ...);
# 694 "./include/linux/kernel.h"
extern int __trace_bputs(unsigned long ip, const char *str);
extern int __trace_puts(unsigned long ip, const char *str, int size);

extern void trace_dump_stack(int skip);
# 716 "./include/linux/kernel.h"
extern __attribute__((format(printf, 2, 0))) int
__ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);

extern __attribute__((format(printf, 2, 0))) int
__ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);

extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
# 9 "./include/linux/list.h" 2
# 25 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void INIT_LIST_HEAD(struct list_head *list)
{
 ({ union { typeof(list->next) __val; char __c[1]; } __u = { .__val = ( typeof(list->next)) (list) }; __write_once_size(&(list->next), __u.__c, sizeof(list->next)); __u.__val; });
 list->prev = list;
}







static inline __attribute__((no_instrument_function)) bool __list_add_valid(struct list_head *new,
    struct list_head *prev,
    struct list_head *next)
{
 return true;
}
static inline __attribute__((no_instrument_function)) bool __list_del_entry_valid(struct list_head *entry)
{
 return true;
}
# 55 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void __list_add(struct list_head *new,
         struct list_head *prev,
         struct list_head *next)
{
 if (!__list_add_valid(new, prev, next))
  return;

 next->prev = new;
 new->next = next;
 new->prev = prev;
 ({ union { typeof(prev->next) __val; char __c[1]; } __u = { .__val = ( typeof(prev->next)) (new) }; __write_once_size(&(prev->next), __u.__c, sizeof(prev->next)); __u.__val; });
}
# 76 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}
# 90 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);
}
# 102 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void __list_del(struct list_head * prev, struct list_head * next)
{
 next->prev = prev;
 ({ union { typeof(prev->next) __val; char __c[1]; } __u = { .__val = ( typeof(prev->next)) (next) }; __write_once_size(&(prev->next), __u.__c, sizeof(prev->next)); __u.__val; });
}







static inline __attribute__((no_instrument_function)) void __list_del_entry(struct list_head *entry)
{
 if (!__list_del_entry_valid(entry))
  return;

 __list_del(entry->prev, entry->next);
}

static inline __attribute__((no_instrument_function)) void list_del(struct list_head *entry)
{
 __list_del_entry(entry);
 entry->next = ((void *) 0x100 + (0xdead000000000000UL));
 entry->prev = ((void *) 0x200 + (0xdead000000000000UL));
}
# 136 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void list_replace(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->next->prev = new;
 new->prev = old->prev;
 new->prev->next = new;
}

static inline __attribute__((no_instrument_function)) void list_replace_init(struct list_head *old,
     struct list_head *new)
{
 list_replace(old, new);
 INIT_LIST_HEAD(old);
}





static inline __attribute__((no_instrument_function)) void list_del_init(struct list_head *entry)
{
 __list_del_entry(entry);
 INIT_LIST_HEAD(entry);
}






static inline __attribute__((no_instrument_function)) void list_move(struct list_head *list, struct list_head *head)
{
 __list_del_entry(list);
 list_add(list, head);
}






static inline __attribute__((no_instrument_function)) void list_move_tail(struct list_head *list,
      struct list_head *head)
{
 __list_del_entry(list);
 list_add_tail(list, head);
}






static inline __attribute__((no_instrument_function)) int list_is_last(const struct list_head *list,
    const struct list_head *head)
{
 return list->next == head;
}





static inline __attribute__((no_instrument_function)) int list_empty(const struct list_head *head)
{
 return ({ union { typeof(head->next) __val; char __c[1]; } __u; if (1) __read_once_size(&(head->next), __u.__c, sizeof(head->next)); else __read_once_size_nocheck(&(head->next), __u.__c, sizeof(head->next)); __u.__val; }) == head;
}
# 218 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) int list_empty_careful(const struct list_head *head)
{
 struct list_head *next = head->next;
 return (next == head) && (next == head->prev);
}





static inline __attribute__((no_instrument_function)) void list_rotate_left(struct list_head *head)
{
 struct list_head *first;

 if (!list_empty(head)) {
  first = head->next;
  list_move_tail(first, head);
 }
}





static inline __attribute__((no_instrument_function)) int list_is_singular(const struct list_head *head)
{
 return !list_empty(head) && (head->next == head->prev);
}

static inline __attribute__((no_instrument_function)) void __list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 struct list_head *new_first = entry->next;
 list->next = head->next;
 list->next->prev = list;
 list->prev = entry;
 entry->next = list;
 head->next = new_first;
 new_first->prev = head;
}
# 273 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 if (list_empty(head))
  return;
 if (list_is_singular(head) &&
  (head->next != entry && head != entry))
  return;
 if (entry == head)
  INIT_LIST_HEAD(list);
 else
  __list_cut_position(list, head, entry);
}

static inline __attribute__((no_instrument_function)) void __list_splice(const struct list_head *list,
     struct list_head *prev,
     struct list_head *next)
{
 struct list_head *first = list->next;
 struct list_head *last = list->prev;

 first->prev = prev;
 prev->next = first;

 last->next = next;
 next->prev = last;
}






static inline __attribute__((no_instrument_function)) void list_splice(const struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head, head->next);
}






static inline __attribute__((no_instrument_function)) void list_splice_tail(struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head->prev, head);
}
# 332 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void list_splice_init(struct list_head *list,
        struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head, head->next);
  INIT_LIST_HEAD(list);
 }
}
# 349 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void list_splice_tail_init(struct list_head *list,
      struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head->prev, head);
  INIT_LIST_HEAD(list);
 }
}
# 627 "./include/linux/list.h"
static inline __attribute__((no_instrument_function)) void INIT_HLIST_NODE(struct hlist_node *h)
{
 h->next = ((void *)0);
 h->pprev = ((void *)0);
}

static inline __attribute__((no_instrument_function)) int hlist_unhashed(const struct hlist_node *h)
{
 return !h->pprev;
}

static inline __attribute__((no_instrument_function)) int hlist_empty(const struct hlist_head *h)
{
 return !({ union { typeof(h->first) __val; char __c[1]; } __u; if (1) __read_once_size(&(h->first), __u.__c, sizeof(h->first)); else __read_once_size_nocheck(&(h->first), __u.__c, sizeof(h->first)); __u.__val; });
}

static inline __attribute__((no_instrument_function)) void __hlist_del(struct hlist_node *n)
{
 struct hlist_node *next = n->next;
 struct hlist_node **pprev = n->pprev;

 ({ union { typeof(*pprev) __val; char __c[1]; } __u = { .__val = ( typeof(*pprev)) (next) }; __write_once_size(&(*pprev), __u.__c, sizeof(*pprev)); __u.__val; });
 if (next)
  next->pprev = pprev;
}

static inline __attribute__((no_instrument_function)) void hlist_del(struct hlist_node *n)
{
 __hlist_del(n);
 n->next = ((void *) 0x100 + (0xdead000000000000UL));
 n->pprev = ((void *) 0x200 + (0xdead000000000000UL));
}

static inline __attribute__((no_instrument_function)) void hlist_del_init(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  INIT_HLIST_NODE(n);
 }
}

static inline __attribute__((no_instrument_function)) void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
{
 struct hlist_node *first = h->first;
 n->next = first;
 if (first)
  first->pprev = &n->next;
 ({ union { typeof(h->first) __val; char __c[1]; } __u = { .__val = ( typeof(h->first)) (n) }; __write_once_size(&(h->first), __u.__c, sizeof(h->first)); __u.__val; });
 n->pprev = &h->first;
}


static inline __attribute__((no_instrument_function)) void hlist_add_before(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev = next->pprev;
 n->next = next;
 next->pprev = &n->next;
 ({ union { typeof(*(n->pprev)) __val; char __c[1]; } __u = { .__val = ( typeof(*(n->pprev))) (n) }; __write_once_size(&(*(n->pprev)), __u.__c, sizeof(*(n->pprev))); __u.__val; });
}

static inline __attribute__((no_instrument_function)) void hlist_add_behind(struct hlist_node *n,
        struct hlist_node *prev)
{
 n->next = prev->next;
 ({ union { typeof(prev->next) __val; char __c[1]; } __u = { .__val = ( typeof(prev->next)) (n) }; __write_once_size(&(prev->next), __u.__c, sizeof(prev->next)); __u.__val; });
 n->pprev = &prev->next;

 if (n->next)
  n->next->pprev = &n->next;
}


static inline __attribute__((no_instrument_function)) void hlist_add_fake(struct hlist_node *n)
{
 n->pprev = &n->next;
}

static inline __attribute__((no_instrument_function)) bool hlist_fake(struct hlist_node *h)
{
 return h->pprev == &h->next;
}





static inline __attribute__((no_instrument_function)) bool
hlist_is_singular_node(struct hlist_node *n, struct hlist_head *h)
{
 return !n->next && n->pprev == &h->first;
}





static inline __attribute__((no_instrument_function)) void hlist_move_list(struct hlist_head *old,
       struct hlist_head *new)
{
 new->first = old->first;
 if (new->first)
  new->first->pprev = &new->first;
 old->first = ((void *)0);
}
# 10 "./include/linux/module.h" 2
# 1 "./include/linux/stat.h" 1




# 1 "./arch/x86/include/uapi/asm/stat.h" 1



# 1 "./arch/x86/include/asm/posix_types.h" 1
# 5 "./arch/x86/include/uapi/asm/stat.h" 2
# 82 "./arch/x86/include/uapi/asm/stat.h"
struct stat {
 __kernel_ulong_t st_dev;
 __kernel_ulong_t st_ino;
 __kernel_ulong_t st_nlink;

 unsigned int st_mode;
 unsigned int st_uid;
 unsigned int st_gid;
 unsigned int __pad0;
 __kernel_ulong_t st_rdev;
 __kernel_long_t st_size;
 __kernel_long_t st_blksize;
 __kernel_long_t st_blocks;

 __kernel_ulong_t st_atime;
 __kernel_ulong_t st_atime_nsec;
 __kernel_ulong_t st_mtime;
 __kernel_ulong_t st_mtime_nsec;
 __kernel_ulong_t st_ctime;
 __kernel_ulong_t st_ctime_nsec;
 __kernel_long_t __unused[3];
};
# 116 "./arch/x86/include/uapi/asm/stat.h"
struct __old_kernel_stat {
 unsigned short st_dev;
 unsigned short st_ino;
 unsigned short st_mode;
 unsigned short st_nlink;
 unsigned short st_uid;
 unsigned short st_gid;
 unsigned short st_rdev;






 unsigned int st_size;
 unsigned int st_atime;
 unsigned int st_mtime;
 unsigned int st_ctime;

};
# 6 "./include/linux/stat.h" 2
# 1 "./include/uapi/linux/stat.h" 1
# 59 "./include/uapi/linux/stat.h"
struct statx_timestamp {
 __s64 tv_sec;
 __s32 tv_nsec;
 __s32 __reserved;
};
# 102 "./include/uapi/linux/stat.h"
struct statx {

 __u32 stx_mask;
 __u32 stx_blksize;
 __u64 stx_attributes;

 __u32 stx_nlink;
 __u32 stx_uid;
 __u32 stx_gid;
 __u16 stx_mode;
 __u16 __spare0[1];

 __u64 stx_ino;
 __u64 stx_size;
 __u64 stx_blocks;
 __u64 __spare1[1];

 struct statx_timestamp stx_atime;
 struct statx_timestamp stx_btime;
 struct statx_timestamp stx_ctime;
 struct statx_timestamp stx_mtime;

 __u32 stx_rdev_major;
 __u32 stx_rdev_minor;
 __u32 stx_dev_major;
 __u32 stx_dev_minor;

 __u64 __spare2[14];

};
# 7 "./include/linux/stat.h" 2
# 18 "./include/linux/stat.h"
# 1 "./include/linux/time.h" 1




# 1 "./include/linux/seqlock.h" 1
# 35 "./include/linux/seqlock.h"
# 1 "./include/linux/spinlock.h" 1
# 50 "./include/linux/spinlock.h"
# 1 "./include/linux/preempt.h" 1
# 80 "./include/linux/preempt.h"
# 1 "./arch/x86/include/asm/preempt.h" 1




# 1 "./arch/x86/include/asm/percpu.h" 1
# 87 "./arch/x86/include/asm/percpu.h"
extern void __bad_percpu_size(void);
# 510 "./arch/x86/include/asm/percpu.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool x86_this_cpu_constant_test_bit(unsigned int nr,
                        const unsigned long *addr)
{
 unsigned long *a =
  (unsigned long *)addr + nr / 64;


 return ((1UL << (nr % 64)) & ({ typeof(*a) pfo_ret__; switch (sizeof(*a)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (*a)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (*a)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (*a)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (*a)); break; default: __bad_percpu_size(); } pfo_ret__; })) != 0;



}

static inline __attribute__((no_instrument_function)) bool x86_this_cpu_variable_test_bit(int nr,
                        const unsigned long *addr)
{
 bool oldbit;

 asm volatile("bt ""%%""gs"":" "%" "2"",%1\n\t"
   "\n\tset" "c" " %[_cc_" "c" "]\n"
   : [_cc_c] "=qm" (oldbit)
   : "m" (*(unsigned long *)addr), "Ir" (nr));

 return oldbit;
}








# 1 "./include/asm-generic/percpu.h" 1




# 1 "./include/linux/threads.h" 1
# 6 "./include/asm-generic/percpu.h" 2
# 1 "./include/linux/percpu-defs.h" 1
# 295 "./include/linux/percpu-defs.h"
extern void __bad_size_call_parameter(void);




static inline __attribute__((no_instrument_function)) void __this_cpu_preempt_check(const char *op) { }
# 7 "./include/asm-generic/percpu.h" 2
# 18 "./include/asm-generic/percpu.h"
extern unsigned long __per_cpu_offset[64];
# 47 "./include/asm-generic/percpu.h"
extern void setup_per_cpu_areas(void);
# 543 "./arch/x86/include/asm/percpu.h" 2


extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(unsigned long) this_cpu_off;
# 6 "./arch/x86/include/asm/preempt.h" 2
# 1 "./include/linux/thread_info.h" 1
# 11 "./include/linux/thread_info.h"
# 1 "./include/linux/bug.h" 1



# 1 "./arch/x86/include/asm/bug.h" 1
# 35 "./arch/x86/include/asm/bug.h"
# 1 "./include/asm-generic/bug.h" 1
# 18 "./include/asm-generic/bug.h"
struct bug_entry {



 signed int bug_addr_disp;





 signed int file_disp;

 unsigned short line;

 unsigned short flags;
};
# 65 "./include/asm-generic/bug.h"
extern __attribute__((format(printf, 3, 4)))
void warn_slowpath_fmt(const char *file, const int line,
         const char *fmt, ...);
extern __attribute__((format(printf, 4, 5)))
void warn_slowpath_fmt_taint(const char *file, const int line, unsigned taint,
        const char *fmt, ...);
extern void warn_slowpath_null(const char *file, const int line);
# 85 "./include/asm-generic/bug.h"
struct warn_args;

void __warn(const char *file, int line, void *caller, unsigned taint,
     struct pt_regs *regs, struct warn_args *args);
# 36 "./arch/x86/include/asm/bug.h" 2
# 5 "./include/linux/bug.h" 2


enum bug_trap_type {
 BUG_TRAP_TYPE_NONE = 0,
 BUG_TRAP_TYPE_WARN = 1,
 BUG_TRAP_TYPE_BUG = 2,
};

struct pt_regs;
# 103 "./include/linux/bug.h"
static inline __attribute__((no_instrument_function)) int is_warning_bug(const struct bug_entry *bug)
{
 return bug->flags & (1 << 0);
}

const struct bug_entry *find_bug(unsigned long bugaddr);

enum bug_trap_type report_bug(unsigned long bug_addr, struct pt_regs *regs);


int is_valid_bugaddr(unsigned long addr);
# 129 "./include/linux/bug.h"
static inline __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool check_data_corruption(bool v) { return v; }
# 12 "./include/linux/thread_info.h" 2
# 1 "./include/linux/restart_block.h" 1
# 10 "./include/linux/restart_block.h"
struct timespec;
struct compat_timespec;
struct pollfd;




struct restart_block {
 long (*fn)(struct restart_block *);
 union {

  struct {
   u32 *uaddr;
   u32 val;
   u32 flags;
   u32 bitset;
   u64 time;
   u32 *uaddr2;
  } futex;

  struct {
   clockid_t clockid;
   struct timespec *rmtp;

   struct compat_timespec *compat_rmtp;

   u64 expires;
  } nanosleep;

  struct {
   struct pollfd *ufds;
   int nfds;
   int has_timeout;
   unsigned long tv_sec;
   unsigned long tv_nsec;
  } poll;
 };
};

extern long do_no_restart_syscall(struct restart_block *parm);
# 13 "./include/linux/thread_info.h" 2







# 1 "./arch/x86/include/asm/current.h" 1







struct task_struct;

extern __attribute__((section(".data..percpu" ""))) __typeof__(struct task_struct *) current_task;

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) struct task_struct *get_current(void)
{
 return ({ typeof(current_task) pfo_ret__; switch (sizeof(current_task)) { case 1: asm("mov" "b ""%%""gs"":" "%" "P1"",%0" : "=q" (pfo_ret__) : "p" (&(current_task))); break; case 2: asm("mov" "w ""%%""gs"":" "%" "P1"",%0" : "=r" (pfo_ret__) : "p" (&(current_task))); break; case 4: asm("mov" "l ""%%""gs"":" "%" "P1"",%0" : "=r" (pfo_ret__) : "p" (&(current_task))); break; case 8: asm("mov" "q ""%%""gs"":" "%" "P1"",%0" : "=r" (pfo_ret__) : "p" (&(current_task))); break; default: __bad_percpu_size(); } pfo_ret__; });
}
# 21 "./include/linux/thread_info.h" 2




# 1 "./arch/x86/include/asm/thread_info.h" 1
# 11 "./arch/x86/include/asm/thread_info.h"
# 1 "./arch/x86/include/asm/page.h" 1







# 1 "./arch/x86/include/asm/page_types.h" 1
# 47 "./arch/x86/include/asm/page_types.h"
# 1 "./arch/x86/include/asm/page_64_types.h" 1




# 1 "./arch/x86/include/asm/kaslr.h" 1



unsigned long kaslr_get_random_long(const char *purpose);
# 13 "./arch/x86/include/asm/kaslr.h"
static inline __attribute__((no_instrument_function)) void kernel_randomize_memory(void) { }
# 6 "./arch/x86/include/asm/page_64_types.h" 2
# 48 "./arch/x86/include/asm/page_types.h" 2








extern int devmem_is_allowed(unsigned long pagenr);

extern unsigned long max_low_pfn_mapped;
extern unsigned long max_pfn_mapped;

static inline __attribute__((no_instrument_function)) phys_addr_t get_max_mapped(void)
{
 return (phys_addr_t)max_pfn_mapped << 12;
}

bool pfn_range_is_mapped(unsigned long start_pfn, unsigned long end_pfn);

extern unsigned long init_memory_mapping(unsigned long start,
      unsigned long end);

extern void initmem_init(void);
# 9 "./arch/x86/include/asm/page.h" 2


# 1 "./arch/x86/include/asm/page_64.h" 1








extern unsigned long max_pfn;
extern unsigned long phys_base;

static inline __attribute__((no_instrument_function)) unsigned long __phys_addr_nodebug(unsigned long x)
{
 unsigned long y = x - (0xffffffff80000000UL);


 x = y + ((x > y) ? phys_base : ((0xffffffff80000000UL) - ((unsigned long)(0xffff880000000000UL))));

 return x;
}
# 37 "./arch/x86/include/asm/page_64.h"
void clear_page(void *page);
void copy_page(void *to, void *from);
# 12 "./arch/x86/include/asm/page.h" 2






struct page;


# 1 "./include/linux/range.h" 1



struct range {
 u64 start;
 u64 end;
};

int add_range(struct range *range, int az, int nr_range,
  u64 start, u64 end);


int add_range_with_merge(struct range *range, int az, int nr_range,
    u64 start, u64 end);

void subtract_range(struct range *range, int az, u64 start, u64 end);

int clean_sort_range(struct range *range, int az);

void sort_range(struct range *range, int nr_range);


static inline __attribute__((no_instrument_function)) resource_size_t cap_resource(u64 val)
{
 if (val > ((resource_size_t)~0))
  return ((resource_size_t)~0);

 return val;
}
# 21 "./arch/x86/include/asm/page.h" 2
extern struct range pfn_mapped[];
extern int nr_pfn_mapped;

static inline __attribute__((no_instrument_function)) void clear_user_page(void *page, unsigned long vaddr,
       struct page *pg)
{
 clear_page(page);
}

static inline __attribute__((no_instrument_function)) void copy_user_page(void *to, void *from, unsigned long vaddr,
      struct page *topage)
{
 copy_page(to, from);
}
# 70 "./arch/x86/include/asm/page.h"
extern bool __virt_addr_valid(unsigned long kaddr);





# 1 "./include/asm-generic/memory_model.h" 1



# 1 "./include/linux/pfn.h" 1
# 12 "./include/linux/pfn.h"
typedef struct {
 u64 val;
} pfn_t;
# 5 "./include/asm-generic/memory_model.h" 2
# 76 "./arch/x86/include/asm/page.h" 2
# 1 "./include/asm-generic/getorder.h" 1
# 12 "./include/asm-generic/getorder.h"
static inline __attribute__((no_instrument_function)) __attribute__((__const__))
int __get_order(unsigned long size)
{
 int order;

 size--;
 size >>= 12;



 order = fls64(size);

 return order;
}
# 77 "./arch/x86/include/asm/page.h" 2
# 12 "./arch/x86/include/asm/thread_info.h" 2
# 51 "./arch/x86/include/asm/thread_info.h"
struct task_struct;

# 1 "./arch/x86/include/asm/cpufeature.h" 1



# 1 "./arch/x86/include/asm/processor.h" 1



# 1 "./arch/x86/include/asm/processor-flags.h" 1



# 1 "./arch/x86/include/uapi/asm/processor-flags.h" 1
# 5 "./arch/x86/include/asm/processor-flags.h" 2
# 5 "./arch/x86/include/asm/processor.h" 2


struct task_struct;
struct mm_struct;
struct vm86;


# 1 "./arch/x86/include/asm/math_emu.h" 1



# 1 "./arch/x86/include/asm/ptrace.h" 1



# 1 "./arch/x86/include/asm/segment.h" 1
# 240 "./arch/x86/include/asm/segment.h"
extern const char early_idt_handler_array[32][9];
# 284 "./arch/x86/include/asm/segment.h"
static inline __attribute__((no_instrument_function)) void __loadsegment_fs(unsigned short value)
{
 asm volatile("						\n"
       "1:	movw %0, %%fs			\n"
       "2:					\n"

       " .pushsection \"__ex_table\",\"a\"\n" " .balign 4\n" " .long (" "1b" ") - .\n" " .long (" "2b" ") - .\n" " .long (" "ex_handler_clear_fs" ") - .\n" " .popsection\n"

       : : "rm" (value) : "memory");
}
# 5 "./arch/x86/include/asm/ptrace.h" 2

# 1 "./arch/x86/include/uapi/asm/ptrace.h" 1




# 1 "./arch/x86/include/uapi/asm/ptrace-abi.h" 1
# 6 "./arch/x86/include/uapi/asm/ptrace.h" 2
# 7 "./arch/x86/include/asm/ptrace.h" 2
# 33 "./arch/x86/include/asm/ptrace.h"
struct pt_regs {




 unsigned long r15;
 unsigned long r14;
 unsigned long r13;
 unsigned long r12;
 unsigned long bp;
 unsigned long bx;

 unsigned long r11;
 unsigned long r10;
 unsigned long r9;
 unsigned long r8;
 unsigned long ax;
 unsigned long cx;
 unsigned long dx;
 unsigned long si;
 unsigned long di;




 unsigned long orig_ax;

 unsigned long ip;
 unsigned long cs;
 unsigned long flags;
 unsigned long sp;
 unsigned long ss;

};







struct cpuinfo_x86;
struct task_struct;

extern unsigned long profile_pc(struct pt_regs *regs);


extern unsigned long
convert_ip_to_linear(struct task_struct *child, struct pt_regs *regs);
extern void send_sigtrap(struct task_struct *tsk, struct pt_regs *regs,
    int error_code, int si_code);


static inline __attribute__((no_instrument_function)) unsigned long regs_return_value(struct pt_regs *regs)
{
 return regs->ax;
}
# 100 "./arch/x86/include/asm/ptrace.h"
static inline __attribute__((no_instrument_function)) int user_mode(struct pt_regs *regs)
{



 return !!(regs->cs & 3);

}

static inline __attribute__((no_instrument_function)) int v8086_mode(struct pt_regs *regs)
{



 return 0;

}


static inline __attribute__((no_instrument_function)) bool user_64bit_mode(struct pt_regs *regs)
{





 return regs->cs == (6*8 + 3);




}
# 140 "./arch/x86/include/asm/ptrace.h"
static inline __attribute__((no_instrument_function)) unsigned long kernel_stack_pointer(struct pt_regs *regs)
{
 return regs->sp;
}







# 1 "./include/asm-generic/ptrace.h" 1
# 22 "./include/asm-generic/ptrace.h"
static inline __attribute__((no_instrument_function)) unsigned long instruction_pointer(struct pt_regs *regs)
{
 return ((regs)->ip);
}
static inline __attribute__((no_instrument_function)) void instruction_pointer_set(struct pt_regs *regs,
                                           unsigned long val)
{
 (((regs)->ip) = (val));
}
# 44 "./include/asm-generic/ptrace.h"
static inline __attribute__((no_instrument_function)) unsigned long user_stack_pointer(struct pt_regs *regs)
{
 return ((regs)->sp);
}
static inline __attribute__((no_instrument_function)) void user_stack_pointer_set(struct pt_regs *regs,
                                          unsigned long val)
{
 (((regs)->sp) = (val));
}
# 62 "./include/asm-generic/ptrace.h"
static inline __attribute__((no_instrument_function)) unsigned long frame_pointer(struct pt_regs *regs)
{
 return ((regs)->bp);
}
static inline __attribute__((no_instrument_function)) void frame_pointer_set(struct pt_regs *regs,
                                     unsigned long val)
{
 (((regs)->bp) = (val));
}
# 151 "./arch/x86/include/asm/ptrace.h" 2


extern int regs_query_register_offset(const char *name);
extern const char *regs_query_register_name(unsigned int offset);
# 166 "./arch/x86/include/asm/ptrace.h"
static inline __attribute__((no_instrument_function)) unsigned long regs_get_register(struct pt_regs *regs,
           unsigned int offset)
{
 if (__builtin_expect(!!(offset > (__builtin_offsetof(struct pt_regs, ss))), 0))
  return 0;
# 180 "./arch/x86/include/asm/ptrace.h"
 return *(unsigned long *)((unsigned long)regs + offset);
}
# 191 "./arch/x86/include/asm/ptrace.h"
static inline __attribute__((no_instrument_function)) int regs_within_kernel_stack(struct pt_regs *regs,
        unsigned long addr)
{
 return ((addr & ~((((1UL) << 12) << (2 + 0)) - 1)) ==
  (kernel_stack_pointer(regs) & ~((((1UL) << 12) << (2 + 0)) - 1)));
}
# 207 "./arch/x86/include/asm/ptrace.h"
static inline __attribute__((no_instrument_function)) unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
            unsigned int n)
{
 unsigned long *addr = (unsigned long *)kernel_stack_pointer(regs);
 addr += n;
 if (regs_within_kernel_stack(regs, (unsigned long)addr))
  return *addr;
 else
  return 0;
}
# 243 "./arch/x86/include/asm/ptrace.h"
struct user_desc;
extern int do_get_thread_area(struct task_struct *p, int idx,
         struct user_desc *info);
extern int do_set_thread_area(struct task_struct *p, int idx,
         struct user_desc *info, int can_allocate);
# 5 "./arch/x86/include/asm/math_emu.h" 2





struct math_emu_info {
 long ___orig_eip;
 struct pt_regs *regs;
};
# 12 "./arch/x86/include/asm/processor.h" 2


# 1 "./arch/x86/include/uapi/asm/sigcontext.h" 1
# 39 "./arch/x86/include/uapi/asm/sigcontext.h"
struct _fpx_sw_bytes {




 __u32 magic1;
# 53 "./arch/x86/include/uapi/asm/sigcontext.h"
 __u32 extended_size;





 __u64 xfeatures;





 __u32 xstate_size;


 __u32 padding[7];
};
# 84 "./arch/x86/include/uapi/asm/sigcontext.h"
struct _fpreg {
 __u16 significand[4];
 __u16 exponent;
};


struct _fpxreg {
 __u16 significand[4];
 __u16 exponent;
 __u16 padding[3];
};


struct _xmmreg {
 __u32 element[4];
};






struct _fpstate_32 {

 __u32 cw;
 __u32 sw;
 __u32 tag;
 __u32 ipoff;
 __u32 cssel;
 __u32 dataoff;
 __u32 datasel;
 struct _fpreg _st[8];
 __u16 status;
 __u16 magic;



 __u32 _fxsr_env[6];
 __u32 mxcsr;
 __u32 reserved;
 struct _fpxreg _fxsr_st[8];
 struct _xmmreg _xmm[8];
 union {
  __u32 padding1[44];
  __u32 padding[44];
 };

 union {
  __u32 padding2[12];
  struct _fpx_sw_bytes sw_reserved;
 };
};
# 148 "./arch/x86/include/uapi/asm/sigcontext.h"
struct _fpstate_64 {
 __u16 cwd;
 __u16 swd;

 __u16 twd;
 __u16 fop;
 __u64 rip;
 __u64 rdp;
 __u32 mxcsr;
 __u32 mxcsr_mask;
 __u32 st_space[32];
 __u32 xmm_space[64];
 __u32 reserved2[12];
 union {
  __u32 reserved3[12];
  struct _fpx_sw_bytes sw_reserved;
 };
};







struct _header {
 __u64 xfeatures;
 __u64 reserved1[2];
 __u64 reserved2[5];
};

struct _ymmh_state {

 __u32 ymmh_space[64];
};
# 191 "./arch/x86/include/uapi/asm/sigcontext.h"
struct _xstate {
 struct _fpstate_64 fpstate;
 struct _header xstate_hdr;
 struct _ymmh_state ymmh;

};




struct sigcontext_32 {
 __u16 gs, __gsh;
 __u16 fs, __fsh;
 __u16 es, __esh;
 __u16 ds, __dsh;
 __u32 di;
 __u32 si;
 __u32 bp;
 __u32 sp;
 __u32 bx;
 __u32 dx;
 __u32 cx;
 __u32 ax;
 __u32 trapno;
 __u32 err;
 __u32 ip;
 __u16 cs, __csh;
 __u32 flags;
 __u32 sp_at_signal;
 __u16 ss, __ssh;
# 229 "./arch/x86/include/uapi/asm/sigcontext.h"
 __u32 fpstate;
 __u32 oldmask;
 __u32 cr2;
};




struct sigcontext_64 {
 __u64 r8;
 __u64 r9;
 __u64 r10;
 __u64 r11;
 __u64 r12;
 __u64 r13;
 __u64 r14;
 __u64 r15;
 __u64 di;
 __u64 si;
 __u64 bp;
 __u64 bx;
 __u64 dx;
 __u64 ax;
 __u64 cx;
 __u64 sp;
 __u64 ip;
 __u64 flags;
 __u16 cs;
 __u16 gs;
 __u16 fs;
 __u16 ss;
 __u64 err;
 __u64 trapno;
 __u64 oldmask;
 __u64 cr2;
# 272 "./arch/x86/include/uapi/asm/sigcontext.h"
 __u64 fpstate;
 __u64 reserved1[8];
};
# 15 "./arch/x86/include/asm/processor.h" 2



# 1 "./arch/x86/include/asm/pgtable_types.h" 1
# 149 "./arch/x86/include/asm/pgtable_types.h"
enum page_cache_mode {
 _PAGE_CACHE_MODE_WB = 0,
 _PAGE_CACHE_MODE_WC = 1,
 _PAGE_CACHE_MODE_UC_MINUS = 2,
 _PAGE_CACHE_MODE_UC = 3,
 _PAGE_CACHE_MODE_WT = 4,
 _PAGE_CACHE_MODE_WP = 5,
 _PAGE_CACHE_MODE_NUM = 8
};
# 240 "./arch/x86/include/asm/pgtable_types.h"
# 1 "./arch/x86/include/asm/pgtable_64_types.h" 1



# 1 "./arch/x86/include/asm/sparsemem.h" 1
# 5 "./arch/x86/include/asm/pgtable_64_types.h" 2








typedef unsigned long pteval_t;
typedef unsigned long pmdval_t;
typedef unsigned long pudval_t;
typedef unsigned long pgdval_t;
typedef unsigned long pgprotval_t;

typedef struct { pteval_t pte; } pte_t;
# 241 "./arch/x86/include/asm/pgtable_types.h" 2
# 256 "./arch/x86/include/asm/pgtable_types.h"
typedef struct pgprot { pgprotval_t pgprot; } pgprot_t;

typedef struct { pgdval_t pgd; } pgd_t;

static inline __attribute__((no_instrument_function)) pgd_t native_make_pgd(pgdval_t val)
{
 return (pgd_t) { val };
}

static inline __attribute__((no_instrument_function)) pgdval_t native_pgd_val(pgd_t pgd)
{
 return pgd.pgd;
}

static inline __attribute__((no_instrument_function)) pgdval_t pgd_flags(pgd_t pgd)
{
 return native_pgd_val(pgd) & (~((pteval_t)(((signed long)(~(((1UL) << 12)-1))) & ((phys_addr_t)((1ULL << 46) - 1)))));
}



# 1 "./include/asm-generic/5level-fixup.h" 1
# 277 "./arch/x86/include/asm/pgtable_types.h" 2

typedef struct { pudval_t pud; } pud_t;

static inline __attribute__((no_instrument_function)) pud_t native_make_pud(pmdval_t val)
{
 return (pud_t) { val };
}

static inline __attribute__((no_instrument_function)) pudval_t native_pud_val(pud_t pud)
{
 return pud.pud;
}
# 300 "./arch/x86/include/asm/pgtable_types.h"
typedef struct { pmdval_t pmd; } pmd_t;

static inline __attribute__((no_instrument_function)) pmd_t native_make_pmd(pmdval_t val)
{
 return (pmd_t) { val };
}

static inline __attribute__((no_instrument_function)) pmdval_t native_pmd_val(pmd_t pmd)
{
 return pmd.pmd;
}
# 321 "./arch/x86/include/asm/pgtable_types.h"
static inline __attribute__((no_instrument_function)) pudval_t pud_pfn_mask(pud_t pud)
{
 if (native_pud_val(pud) & (((pteval_t)(1)) << 7))
  return (((signed long)(~(((1UL) << 30)-1))) & ((phys_addr_t)((1ULL << 46) - 1)));
 else
  return ((pteval_t)(((signed long)(~(((1UL) << 12)-1))) & ((phys_addr_t)((1ULL << 46) - 1))));
}

static inline __attribute__((no_instrument_function)) pudval_t pud_flags_mask(pud_t pud)
{
 return ~pud_pfn_mask(pud);
}

static inline __attribute__((no_instrument_function)) pudval_t pud_flags(pud_t pud)
{
 return native_pud_val(pud) & pud_flags_mask(pud);
}

static inline __attribute__((no_instrument_function)) pmdval_t pmd_pfn_mask(pmd_t pmd)
{
 if (native_pmd_val(pmd) & (((pteval_t)(1)) << 7))
  return (((signed long)(~(((1UL) << 21)-1))) & ((phys_addr_t)((1ULL << 46) - 1)));
 else
  return ((pteval_t)(((signed long)(~(((1UL) << 12)-1))) & ((phys_addr_t)((1ULL << 46) - 1))));
}

static inline __attribute__((no_instrument_function)) pmdval_t pmd_flags_mask(pmd_t pmd)
{
 return ~pmd_pfn_mask(pmd);
}

static inline __attribute__((no_instrument_function)) pmdval_t pmd_flags(pmd_t pmd)
{
 return native_pmd_val(pmd) & pmd_flags_mask(pmd);
}

static inline __attribute__((no_instrument_function)) pte_t native_make_pte(pteval_t val)
{
 return (pte_t) { .pte = val };
}

static inline __attribute__((no_instrument_function)) pteval_t native_pte_val(pte_t pte)
{
 return pte.pte;
}

static inline __attribute__((no_instrument_function)) pteval_t pte_flags(pte_t pte)
{
 return native_pte_val(pte) & (~((pteval_t)(((signed long)(~(((1UL) << 12)-1))) & ((phys_addr_t)((1ULL << 46) - 1)))));
}




extern uint16_t __cachemode2pte_tbl[_PAGE_CACHE_MODE_NUM];
extern uint8_t __pte2cachemode_tbl[8];
# 387 "./arch/x86/include/asm/pgtable_types.h"
static inline __attribute__((no_instrument_function)) unsigned long cachemode2protval(enum page_cache_mode pcm)
{
 if (__builtin_expect(!!(pcm == 0), 1))
  return 0;
 return __cachemode2pte_tbl[pcm];
}
static inline __attribute__((no_instrument_function)) pgprot_t cachemode2pgprot(enum page_cache_mode pcm)
{
 return ((pgprot_t) { (cachemode2protval(pcm)) } );
}
static inline __attribute__((no_instrument_function)) enum page_cache_mode pgprot2cachemode(pgprot_t pgprot)
{
 unsigned long masked;

 masked = ((pgprot).pgprot) & ((((pteval_t)(1)) << 7) | (((pteval_t)(1)) << 4) | (((pteval_t)(1)) << 3));
 if (__builtin_expect(!!(masked == 0), 1))
  return 0;
 return __pte2cachemode_tbl[((((masked) >> (7 - 2)) & 4) | (((masked) >> (4 - 1)) & 2) | (((masked) >> 3) & 1))];
}
static inline __attribute__((no_instrument_function)) pgprot_t pgprot_4k_2_large(pgprot_t pgprot)
{
 pgprotval_t val = ((pgprot).pgprot);
 pgprot_t new;

 ((new).pgprot) = (val & ~((((pteval_t)(1)) << 7) | (((pteval_t)(1)) << 12))) |
  ((val & (((pteval_t)(1)) << 7)) << (12 - 7));
 return new;
}
static inline __attribute__((no_instrument_function)) pgprot_t pgprot_large_2_4k(pgprot_t pgprot)
{
 pgprotval_t val = ((pgprot).pgprot);
 pgprot_t new;

 ((new).pgprot) = (val & ~((((pteval_t)(1)) << 7) | (((pteval_t)(1)) << 12))) |
     ((val & (((pteval_t)(1)) << 12)) >>
      (12 - 7));
 return new;
}


typedef struct page *pgtable_t;

extern pteval_t __supported_pte_mask;
extern void set_nx(void);
extern int nx_enabled;


extern pgprot_t pgprot_writecombine(pgprot_t prot);


extern pgprot_t pgprot_writethrough(pgprot_t prot);





struct file;
pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
                              unsigned long size, pgprot_t vma_prot);


void set_pte_vaddr(unsigned long vaddr, pte_t pte);







struct seq_file;
extern void arch_report_meminfo(struct seq_file *m);

enum pg_level {
 PG_LEVEL_NONE,
 PG_LEVEL_4K,
 PG_LEVEL_2M,
 PG_LEVEL_1G,
 PG_LEVEL_NUM
};


extern void update_page_count(int level, unsigned long pages);
# 479 "./arch/x86/include/asm/pgtable_types.h"
extern pte_t *lookup_address(unsigned long address, unsigned int *level);
extern pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
        unsigned int *level);
extern pmd_t *lookup_pmd_address(unsigned long address);
extern phys_addr_t slow_virt_to_phys(void *__address);
extern int kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn, unsigned long address,
       unsigned numpages, unsigned long page_flags);
# 19 "./arch/x86/include/asm/processor.h" 2

# 1 "./arch/x86/include/asm/msr.h" 1



# 1 "./arch/x86/include/asm/msr-index.h" 1
# 5 "./arch/x86/include/asm/msr.h" 2




# 1 "./arch/x86/include/uapi/asm/errno.h" 1
# 1 "./include/uapi/asm-generic/errno.h" 1



# 1 "./include/uapi/asm-generic/errno-base.h" 1
# 5 "./include/uapi/asm-generic/errno.h" 2
# 2 "./arch/x86/include/uapi/asm/errno.h" 2
# 10 "./arch/x86/include/asm/msr.h" 2
# 1 "./arch/x86/include/asm/cpumask.h" 1



# 1 "./include/linux/cpumask.h" 1
# 11 "./include/linux/cpumask.h"
# 1 "./include/linux/bitmap.h" 1







# 1 "./include/linux/string.h" 1








# 1 "./include/uapi/linux/string.h" 1
# 10 "./include/linux/string.h" 2

extern char *strndup_user(const char *, long);
extern void *memdup_user(const void *, size_t);
extern void *memdup_user_nul(const void *, size_t);





# 1 "./arch/x86/include/asm/string.h" 1



# 1 "./arch/x86/include/asm/string_64.h" 1




# 1 "./include/linux/jump_label.h" 1
# 82 "./include/linux/jump_label.h"
extern bool static_key_initialized;
# 113 "./include/linux/jump_label.h"
struct static_key {
 atomic_t enabled;
};
# 125 "./include/linux/jump_label.h"
enum jump_label_type {
 JUMP_LABEL_NOP = 0,
 JUMP_LABEL_JMP,
};

struct module;
# 183 "./include/linux/jump_label.h"
# 1 "./include/linux/atomic.h" 1



# 1 "./arch/x86/include/asm/atomic.h" 1






# 1 "./arch/x86/include/asm/cmpxchg.h" 1
# 12 "./arch/x86/include/asm/cmpxchg.h"
extern void __xchg_wrong_size(void)
                                                  ;
extern void __cmpxchg_wrong_size(void)
                                                     ;
extern void __xadd_wrong_size(void)
                                                  ;
extern void __add_wrong_size(void)
                                                 ;
# 144 "./arch/x86/include/asm/cmpxchg.h"
# 1 "./arch/x86/include/asm/cmpxchg_64.h" 1



static inline __attribute__((no_instrument_function)) void set_64bit(volatile u64 *ptr, u64 val)
{
 *ptr = val;
}
# 145 "./arch/x86/include/asm/cmpxchg.h" 2
# 8 "./arch/x86/include/asm/atomic.h" 2
# 24 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int atomic_read(const atomic_t *v)
{
 return ({ union { typeof((v)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((v)->counter), __u.__c, sizeof((v)->counter)); else __read_once_size_nocheck(&((v)->counter), __u.__c, sizeof((v)->counter)); __u.__val; });
}
# 36 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_set(atomic_t *v, int i)
{
 ({ union { typeof(v->counter) __val; char __c[1]; } __u = { .__val = ( typeof(v->counter)) (i) }; __write_once_size(&(v->counter), __u.__c, sizeof(v->counter)); __u.__val; });
}
# 48 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_add(int i, atomic_t *v)
{
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "addl %1,%0"
       : "+m" (v->counter)
       : "ir" (i));
}
# 62 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_sub(int i, atomic_t *v)
{
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "subl %1,%0"
       : "+m" (v->counter)
       : "ir" (i));
}
# 78 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool atomic_sub_and_test(int i, atomic_t *v)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "subl" " %2, " "%0" ";" "\n\tset" "e" " %[_cc_" "e" "]\n" : "+m" (v->counter), [_cc_e] "=qm" (c) : "er" (i) : "memory"); return c; } while (0);
}







static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_inc(atomic_t *v)
{
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "incl %0"
       : "+m" (v->counter));
}







static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_dec(atomic_t *v)
{
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "decl %0"
       : "+m" (v->counter));
}
# 115 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool atomic_dec_and_test(atomic_t *v)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "decl" " " "%0" ";" "\n\tset" "e" " %[_cc_" "e" "]\n" : "+m" (v->counter), [_cc_e] "=qm" (c) : : "memory"); return c; } while (0);
}
# 128 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool atomic_inc_and_test(atomic_t *v)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "incl" " " "%0" ";" "\n\tset" "e" " %[_cc_" "e" "]\n" : "+m" (v->counter), [_cc_e] "=qm" (c) : : "memory"); return c; } while (0);
}
# 142 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool atomic_add_negative(int i, atomic_t *v)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "addl" " %2, " "%0" ";" "\n\tset" "s" " %[_cc_" "s" "]\n" : "+m" (v->counter), [_cc_s] "=qm" (c) : "er" (i) : "memory"); return c; } while (0);
}
# 154 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int atomic_add_return(int i, atomic_t *v)
{
 return i + ({ __typeof__ (*(((&v->counter)))) __ret = (((i))); switch (sizeof(*(((&v->counter))))) { case 1: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "b %b0, %1\n" : "+q" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 2: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "w %w0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 4: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "l %0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 8: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "q %q0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; default: __xadd_wrong_size(); } __ret; });
}
# 166 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int atomic_sub_return(int i, atomic_t *v)
{
 return atomic_add_return(-i, v);
}




static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int atomic_fetch_add(int i, atomic_t *v)
{
 return ({ __typeof__ (*(((&v->counter)))) __ret = (((i))); switch (sizeof(*(((&v->counter))))) { case 1: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "b %b0, %1\n" : "+q" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 2: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "w %w0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 4: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "l %0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 8: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "q %q0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; default: __xadd_wrong_size(); } __ret; });
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int atomic_fetch_sub(int i, atomic_t *v)
{
 return ({ __typeof__ (*(((&v->counter)))) __ret = (((-i))); switch (sizeof(*(((&v->counter))))) { case 1: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "b %b0, %1\n" : "+q" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 2: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "w %w0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 4: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "l %0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 8: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "q %q0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; default: __xadd_wrong_size(); } __ret; });
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int atomic_cmpxchg(atomic_t *v, int old, int new)
{
 return ({ __typeof__(*((&v->counter))) __ret; __typeof__(*((&v->counter))) __old = ((old)); __typeof__(*((&v->counter))) __new = ((new)); switch ((sizeof(*(&v->counter)))) { case 1: { volatile u8 *__ptr = (volatile u8 *)((&v->counter)); asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "cmpxchgb %2,%1" : "=a" (__ret), "+m" (*__ptr) : "q" (__new), "0" (__old) : "memory"); break; } case 2: { volatile u16 *__ptr = (volatile u16 *)((&v->counter)); asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "cmpxchgw %2,%1" : "=a" (__ret), "+m" (*__ptr) : "r" (__new), "0" (__old) : "memory"); break; } case 4: { volatile u32 *__ptr = (volatile u32 *)((&v->counter)); asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "cmpxchgl %2,%1" : "=a" (__ret), "+m" (*__ptr) : "r" (__new), "0" (__old) : "memory"); break; } case 8: { volatile u64 *__ptr = (volatile u64 *)((&v->counter)); asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "cmpxchgq %2,%1" : "=a" (__ret), "+m" (*__ptr) : "r" (__new), "0" (__old) : "memory"); break; } default: __cmpxchg_wrong_size(); } __ret; });
}

static inline __attribute__((no_instrument_function)) int atomic_xchg(atomic_t *v, int new)
{
 return ({ __typeof__ (*((&v->counter))) __ret = ((new)); switch (sizeof(*((&v->counter)))) { case 1: asm volatile ("" "xchg" "b %b0, %1\n" : "+q" (__ret), "+m" (*((&v->counter))) : : "memory", "cc"); break; case 2: asm volatile ("" "xchg" "w %w0, %1\n" : "+r" (__ret), "+m" (*((&v->counter))) : : "memory", "cc"); break; case 4: asm volatile ("" "xchg" "l %0, %1\n" : "+r" (__ret), "+m" (*((&v->counter))) : : "memory", "cc"); break; case 8: asm volatile ("" "xchg" "q %q0, %1\n" : "+r" (__ret), "+m" (*((&v->counter))) : : "memory", "cc"); break; default: __xchg_wrong_size(); } __ret; });
}
# 220 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) void atomic_and(int i, atomic_t *v) { asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "and""l %1,%0" : "+m" (v->counter) : "ir" (i) : "memory"); } static inline __attribute__((no_instrument_function)) int atomic_fetch_and(int i, atomic_t *v) { int old, val = atomic_read(v); for (;;) { old = atomic_cmpxchg(v, val, val & i); if (old == val) break; val = old; } return old; }
static inline __attribute__((no_instrument_function)) void atomic_or(int i, atomic_t *v) { asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "or""l %1,%0" : "+m" (v->counter) : "ir" (i) : "memory"); } static inline __attribute__((no_instrument_function)) int atomic_fetch_or(int i, atomic_t *v) { int old, val = atomic_read(v); for (;;) { old = atomic_cmpxchg(v, val, val | i); if (old == val) break; val = old; } return old; }
static inline __attribute__((no_instrument_function)) void atomic_xor(int i, atomic_t *v) { asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xor""l %1,%0" : "+m" (v->counter) : "ir" (i) : "memory"); } static inline __attribute__((no_instrument_function)) int atomic_fetch_xor(int i, atomic_t *v) { int old, val = atomic_read(v); for (;;) { old = atomic_cmpxchg(v, val, val ^ i); if (old == val) break; val = old; } return old; }
# 237 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int __atomic_add_unless(atomic_t *v, int a, int u)
{
 int c, old;
 c = atomic_read(v);
 for (;;) {
  if (__builtin_expect(!!(c == (u)), 0))
   break;
  old = atomic_cmpxchg((v), c, c + (a));
  if (__builtin_expect(!!(old == c), 1))
   break;
  c = old;
 }
 return c;
}
# 259 "./arch/x86/include/asm/atomic.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) short int atomic_inc_short(short int *v)
{
 asm(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "addw $1, %0" : "+m" (*v));
 return *v;
}





# 1 "./arch/x86/include/asm/atomic64_64.h" 1
# 19 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) long atomic64_read(const atomic64_t *v)
{
 return ({ union { typeof((v)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((v)->counter), __u.__c, sizeof((v)->counter)); else __read_once_size_nocheck(&((v)->counter), __u.__c, sizeof((v)->counter)); __u.__val; });
}
# 31 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) void atomic64_set(atomic64_t *v, long i)
{
 ({ union { typeof(v->counter) __val; char __c[1]; } __u = { .__val = ( typeof(v->counter)) (i) }; __write_once_size(&(v->counter), __u.__c, sizeof(v->counter)); __u.__val; });
}
# 43 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic64_add(long i, atomic64_t *v)
{
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "addq %1,%0"
       : "=m" (v->counter)
       : "er" (i), "m" (v->counter));
}
# 57 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) void atomic64_sub(long i, atomic64_t *v)
{
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "subq %1,%0"
       : "=m" (v->counter)
       : "er" (i), "m" (v->counter));
}
# 73 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) bool atomic64_sub_and_test(long i, atomic64_t *v)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "subq" " %2, " "%0" ";" "\n\tset" "e" " %[_cc_" "e" "]\n" : "+m" (v->counter), [_cc_e] "=qm" (c) : "er" (i) : "memory"); return c; } while (0);
}







static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic64_inc(atomic64_t *v)
{
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "incq %0"
       : "=m" (v->counter)
       : "m" (v->counter));
}







static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic64_dec(atomic64_t *v)
{
 asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "decq %0"
       : "=m" (v->counter)
       : "m" (v->counter));
}
# 112 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) bool atomic64_dec_and_test(atomic64_t *v)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "decq" " " "%0" ";" "\n\tset" "e" " %[_cc_" "e" "]\n" : "+m" (v->counter), [_cc_e] "=qm" (c) : : "memory"); return c; } while (0);
}
# 125 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) bool atomic64_inc_and_test(atomic64_t *v)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "incq" " " "%0" ";" "\n\tset" "e" " %[_cc_" "e" "]\n" : "+m" (v->counter), [_cc_e] "=qm" (c) : : "memory"); return c; } while (0);
}
# 139 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) bool atomic64_add_negative(long i, atomic64_t *v)
{
 do { bool c; asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "addq" " %2, " "%0" ";" "\n\tset" "s" " %[_cc_" "s" "]\n" : "+m" (v->counter), [_cc_s] "=qm" (c) : "er" (i) : "memory"); return c; } while (0);
}
# 151 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) long atomic64_add_return(long i, atomic64_t *v)
{
 return i + ({ __typeof__ (*(((&v->counter)))) __ret = (((i))); switch (sizeof(*(((&v->counter))))) { case 1: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "b %b0, %1\n" : "+q" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 2: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "w %w0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 4: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "l %0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 8: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "q %q0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; default: __xadd_wrong_size(); } __ret; });
}

static inline __attribute__((no_instrument_function)) long atomic64_sub_return(long i, atomic64_t *v)
{
 return atomic64_add_return(-i, v);
}

static inline __attribute__((no_instrument_function)) long atomic64_fetch_add(long i, atomic64_t *v)
{
 return ({ __typeof__ (*(((&v->counter)))) __ret = (((i))); switch (sizeof(*(((&v->counter))))) { case 1: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "b %b0, %1\n" : "+q" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 2: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "w %w0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 4: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "l %0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 8: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "q %q0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; default: __xadd_wrong_size(); } __ret; });
}

static inline __attribute__((no_instrument_function)) long atomic64_fetch_sub(long i, atomic64_t *v)
{
 return ({ __typeof__ (*(((&v->counter)))) __ret = (((-i))); switch (sizeof(*(((&v->counter))))) { case 1: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "b %b0, %1\n" : "+q" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 2: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "w %w0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 4: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "l %0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; case 8: asm volatile (".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xadd" "q %q0, %1\n" : "+r" (__ret), "+m" (*(((&v->counter)))) : : "memory", "cc"); break; default: __xadd_wrong_size(); } __ret; });
}




static inline __attribute__((no_instrument_function)) long atomic64_cmpxchg(atomic64_t *v, long old, long new)
{
 return ({ __typeof__(*((&v->counter))) __ret; __typeof__(*((&v->counter))) __old = ((old)); __typeof__(*((&v->counter))) __new = ((new)); switch ((sizeof(*(&v->counter)))) { case 1: { volatile u8 *__ptr = (volatile u8 *)((&v->counter)); asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "cmpxchgb %2,%1" : "=a" (__ret), "+m" (*__ptr) : "q" (__new), "0" (__old) : "memory"); break; } case 2: { volatile u16 *__ptr = (volatile u16 *)((&v->counter)); asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "cmpxchgw %2,%1" : "=a" (__ret), "+m" (*__ptr) : "r" (__new), "0" (__old) : "memory"); break; } case 4: { volatile u32 *__ptr = (volatile u32 *)((&v->counter)); asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "cmpxchgl %2,%1" : "=a" (__ret), "+m" (*__ptr) : "r" (__new), "0" (__old) : "memory"); break; } case 8: { volatile u64 *__ptr = (volatile u64 *)((&v->counter)); asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "cmpxchgq %2,%1" : "=a" (__ret), "+m" (*__ptr) : "r" (__new), "0" (__old) : "memory"); break; } default: __cmpxchg_wrong_size(); } __ret; });
}

static inline __attribute__((no_instrument_function)) long atomic64_xchg(atomic64_t *v, long new)
{
 return ({ __typeof__ (*((&v->counter))) __ret = ((new)); switch (sizeof(*((&v->counter)))) { case 1: asm volatile ("" "xchg" "b %b0, %1\n" : "+q" (__ret), "+m" (*((&v->counter))) : : "memory", "cc"); break; case 2: asm volatile ("" "xchg" "w %w0, %1\n" : "+r" (__ret), "+m" (*((&v->counter))) : : "memory", "cc"); break; case 4: asm volatile ("" "xchg" "l %0, %1\n" : "+r" (__ret), "+m" (*((&v->counter))) : : "memory", "cc"); break; case 8: asm volatile ("" "xchg" "q %q0, %1\n" : "+r" (__ret), "+m" (*((&v->counter))) : : "memory", "cc"); break; default: __xchg_wrong_size(); } __ret; });
}
# 193 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) bool atomic64_add_unless(atomic64_t *v, long a, long u)
{
 long c, old;
 c = atomic64_read(v);
 for (;;) {
  if (__builtin_expect(!!(c == (u)), 0))
   break;
  old = atomic64_cmpxchg((v), c, c + (a));
  if (__builtin_expect(!!(old == c), 1))
   break;
  c = old;
 }
 return c != (u);
}
# 217 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) long atomic64_dec_if_positive(atomic64_t *v)
{
 long c, old, dec;
 c = atomic64_read(v);
 for (;;) {
  dec = c - 1;
  if (__builtin_expect(!!(dec < 0), 0))
   break;
  old = atomic64_cmpxchg((v), c, dec);
  if (__builtin_expect(!!(old == c), 1))
   break;
  c = old;
 }
 return dec;
}
# 259 "./arch/x86/include/asm/atomic64_64.h"
static inline __attribute__((no_instrument_function)) void atomic64_and(long i, atomic64_t *v) { asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "and""q %1,%0" : "+m" (v->counter) : "er" (i) : "memory"); } static inline __attribute__((no_instrument_function)) long atomic64_fetch_and(long i, atomic64_t *v) { long old, val = atomic64_read(v); for (;;) { old = atomic64_cmpxchg(v, val, val & i); if (old == val) break; val = old; } return old; }
static inline __attribute__((no_instrument_function)) void atomic64_or(long i, atomic64_t *v) { asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "or""q %1,%0" : "+m" (v->counter) : "er" (i) : "memory"); } static inline __attribute__((no_instrument_function)) long atomic64_fetch_or(long i, atomic64_t *v) { long old, val = atomic64_read(v); for (;;) { old = atomic64_cmpxchg(v, val, val | i); if (old == val) break; val = old; } return old; }
static inline __attribute__((no_instrument_function)) void atomic64_xor(long i, atomic64_t *v) { asm volatile(".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "xor""q %1,%0" : "+m" (v->counter) : "er" (i) : "memory"); } static inline __attribute__((no_instrument_function)) long atomic64_fetch_xor(long i, atomic64_t *v) { long old, val = atomic64_read(v); for (;;) { old = atomic64_cmpxchg(v, val, val ^ i); if (old == val) break; val = old; } return old; }
# 269 "./arch/x86/include/asm/atomic.h" 2
# 5 "./include/linux/atomic.h" 2
# 504 "./include/linux/atomic.h"
static inline __attribute__((no_instrument_function)) int atomic_add_unless(atomic_t *v, int a, int u)
{
 return __atomic_add_unless(v, a, u) != u;
}
# 521 "./include/linux/atomic.h"
static inline __attribute__((no_instrument_function)) void atomic_andnot(int i, atomic_t *v)
{
 atomic_and(~i, v);
}

static inline __attribute__((no_instrument_function)) int atomic_fetch_andnot(int i, atomic_t *v)
{
 return atomic_fetch_and(~i, v);
}

static inline __attribute__((no_instrument_function)) int atomic_fetch_andnot_relaxed(int i, atomic_t *v)
{
 return atomic_fetch_and(~i, v);
}

static inline __attribute__((no_instrument_function)) int atomic_fetch_andnot_acquire(int i, atomic_t *v)
{
 return atomic_fetch_and(~i, v);
}

static inline __attribute__((no_instrument_function)) int atomic_fetch_andnot_release(int i, atomic_t *v)
{
 return atomic_fetch_and(~i, v);
}
# 560 "./include/linux/atomic.h"
static inline __attribute__((no_instrument_function)) int atomic_inc_not_zero_hint(atomic_t *v, int hint)
{
 int val, c = hint;


 if (!hint)
  return atomic_add_unless((v), 1, 0);

 do {
  val = atomic_cmpxchg(v, c, c + 1);
  if (val == c)
   return 1;
  c = val;
 } while (c);

 return 0;
}



static inline __attribute__((no_instrument_function)) int atomic_inc_unless_negative(atomic_t *p)
{
 int v, v1;
 for (v = 0; v >= 0; v = v1) {
  v1 = atomic_cmpxchg(p, v, v + 1);
  if (__builtin_expect(!!(v1 == v), 1))
   return 1;
 }
 return 0;
}



static inline __attribute__((no_instrument_function)) int atomic_dec_unless_positive(atomic_t *p)
{
 int v, v1;
 for (v = 0; v <= 0; v = v1) {
  v1 = atomic_cmpxchg(p, v, v - 1);
  if (__builtin_expect(!!(v1 == v), 1))
   return 1;
 }
 return 0;
}
# 613 "./include/linux/atomic.h"
static inline __attribute__((no_instrument_function)) int atomic_dec_if_positive(atomic_t *v)
{
 int c, old, dec;
 c = atomic_read(v);
 for (;;) {
  dec = c - 1;
  if (__builtin_expect(!!(dec < 0), 0))
   break;
  old = atomic_cmpxchg((v), c, dec);
  if (__builtin_expect(!!(old == c), 1))
   break;
  c = old;
 }
 return dec;
}
# 1000 "./include/linux/atomic.h"
static inline __attribute__((no_instrument_function)) void atomic64_andnot(long long i, atomic64_t *v)
{
 atomic64_and(~i, v);
}

static inline __attribute__((no_instrument_function)) long long atomic64_fetch_andnot(long long i, atomic64_t *v)
{
 return atomic64_fetch_and(~i, v);
}

static inline __attribute__((no_instrument_function)) long long atomic64_fetch_andnot_relaxed(long long i, atomic64_t *v)
{
 return atomic64_fetch_and(~i, v);
}

static inline __attribute__((no_instrument_function)) long long atomic64_fetch_andnot_acquire(long long i, atomic64_t *v)
{
 return atomic64_fetch_and(~i, v);
}

static inline __attribute__((no_instrument_function)) long long atomic64_fetch_andnot_release(long long i, atomic64_t *v)
{
 return atomic64_fetch_and(~i, v);
}



# 1 "./include/asm-generic/atomic-long.h" 1
# 23 "./include/asm-generic/atomic-long.h"
typedef atomic64_t atomic_long_t;
# 44 "./include/asm-generic/atomic-long.h"
static inline __attribute__((no_instrument_function)) long atomic_long_read(const atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_read(v); }
static inline __attribute__((no_instrument_function)) long atomic_long_read_acquire(const atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)({ typeof(*&(v)->counter) ___p1 = ({ union { typeof(*&(v)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&(*&(v)->counter), __u.__c, sizeof(*&(v)->counter)); else __read_once_size_nocheck(&(*&(v)->counter), __u.__c, sizeof(*&(v)->counter)); __u.__val; }); do { bool __cond = !((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long))); extern void __compiletime_assert_45(void) ; if (__cond) __compiletime_assert_45(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); ___p1; }); }
# 56 "./include/asm-generic/atomic-long.h"
static inline __attribute__((no_instrument_function)) void atomic_long_set(atomic_long_t *l, long i) { atomic64_t *v = (atomic64_t *)l; atomic64_set(v, i); }
static inline __attribute__((no_instrument_function)) void atomic_long_set_release(atomic_long_t *l, long i) { atomic64_t *v = (atomic64_t *)l; do { do { bool __cond = !((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long))); extern void __compiletime_assert_57(void) ; if (__cond) __compiletime_assert_57(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); ({ union { typeof(*&(v)->counter) __val; char __c[1]; } __u = { .__val = ( typeof(*&(v)->counter)) ((i)) }; __write_once_size(&(*&(v)->counter), __u.__c, sizeof(*&(v)->counter)); __u.__val; }); } while (0); }
# 69 "./include/asm-generic/atomic-long.h"
static inline __attribute__((no_instrument_function)) long atomic_long_add_return(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_add_return_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_add_return_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_add_return_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_sub_return(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_sub_return_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_sub_return_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_sub_return_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return(i, v); }
# 101 "./include/asm-generic/atomic-long.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_inc(atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 atomic64_inc(v);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_dec(atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 atomic64_dec(v);
}
# 124 "./include/asm-generic/atomic-long.h"
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_add(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_add_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_add_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_add_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_sub(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_sub_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_sub_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_sub_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_and(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_and(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_and_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_and(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_and_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_and(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_and_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_and(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_andnot(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_andnot(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_andnot_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_andnot_relaxed(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_andnot_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_andnot_acquire(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_andnot_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_andnot_release(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_or(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_or(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_or_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_or(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_or_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_or(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_or_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_or(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_xor(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_xor(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_xor_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_xor(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_xor_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_xor(i, v); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_xor_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_xor(i, v); }
# 160 "./include/asm-generic/atomic-long.h"
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_inc(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(1, (v)); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_inc_relaxed(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(1, (v)); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_inc_acquire(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(1, (v)); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_inc_release(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(1, (v)); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_dec(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(1, (v)); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_dec_relaxed(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(1, (v)); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_dec_acquire(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(1, (v)); }
static inline __attribute__((no_instrument_function)) long atomic_long_fetch_dec_release(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(1, (v)); }
# 180 "./include/asm-generic/atomic-long.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_add(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_add(i, v); }
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_sub(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_sub(i, v); }
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_and(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_and(i, v); }
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_andnot(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_andnot(i, v); }
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_or(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_or(i, v); }
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_xor(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_xor(i, v); }



static inline __attribute__((no_instrument_function)) int atomic_long_sub_and_test(long i, atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 return atomic64_sub_and_test(i, v);
}

static inline __attribute__((no_instrument_function)) int atomic_long_dec_and_test(atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 return atomic64_dec_and_test(v);
}

static inline __attribute__((no_instrument_function)) int atomic_long_inc_and_test(atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 return atomic64_inc_and_test(v);
}

static inline __attribute__((no_instrument_function)) int atomic_long_add_negative(long i, atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 return atomic64_add_negative(i, v);
}
# 225 "./include/asm-generic/atomic-long.h"
static inline __attribute__((no_instrument_function)) long atomic_long_inc_return(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)(atomic64_add_return(1, (v))); }
static inline __attribute__((no_instrument_function)) long atomic_long_inc_return_relaxed(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)(atomic64_add_return(1, (v))); }
static inline __attribute__((no_instrument_function)) long atomic_long_inc_return_acquire(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)(atomic64_add_return(1, (v))); }
static inline __attribute__((no_instrument_function)) long atomic_long_inc_return_release(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)(atomic64_add_return(1, (v))); }
static inline __attribute__((no_instrument_function)) long atomic_long_dec_return(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)(atomic64_sub_return(1, (v))); }
static inline __attribute__((no_instrument_function)) long atomic_long_dec_return_relaxed(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)(atomic64_sub_return(1, (v))); }
static inline __attribute__((no_instrument_function)) long atomic_long_dec_return_acquire(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)(atomic64_sub_return(1, (v))); }
static inline __attribute__((no_instrument_function)) long atomic_long_dec_return_release(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)(atomic64_sub_return(1, (v))); }



static inline __attribute__((no_instrument_function)) long atomic_long_add_unless(atomic_long_t *l, long a, long u)
{
 atomic64_t *v = (atomic64_t *)l;

 return (long)atomic64_add_unless(v, a, u);
}
# 1027 "./include/linux/atomic.h" 2
# 184 "./include/linux/jump_label.h" 2


static inline __attribute__((no_instrument_function)) int static_key_count(struct static_key *key)
{
 return atomic_read(&key->enabled);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void jump_label_init(void)
{
 static_key_initialized = true;
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool static_key_false(struct static_key *key)
{
 if (__builtin_expect(!!(static_key_count(key) > 0), 0))
  return true;
 return false;
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool static_key_true(struct static_key *key)
{
 if (__builtin_expect(!!(static_key_count(key) > 0), 1))
  return true;
 return false;
}

static inline __attribute__((no_instrument_function)) void static_key_slow_inc(struct static_key *key)
{
 ({ int __ret_warn_on = !!(!static_key_initialized); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_fmt("./include/linux/jump_label.h", 212, "%s used before call to jump_label_init", __func__); __builtin_expect(!!(__ret_warn_on), 0); });
 atomic_inc(&key->enabled);
}

static inline __attribute__((no_instrument_function)) void static_key_slow_dec(struct static_key *key)
{
 ({ int __ret_warn_on = !!(!static_key_initialized); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_fmt("./include/linux/jump_label.h", 218, "%s used before call to jump_label_init", __func__); __builtin_expect(!!(__ret_warn_on), 0); });
 atomic_dec(&key->enabled);
}

static inline __attribute__((no_instrument_function)) int jump_label_text_reserved(void *start, void *end)
{
 return 0;
}

static inline __attribute__((no_instrument_function)) void jump_label_lock(void) {}
static inline __attribute__((no_instrument_function)) void jump_label_unlock(void) {}

static inline __attribute__((no_instrument_function)) int jump_label_apply_nops(struct module *mod)
{
 return 0;
}

static inline __attribute__((no_instrument_function)) void static_key_enable(struct static_key *key)
{
 int count = static_key_count(key);

 ({ static bool __attribute__ ((__section__(".data.unlikely"))) __warned; int __ret_warn_once = !!(count < 0 || count > 1); if (__builtin_expect(!!(__ret_warn_once && !__warned), 0)) { __warned = true; ({ int __ret_warn_on = !!(1); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("./include/linux/jump_label.h", 239); __builtin_expect(!!(__ret_warn_on), 0); }); } __builtin_expect(!!(__ret_warn_once), 0); });

 if (!count)
  static_key_slow_inc(key);
}

static inline __attribute__((no_instrument_function)) void static_key_disable(struct static_key *key)
{
 int count = static_key_count(key);

 ({ static bool __attribute__ ((__section__(".data.unlikely"))) __warned; int __ret_warn_once = !!(count < 0 || count > 1); if (__builtin_expect(!!(__ret_warn_once && !__warned), 0)) { __warned = true; ({ int __ret_warn_on = !!(1); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("./include/linux/jump_label.h", 249); __builtin_expect(!!(__ret_warn_on), 0); }); } __builtin_expect(!!(__ret_warn_once), 0); });

 if (count)
  static_key_slow_dec(key);
}
# 272 "./include/linux/jump_label.h"
struct static_key_true {
 struct static_key key;
};

struct static_key_false {
 struct static_key key;
};
# 305 "./include/linux/jump_label.h"
extern bool ____wrong_branch_error(void);
# 6 "./arch/x86/include/asm/string_64.h" 2




static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void *__inline_memcpy(void *to, const void *from, size_t n)
{
 unsigned long d0, d1, d2;
 asm volatile("rep ; movsl\n\t"
       "testb $2,%b4\n\t"
       "je 1f\n\t"
       "movsw\n"
       "1:\ttestb $1,%b4\n\t"
       "je 2f\n\t"
       "movsb\n"
       "2:"
       : "=&c" (d0), "=&D" (d1), "=&S" (d2)
       : "0" (n / 4), "q" (n), "1" ((long)to), "2" ((long)from)
       : "memory");
 return to;
}





extern void *memcpy(void *to, const void *from, size_t len);
extern void *__memcpy(void *to, const void *from, size_t len);
# 56 "./arch/x86/include/asm/string_64.h"
void *memset(void *s, int c, size_t n);
void *__memset(void *s, int c, size_t n);


void *memmove(void *dest, const void *src, size_t count);
void *__memmove(void *dest, const void *src, size_t count);

int memcmp(const void *cs, const void *ct, size_t count);
size_t strlen(const char *s);
char *strcpy(char *dest, const char *src);
char *strcat(char *dest, const char *src);
int strcmp(const char *cs, const char *ct);
# 82 "./arch/x86/include/asm/string_64.h"
__attribute__((warn_unused_result)) int memcpy_mcsafe_unrolled(void *dst, const void *src, size_t cnt);
extern struct static_key_false mcsafe_key;
# 99 "./arch/x86/include/asm/string_64.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) __attribute__((warn_unused_result)) int
memcpy_mcsafe(void *dst, const void *src, size_t cnt)
{

 if (__builtin_expect(!!(({ if (!__builtin_types_compatible_p(typeof(*&(&mcsafe_key)->key), struct static_key) && !__builtin_types_compatible_p(typeof(*&(&mcsafe_key)->key), struct static_key_true) && !__builtin_types_compatible_p(typeof(*&(&mcsafe_key)->key), struct static_key_false)) ____wrong_branch_error(); static_key_count((struct static_key *)&(&mcsafe_key)->key) > 0; })), 0))
  return memcpy_mcsafe_unrolled(dst, src, cnt);
 else

  ({ size_t __len = (cnt); void *__ret; if (__builtin_constant_p(cnt) && __len >= 64) __ret = __memcpy((dst), (src), __len); else __ret = __builtin_memcpy((dst), (src), __len); __ret; });
 return 0;
}
# 5 "./arch/x86/include/asm/string.h" 2
# 19 "./include/linux/string.h" 2


extern char * strcpy(char *,const char *);


extern char * strncpy(char *,const char *, __kernel_size_t);


size_t strlcpy(char *, const char *, size_t);


ssize_t __attribute__((warn_unused_result)) strscpy(char *, const char *, size_t);


extern char * strcat(char *, const char *);


extern char * strncat(char *, const char *, __kernel_size_t);


extern size_t strlcat(char *, const char *, __kernel_size_t);


extern int strcmp(const char *,const char *);


extern int strncmp(const char *,const char *,__kernel_size_t);


extern int strcasecmp(const char *s1, const char *s2);


extern int strncasecmp(const char *s1, const char *s2, size_t n);


extern char * strchr(const char *,int);


extern char * strchrnul(const char *,int);


extern char * strnchr(const char *, size_t, int);


extern char * strrchr(const char *,int);

extern char * __attribute__((warn_unused_result)) skip_spaces(const char *);

extern char *strim(char *);

static inline __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) char *strstrip(char *str)
{
 return strim(str);
}


extern char * strstr(const char *, const char *);


extern char * strnstr(const char *, const char *, size_t);


extern __kernel_size_t strlen(const char *);


extern __kernel_size_t strnlen(const char *,__kernel_size_t);


extern char * strpbrk(const char *,const char *);


extern char * strsep(char **,const char *);


extern __kernel_size_t strspn(const char *,const char *);


extern __kernel_size_t strcspn(const char *,const char *);
# 109 "./include/linux/string.h"
extern void * memscan(void *,int,__kernel_size_t);


extern int memcmp(const void *,const void *,__kernel_size_t);


extern void * memchr(const void *,int,__kernel_size_t);

void *memchr_inv(const void *s, int c, size_t n);
char *strreplace(char *s, char old, char new);

extern void kfree_const(const void *x);

extern char *kstrdup(const char *s, gfp_t gfp) __attribute__((__malloc__));
extern const char *kstrdup_const(const char *s, gfp_t gfp);
extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
extern void *kmemdup(const void *src, size_t len, gfp_t gfp);

extern char **argv_split(gfp_t gfp, const char *str, int *argcp);
extern void argv_free(char **argv);

extern bool sysfs_streq(const char *s1, const char *s2);
extern int kstrtobool(const char *s, bool *res);
static inline __attribute__((no_instrument_function)) int strtobool(const char *s, bool *res)
{
 return kstrtobool(s, res);
}

int match_string(const char * const *array, size_t n, const char *string);


int vbin_printf(u32 *bin_buf, size_t size, const char *fmt, va_list args);
int bstr_printf(char *buf, size_t size, const char *fmt, const u32 *bin_buf);
int bprintf(u32 *bin_buf, size_t size, const char *fmt, ...) __attribute__((format(printf, 3, 4)));


extern ssize_t memory_read_from_buffer(void *to, size_t count, loff_t *ppos,
           const void *from, size_t available);






static inline __attribute__((no_instrument_function)) bool strstarts(const char *str, const char *prefix)
{
 return strncmp(str, prefix, strlen(prefix)) == 0;
}

size_t memweight(const void *ptr, size_t bytes);
void memzero_explicit(void *s, size_t count);






static inline __attribute__((no_instrument_function)) const char *kbasename(const char *path)
{
 const char *tail = strrchr(path, '/');
 return tail ? tail + 1 : path;
}
# 9 "./include/linux/bitmap.h" 2
# 92 "./include/linux/bitmap.h"
extern int __bitmap_empty(const unsigned long *bitmap, unsigned int nbits);
extern int __bitmap_full(const unsigned long *bitmap, unsigned int nbits);
extern int __bitmap_equal(const unsigned long *bitmap1,
     const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
   unsigned int nbits);
extern void __bitmap_shift_right(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits);
extern void __bitmap_shift_left(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits);
extern int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern int __bitmap_intersects(const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern int __bitmap_subset(const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern int __bitmap_weight(const unsigned long *bitmap, unsigned int nbits);

extern void bitmap_set(unsigned long *map, unsigned int start, int len);
extern void bitmap_clear(unsigned long *map, unsigned int start, int len);

extern unsigned long bitmap_find_next_zero_area_off(unsigned long *map,
          unsigned long size,
          unsigned long start,
          unsigned int nr,
          unsigned long align_mask,
          unsigned long align_offset);
# 138 "./include/linux/bitmap.h"
static inline __attribute__((no_instrument_function)) unsigned long
bitmap_find_next_zero_area(unsigned long *map,
      unsigned long size,
      unsigned long start,
      unsigned int nr,
      unsigned long align_mask)
{
 return bitmap_find_next_zero_area_off(map, size, start, nr,
           align_mask, 0);
}

extern int __bitmap_parse(const char *buf, unsigned int buflen, int is_user,
   unsigned long *dst, int nbits);
extern int bitmap_parse_user(const char *ubuf, unsigned int ulen,
   unsigned long *dst, int nbits);
extern int bitmap_parselist(const char *buf, unsigned long *maskp,
   int nmaskbits);
extern int bitmap_parselist_user(const char *ubuf, unsigned int ulen,
   unsigned long *dst, int nbits);
extern void bitmap_remap(unsigned long *dst, const unsigned long *src,
  const unsigned long *old, const unsigned long *new, unsigned int nbits);
extern int bitmap_bitremap(int oldbit,
  const unsigned long *old, const unsigned long *new, int bits);
extern void bitmap_onto(unsigned long *dst, const unsigned long *orig,
  const unsigned long *relmap, unsigned int bits);
extern void bitmap_fold(unsigned long *dst, const unsigned long *orig,
  unsigned int sz, unsigned int nbits);
extern int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, int order);
extern void bitmap_release_region(unsigned long *bitmap, unsigned int pos, int order);
extern int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order);
extern unsigned int bitmap_from_u32array(unsigned long *bitmap,
      unsigned int nbits,
      const u32 *buf,
      unsigned int nwords);
extern unsigned int bitmap_to_u32array(u32 *buf,
           unsigned int nwords,
           const unsigned long *bitmap,
           unsigned int nbits);





extern unsigned int bitmap_ord_to_pos(const unsigned long *bitmap, unsigned int ord, unsigned int nbits);
extern int bitmap_print_to_pagebuf(bool list, char *buf,
       const unsigned long *maskp, int nmaskbits);







static inline __attribute__((no_instrument_function)) void bitmap_zero(unsigned long *dst, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = 0UL;
 else {
  unsigned int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  memset(dst, 0, len);
 }
}

static inline __attribute__((no_instrument_function)) void bitmap_fill(unsigned long *dst, unsigned int nbits)
{
 unsigned int nlongs = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)));
 if (!(__builtin_constant_p(nbits) && (nbits) <= 64)) {
  unsigned int len = (nlongs - 1) * sizeof(unsigned long);
  memset(dst, 0xff, len);
 }
 dst[nlongs - 1] = (~0UL >> (-(nbits) & (64 - 1)));
}

static inline __attribute__((no_instrument_function)) void bitmap_copy(unsigned long *dst, const unsigned long *src,
   unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = *src;
 else {
  unsigned int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  ({ size_t __len = (len); void *__ret; if (__builtin_constant_p(len) && __len >= 64) __ret = __memcpy((dst), (src), __len); else __ret = __builtin_memcpy((dst), (src), __len); __ret; });
 }
}

static inline __attribute__((no_instrument_function)) int bitmap_and(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return (*dst = *src1 & *src2 & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 return __bitmap_and(dst, src1, src2, nbits);
}

static inline __attribute__((no_instrument_function)) void bitmap_or(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = *src1 | *src2;
 else
  __bitmap_or(dst, src1, src2, nbits);
}

static inline __attribute__((no_instrument_function)) void bitmap_xor(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = *src1 ^ *src2;
 else
  __bitmap_xor(dst, src1, src2, nbits);
}

static inline __attribute__((no_instrument_function)) int bitmap_andnot(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return (*dst = *src1 & ~(*src2) & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 return __bitmap_andnot(dst, src1, src2, nbits);
}

static inline __attribute__((no_instrument_function)) void bitmap_complement(unsigned long *dst, const unsigned long *src,
   unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = ~(*src);
 else
  __bitmap_complement(dst, src, nbits);
}

static inline __attribute__((no_instrument_function)) int bitmap_equal(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return !((*src1 ^ *src2) & (~0UL >> (-(nbits) & (64 - 1))));




 return __bitmap_equal(src1, src2, nbits);
}

static inline __attribute__((no_instrument_function)) int bitmap_intersects(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return ((*src1 & *src2) & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 else
  return __bitmap_intersects(src1, src2, nbits);
}

static inline __attribute__((no_instrument_function)) int bitmap_subset(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return ! ((*src1 & ~(*src2)) & (~0UL >> (-(nbits) & (64 - 1))));
 else
  return __bitmap_subset(src1, src2, nbits);
}

static inline __attribute__((no_instrument_function)) int bitmap_empty(const unsigned long *src, unsigned nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return ! (*src & (~0UL >> (-(nbits) & (64 - 1))));

 return find_first_bit(src, nbits) == nbits;
}

static inline __attribute__((no_instrument_function)) int bitmap_full(const unsigned long *src, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return ! (~(*src) & (~0UL >> (-(nbits) & (64 - 1))));

 return find_first_zero_bit(src, nbits) == nbits;
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int bitmap_weight(const unsigned long *src, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return hweight_long(*src & (~0UL >> (-(nbits) & (64 - 1))));
 return __bitmap_weight(src, nbits);
}

static inline __attribute__((no_instrument_function)) void bitmap_shift_right(unsigned long *dst, const unsigned long *src,
    unsigned int shift, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = (*src & (~0UL >> (-(nbits) & (64 - 1)))) >> shift;
 else
  __bitmap_shift_right(dst, src, shift, nbits);
}

static inline __attribute__((no_instrument_function)) void bitmap_shift_left(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = (*src << shift) & (~0UL >> (-(nbits) & (64 - 1)));
 else
  __bitmap_shift_left(dst, src, shift, nbits);
}

static inline __attribute__((no_instrument_function)) int bitmap_parse(const char *buf, unsigned int buflen,
   unsigned long *maskp, int nmaskbits)
{
 return __bitmap_parse(buf, buflen, 0, maskp, nmaskbits);
}
# 352 "./include/linux/bitmap.h"
static inline __attribute__((no_instrument_function)) void bitmap_from_u64(unsigned long *dst, u64 mask)
{
 dst[0] = mask & (~0UL);

 if (sizeof(mask) > sizeof(unsigned long))
  dst[1] = mask >> 32;
}
# 12 "./include/linux/cpumask.h" 2



typedef struct cpumask { unsigned long bits[(((64) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } cpumask_t;
# 37 "./include/linux/cpumask.h"
extern int nr_cpu_ids;
# 88 "./include/linux/cpumask.h"
extern struct cpumask __cpu_possible_mask;
extern struct cpumask __cpu_online_mask;
extern struct cpumask __cpu_present_mask;
extern struct cpumask __cpu_active_mask;
# 118 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) unsigned int cpumask_check(unsigned int cpu)
{



 return cpu;
}
# 176 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) unsigned int cpumask_first(const struct cpumask *srcp)
{
 return find_first_bit(((srcp)->bits), 64);
}
# 188 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) unsigned int cpumask_next(int n, const struct cpumask *srcp)
{

 if (n != -1)
  cpumask_check(n);
 return find_next_bit(((srcp)->bits), 64, n+1);
}
# 203 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) unsigned int cpumask_next_zero(int n, const struct cpumask *srcp)
{

 if (n != -1)
  cpumask_check(n);
 return find_next_zero_bit(((srcp)->bits), 64, n+1);
}

int cpumask_next_and(int n, const struct cpumask *, const struct cpumask *);
int cpumask_any_but(const struct cpumask *mask, unsigned int cpu);
unsigned int cpumask_local_spread(unsigned int i, int node);
# 274 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) void cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
{
 set_bit(cpumask_check(cpu), ((dstp)->bits));
}






static inline __attribute__((no_instrument_function)) void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
{
 clear_bit(cpumask_check(cpu), ((dstp)->bits));
}
# 296 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
{
 return (__builtin_constant_p((cpumask_check(cpu))) ? constant_test_bit((cpumask_check(cpu)), ((((cpumask))->bits))) : variable_test_bit((cpumask_check(cpu)), ((((cpumask))->bits))));
}
# 310 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_test_and_set_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_set_bit(cpumask_check(cpu), ((cpumask)->bits));
}
# 324 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_test_and_clear_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_clear_bit(cpumask_check(cpu), ((cpumask)->bits));
}





static inline __attribute__((no_instrument_function)) void cpumask_setall(struct cpumask *dstp)
{
 bitmap_fill(((dstp)->bits), 64);
}





static inline __attribute__((no_instrument_function)) void cpumask_clear(struct cpumask *dstp)
{
 bitmap_zero(((dstp)->bits), 64);
}
# 355 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_and(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 return bitmap_and(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), 64);
}







static inline __attribute__((no_instrument_function)) void cpumask_or(struct cpumask *dstp, const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 bitmap_or(((dstp)->bits), ((src1p)->bits),
          ((src2p)->bits), 64);
}







static inline __attribute__((no_instrument_function)) void cpumask_xor(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 bitmap_xor(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), 64);
}
# 398 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_andnot(struct cpumask *dstp,
      const struct cpumask *src1p,
      const struct cpumask *src2p)
{
 return bitmap_andnot(((dstp)->bits), ((src1p)->bits),
       ((src2p)->bits), 64);
}






static inline __attribute__((no_instrument_function)) void cpumask_complement(struct cpumask *dstp,
          const struct cpumask *srcp)
{
 bitmap_complement(((dstp)->bits), ((srcp)->bits),
           64);
}






static inline __attribute__((no_instrument_function)) bool cpumask_equal(const struct cpumask *src1p,
    const struct cpumask *src2p)
{
 return bitmap_equal(((src1p)->bits), ((src2p)->bits),
       64);
}






static inline __attribute__((no_instrument_function)) bool cpumask_intersects(const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 return bitmap_intersects(((src1p)->bits), ((src2p)->bits),
            64);
}
# 449 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_subset(const struct cpumask *src1p,
     const struct cpumask *src2p)
{
 return bitmap_subset(((src1p)->bits), ((src2p)->bits),
        64);
}





static inline __attribute__((no_instrument_function)) bool cpumask_empty(const struct cpumask *srcp)
{
 return bitmap_empty(((srcp)->bits), 64);
}





static inline __attribute__((no_instrument_function)) bool cpumask_full(const struct cpumask *srcp)
{
 return bitmap_full(((srcp)->bits), 64);
}





static inline __attribute__((no_instrument_function)) unsigned int cpumask_weight(const struct cpumask *srcp)
{
 return bitmap_weight(((srcp)->bits), 64);
}







static inline __attribute__((no_instrument_function)) void cpumask_shift_right(struct cpumask *dstp,
           const struct cpumask *srcp, int n)
{
 bitmap_shift_right(((dstp)->bits), ((srcp)->bits), n,
            64);
}







static inline __attribute__((no_instrument_function)) void cpumask_shift_left(struct cpumask *dstp,
          const struct cpumask *srcp, int n)
{
 bitmap_shift_left(((dstp)->bits), ((srcp)->bits), n,
           64);
}






static inline __attribute__((no_instrument_function)) void cpumask_copy(struct cpumask *dstp,
    const struct cpumask *srcp)
{
 bitmap_copy(((dstp)->bits), ((srcp)->bits), 64);
}
# 560 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_parse_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parse_user(buf, len, ((dstp)->bits), 64);
}
# 574 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_parselist_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parselist_user(buf, len, ((dstp)->bits),
         64);
}
# 588 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpumask_parse(const char *buf, struct cpumask *dstp)
{
 char *nl = strchr(buf, '\n');
 unsigned int len = nl ? (unsigned int)(nl - buf) : strlen(buf);

 return bitmap_parse(buf, len, ((dstp)->bits), 64);
}
# 603 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int cpulist_parse(const char *buf, struct cpumask *dstp)
{
 return bitmap_parselist(buf, ((dstp)->bits), 64);
}




static inline __attribute__((no_instrument_function)) size_t cpumask_size(void)
{
 return (((64) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(long);
}
# 671 "./include/linux/cpumask.h"
typedef struct cpumask cpumask_var_t[1];




static inline __attribute__((no_instrument_function)) bool alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 return true;
}

static inline __attribute__((no_instrument_function)) bool alloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 return true;
}

static inline __attribute__((no_instrument_function)) bool zalloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((no_instrument_function)) bool zalloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((no_instrument_function)) void alloc_bootmem_cpumask_var(cpumask_var_t *mask)
{
}

static inline __attribute__((no_instrument_function)) void free_cpumask_var(cpumask_var_t mask)
{
}

static inline __attribute__((no_instrument_function)) void free_bootmem_cpumask_var(cpumask_var_t mask)
{
}




extern const unsigned long cpu_all_bits[(((64) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];
# 726 "./include/linux/cpumask.h"
void init_cpu_present(const struct cpumask *src);
void init_cpu_possible(const struct cpumask *src);
void init_cpu_online(const struct cpumask *src);

static inline __attribute__((no_instrument_function)) void reset_cpu_possible_mask(void)
{
 bitmap_zero(((&__cpu_possible_mask)->bits), 64);
}

static inline __attribute__((no_instrument_function)) void
set_cpu_possible(unsigned int cpu, bool possible)
{
 if (possible)
  cpumask_set_cpu(cpu, &__cpu_possible_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_possible_mask);
}

static inline __attribute__((no_instrument_function)) void
set_cpu_present(unsigned int cpu, bool present)
{
 if (present)
  cpumask_set_cpu(cpu, &__cpu_present_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_present_mask);
}

static inline __attribute__((no_instrument_function)) void
set_cpu_online(unsigned int cpu, bool online)
{
 if (online)
  cpumask_set_cpu(cpu, &__cpu_online_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_online_mask);
}

static inline __attribute__((no_instrument_function)) void
set_cpu_active(unsigned int cpu, bool active)
{
 if (active)
  cpumask_set_cpu(cpu, &__cpu_active_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_active_mask);
}
# 786 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) int __check_is_bitmap(const unsigned long *bitmap)
{
 return 1;
}
# 798 "./include/linux/cpumask.h"
extern const unsigned long
 cpu_bit_bitmap[64 +1][(((64) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];

static inline __attribute__((no_instrument_function)) const struct cpumask *get_cpu_mask(unsigned int cpu)
{
 const unsigned long *p = cpu_bit_bitmap[1 + cpu % 64];
 p -= cpu / 64;
 return ((struct cpumask *)(1 ? (p) : (void *)sizeof(__check_is_bitmap(p))));
}
# 835 "./include/linux/cpumask.h"
static inline __attribute__((no_instrument_function)) ssize_t
cpumap_print_to_pagebuf(bool list, char *buf, const struct cpumask *mask)
{
 return bitmap_print_to_pagebuf(list, buf, ((mask)->bits),
          nr_cpu_ids);
}
# 5 "./arch/x86/include/asm/cpumask.h" 2

extern cpumask_var_t cpu_callin_mask;
extern cpumask_var_t cpu_callout_mask;
extern cpumask_var_t cpu_initialized_mask;
extern cpumask_var_t cpu_sibling_setup_mask;

extern void setup_cpu_local_masks(void);
# 11 "./arch/x86/include/asm/msr.h" 2
# 1 "./arch/x86/include/uapi/asm/msr.h" 1






# 1 "./include/uapi/linux/ioctl.h" 1



# 1 "./arch/x86/include/uapi/asm/ioctl.h" 1
# 1 "./include/asm-generic/ioctl.h" 1



# 1 "./include/uapi/asm-generic/ioctl.h" 1
# 5 "./include/asm-generic/ioctl.h" 2





extern unsigned int __invalid_size_argument_for_IOC;
# 2 "./arch/x86/include/uapi/asm/ioctl.h" 2
# 5 "./include/uapi/linux/ioctl.h" 2
# 8 "./arch/x86/include/uapi/asm/msr.h" 2
# 12 "./arch/x86/include/asm/msr.h" 2

struct msr {
 union {
  struct {
   u32 l;
   u32 h;
  };
  u64 q;
 };
};

struct msr_info {
 u32 msr_no;
 struct msr reg;
 struct msr *msrs;
 int err;
};

struct msr_regs_info {
 u32 *regs;
 int err;
};

struct saved_msr {
 bool valid;
 struct msr_info info;
};

struct saved_msrs {
 unsigned int num;
 struct saved_msr *array;
};
# 67 "./arch/x86/include/asm/msr.h"
# 1 "./include/linux/tracepoint-defs.h" 1
# 11 "./include/linux/tracepoint-defs.h"
# 1 "./include/linux/static_key.h" 1
# 12 "./include/linux/tracepoint-defs.h" 2

struct trace_print_flags {
 unsigned long mask;
 const char *name;
};

struct trace_print_flags_u64 {
 unsigned long long mask;
 const char *name;
};

struct tracepoint_func {
 void *func;
 void *data;
 int prio;
};

struct tracepoint {
 const char *name;
 struct static_key key;
 int (*regfunc)(void);
 void (*unregfunc)(void);
 struct tracepoint_func *funcs;
};
# 68 "./arch/x86/include/asm/msr.h" 2

extern struct tracepoint __tracepoint_read_msr;
extern struct tracepoint __tracepoint_write_msr;
extern struct tracepoint __tracepoint_rdpmc;

extern void do_trace_write_msr(unsigned int msr, u64 val, int failed);
extern void do_trace_read_msr(unsigned int msr, u64 val, int failed);
extern void do_trace_rdpmc(unsigned int msr, u64 val, int failed);
# 90 "./arch/x86/include/asm/msr.h"
static inline __attribute__((no_instrument_function)) unsigned long long __attribute__((no_instrument_function)) __rdmsr(unsigned int msr)
{
 unsigned long low, high;

 asm volatile("1: rdmsr\n"
       "2:\n"
       " .pushsection \"__ex_table\",\"a\"\n" " .balign 4\n" " .long (" "1b" ") - .\n" " .long (" "2b" ") - .\n" " .long (" "ex_handler_rdmsr_unsafe" ") - .\n" " .popsection\n"
       : "=a" (low), "=d" (high) : "c" (msr));

 return ((low) | (high) << 32);
}

static inline __attribute__((no_instrument_function)) void __attribute__((no_instrument_function)) __wrmsr(unsigned int msr, u32 low, u32 high)
{
 asm volatile("1: wrmsr\n"
       "2:\n"
       " .pushsection \"__ex_table\",\"a\"\n" " .balign 4\n" " .long (" "1b" ") - .\n" " .long (" "2b" ") - .\n" " .long (" "ex_handler_wrmsr_unsafe" ") - .\n" " .popsection\n"
       : : "c" (msr), "a"(low), "d" (high) : "memory");
}

static inline __attribute__((no_instrument_function)) unsigned long long native_read_msr(unsigned int msr)
{
 unsigned long long val;

 val = __rdmsr(msr);

 if (static_key_false(&(__tracepoint_read_msr).key))
  do_trace_read_msr(msr, val, 0);

 return val;
}

static inline __attribute__((no_instrument_function)) unsigned long long native_read_msr_safe(unsigned int msr,
            int *err)
{
 unsigned long low, high;

 asm volatile("2: rdmsr ; xor %[err],%[err]\n"
       "1:\n\t"
       ".section .fixup,\"ax\"\n\t"
       "3: mov %[fault],%[err]\n\t"
       "xorl %%eax, %%eax\n\t"
       "xorl %%edx, %%edx\n\t"
       "jmp 1b\n\t"
       ".previous\n\t"
       " .pushsection \"__ex_table\",\"a\"\n" " .balign 4\n" " .long (" "2b" ") - .\n" " .long (" "3b" ") - .\n" " .long (" "ex_handler_default" ") - .\n" " .popsection\n"
       : [err] "=r" (*err), "=a" (low), "=d" (high)
       : "c" (msr), [fault] "i" (-5));
 if (static_key_false(&(__tracepoint_read_msr).key))
  do_trace_read_msr(msr, ((low) | (high) << 32), *err);
 return ((low) | (high) << 32);
}


static inline __attribute__((no_instrument_function)) void __attribute__((no_instrument_function))
native_write_msr(unsigned int msr, u32 low, u32 high)
{
 __wrmsr(msr, low, high);

 if (static_key_false(&(__tracepoint_write_msr).key))
  do_trace_write_msr(msr, ((u64)high << 32 | low), 0);
}


static inline __attribute__((no_instrument_function)) int __attribute__((no_instrument_function))
native_write_msr_safe(unsigned int msr, u32 low, u32 high)
{
 int err;

 asm volatile("2: wrmsr ; xor %[err],%[err]\n"
       "1:\n\t"
       ".section .fixup,\"ax\"\n\t"
       "3:  mov %[fault],%[err] ; jmp 1b\n\t"
       ".previous\n\t"
       " .pushsection \"__ex_table\",\"a\"\n" " .balign 4\n" " .long (" "2b" ") - .\n" " .long (" "3b" ") - .\n" " .long (" "ex_handler_default" ") - .\n" " .popsection\n"
       : [err] "=a" (err)
       : "c" (msr), "0" (low), "d" (high),
         [fault] "i" (-5)
       : "memory");
 if (static_key_false(&(__tracepoint_write_msr).key))
  do_trace_write_msr(msr, ((u64)high << 32 | low), err);
 return err;
}

extern int rdmsr_safe_regs(u32 regs[8]);
extern int wrmsr_safe_regs(u32 regs[8]);
# 186 "./arch/x86/include/asm/msr.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long long rdtsc(void)
{
 unsigned long low, high;

 asm volatile("rdtsc" : "=a" (low), "=d" (high));

 return ((low) | (high) << 32);
}
# 203 "./arch/x86/include/asm/msr.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long long rdtsc_ordered(void)
{
# 216 "./arch/x86/include/asm/msr.h"
 asm volatile("661:\n\t" "" "\n662:\n" ".skip -((" "((" "665""1""f-""664""1""f" ") ^ (((" "665""1""f-""664""1""f" ") ^ (" "665""2""f-""664""2""f" ")) & -(-((" "665""1""f-""664""1""f" ") - (" "665""2""f-""664""2""f" ")))))" " - (" "662b-661b" ")) > 0) * " "(" "((" "665""1""f-""664""1""f" ") ^ (((" "665""1""f-""664""1""f" ") ^ (" "665""2""f-""664""2""f" ")) & -(-((" "665""1""f-""664""1""f" ") - (" "665""2""f-""664""2""f" ")))))" " - (" "662b-661b" ")), 0x90\n" "663" ":\n" ".pushsection .altinstructions,\"a\"\n" " .long 661b - .\n" " .long " "664""1""f - .\n" " .word " "( 3*32+17)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""1""f-""664""1""f" "\n" " .byte " "663""b-662b" "\n" " .long 661b - .\n" " .long " "664""2""f - .\n" " .word " "( 3*32+18)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""2""f-""664""2""f" "\n" " .byte " "663""b-662b" "\n" ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" "664""1"":\n\t" "mfence" "\n" "665""1" ":\n\t" "664""2"":\n\t" "lfence" "\n" "665""2" ":\n\t" ".popsection" ::: "memory");

 return rdtsc();
}




static inline __attribute__((no_instrument_function)) unsigned long long native_read_pmc(int counter)
{
 unsigned long low, high;

 asm volatile("rdpmc" : "=a" (low), "=d" (high) : "c" (counter));
 if (static_key_false(&(__tracepoint_rdpmc).key))
  do_trace_rdpmc(counter, ((low) | (high) << 32), 0);
 return ((low) | (high) << 32);
}





# 1 "./include/linux/errno.h" 1



# 1 "./include/uapi/linux/errno.h" 1
# 1 "./arch/x86/include/uapi/asm/errno.h" 1
# 2 "./include/uapi/linux/errno.h" 2
# 5 "./include/linux/errno.h" 2
# 238 "./arch/x86/include/asm/msr.h" 2
# 251 "./arch/x86/include/asm/msr.h"
static inline __attribute__((no_instrument_function)) void wrmsr(unsigned int msr, u32 low, u32 high)
{
 native_write_msr(msr, low, high);
}




static inline __attribute__((no_instrument_function)) void wrmsrl(unsigned int msr, u64 val)
{
 native_write_msr(msr, (u32)(val & 0xffffffffULL), (u32)(val >> 32));
}


static inline __attribute__((no_instrument_function)) int wrmsr_safe(unsigned int msr, u32 low, u32 high)
{
 return native_write_msr_safe(msr, low, high);
}
# 280 "./arch/x86/include/asm/msr.h"
static inline __attribute__((no_instrument_function)) int rdmsrl_safe(unsigned int msr, unsigned long long *p)
{
 int err;

 *p = native_read_msr_safe(msr, &err);
 return err;
}
# 302 "./arch/x86/include/asm/msr.h"
static inline __attribute__((no_instrument_function)) int wrmsrl_safe(u32 msr, u64 val)
{
 return wrmsr_safe(msr, (u32)val, (u32)(val >> 32));
}





struct msr *msrs_alloc(void);
void msrs_free(struct msr *msrs);
int msr_set_bit(u32 msr, u8 bit);
int msr_clear_bit(u32 msr, u8 bit);


int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
void rdmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr *msrs);
void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr *msrs);
int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
# 21 "./arch/x86/include/asm/processor.h" 2
# 1 "./arch/x86/include/asm/desc_defs.h" 1
# 22 "./arch/x86/include/asm/desc_defs.h"
struct desc_struct {
 union {
  struct {
   unsigned int a;
   unsigned int b;
  };
  struct {
   u16 limit0;
   u16 base0;
   unsigned base1: 8, type: 4, s: 1, dpl: 2, p: 1;
   unsigned limit: 4, avl: 1, l: 1, d: 1, g: 1, base2: 8;
  };
 };
} __attribute__((packed));







enum {
 GATE_INTERRUPT = 0xE,
 GATE_TRAP = 0xF,
 GATE_CALL = 0xC,
 GATE_TASK = 0x5,
};


struct gate_struct64 {
 u16 offset_low;
 u16 segment;
 unsigned ist : 3, zero0 : 5, type : 5, dpl : 2, p : 1;
 u16 offset_middle;
 u32 offset_high;
 u32 zero1;
} __attribute__((packed));





enum {
 DESC_TSS = 0x9,
 DESC_LDT = 0x2,
 DESCTYPE_S = 0x10,
};


struct ldttss_desc64 {
 u16 limit0;
 u16 base0;
 unsigned base1 : 8, type : 5, dpl : 2, p : 1;
 unsigned limit1 : 4, zero0 : 3, g : 1, base2 : 8;
 u32 base3;
 u32 zero1;
} __attribute__((packed));


typedef struct gate_struct64 gate_desc;
typedef struct ldttss_desc64 ldt_desc;
typedef struct ldttss_desc64 tss_desc;
# 94 "./arch/x86/include/asm/desc_defs.h"
struct desc_ptr {
 unsigned short size;
 unsigned long address;
} __attribute__((packed)) ;
# 22 "./arch/x86/include/asm/processor.h" 2

# 1 "./arch/x86/include/asm/special_insns.h" 1
# 16 "./arch/x86/include/asm/special_insns.h"
extern unsigned long __force_order;

static inline __attribute__((no_instrument_function)) unsigned long native_read_cr0(void)
{
 unsigned long val;
 asm volatile("mov %%cr0,%0\n\t" : "=r" (val), "=m" (__force_order));
 return val;
}

static inline __attribute__((no_instrument_function)) void native_write_cr0(unsigned long val)
{
 asm volatile("mov %0,%%cr0": : "r" (val), "m" (__force_order));
}

static inline __attribute__((no_instrument_function)) unsigned long native_read_cr2(void)
{
 unsigned long val;
 asm volatile("mov %%cr2,%0\n\t" : "=r" (val), "=m" (__force_order));
 return val;
}

static inline __attribute__((no_instrument_function)) void native_write_cr2(unsigned long val)
{
 asm volatile("mov %0,%%cr2": : "r" (val), "m" (__force_order));
}

static inline __attribute__((no_instrument_function)) unsigned long native_read_cr3(void)
{
 unsigned long val;
 asm volatile("mov %%cr3,%0\n\t" : "=r" (val), "=m" (__force_order));
 return val;
}

static inline __attribute__((no_instrument_function)) void native_write_cr3(unsigned long val)
{
 asm volatile("mov %0,%%cr3": : "r" (val), "m" (__force_order));
}

static inline __attribute__((no_instrument_function)) unsigned long native_read_cr4(void)
{
 unsigned long val;
# 69 "./arch/x86/include/asm/special_insns.h"
 asm volatile("mov %%cr4,%0\n\t" : "=r" (val), "=m" (__force_order));

 return val;
}

static inline __attribute__((no_instrument_function)) void native_write_cr4(unsigned long val)
{
 asm volatile("mov %0,%%cr4": : "r" (val), "m" (__force_order));
}


static inline __attribute__((no_instrument_function)) unsigned long native_read_cr8(void)
{
 unsigned long cr8;
 asm volatile("movq %%cr8,%0" : "=r" (cr8));
 return cr8;
}

static inline __attribute__((no_instrument_function)) void native_write_cr8(unsigned long val)
{
 asm volatile("movq %0,%%cr8" :: "r" (val) : "memory");
}



static inline __attribute__((no_instrument_function)) u32 __read_pkru(void)
{
 u32 ecx = 0;
 u32 edx, pkru;





 asm volatile(".byte 0x0f,0x01,0xee\n\t"
       : "=a" (pkru), "=d" (edx)
       : "c" (ecx));
 return pkru;
}

static inline __attribute__((no_instrument_function)) void __write_pkru(u32 pkru)
{
 u32 ecx = 0, edx = 0;





 asm volatile(".byte 0x0f,0x01,0xef\n\t"
       : : "a" (pkru), "c"(ecx), "d"(edx));
}
# 131 "./arch/x86/include/asm/special_insns.h"
static inline __attribute__((no_instrument_function)) void native_wbinvd(void)
{
 asm volatile("wbinvd": : :"memory");
}

extern void native_load_gs_index(unsigned);





static inline __attribute__((no_instrument_function)) unsigned long read_cr0(void)
{
 return native_read_cr0();
}

static inline __attribute__((no_instrument_function)) void write_cr0(unsigned long x)
{
 native_write_cr0(x);
}

static inline __attribute__((no_instrument_function)) unsigned long read_cr2(void)
{
 return native_read_cr2();
}

static inline __attribute__((no_instrument_function)) void write_cr2(unsigned long x)
{
 native_write_cr2(x);
}

static inline __attribute__((no_instrument_function)) unsigned long read_cr3(void)
{
 return native_read_cr3();
}

static inline __attribute__((no_instrument_function)) void write_cr3(unsigned long x)
{
 native_write_cr3(x);
}

static inline __attribute__((no_instrument_function)) unsigned long __read_cr4(void)
{
 return native_read_cr4();
}

static inline __attribute__((no_instrument_function)) void __write_cr4(unsigned long x)
{
 native_write_cr4(x);
}

static inline __attribute__((no_instrument_function)) void wbinvd(void)
{
 native_wbinvd();
}



static inline __attribute__((no_instrument_function)) unsigned long read_cr8(void)
{
 return native_read_cr8();
}

static inline __attribute__((no_instrument_function)) void write_cr8(unsigned long x)
{
 native_write_cr8(x);
}

static inline __attribute__((no_instrument_function)) void load_gs_index(unsigned selector)
{
 native_load_gs_index(selector);
}





static inline __attribute__((no_instrument_function)) void clflush(volatile void *__p)
{
 asm volatile("clflush %0" : "+m" (*(volatile char *)__p));
}

static inline __attribute__((no_instrument_function)) void clflushopt(volatile void *__p)
{
 asm volatile ("661:\n\t" ".byte " "0x3e" "; clflush %P0" "\n662:\n" ".skip -(((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")) > 0) * " "((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")),0x90\n" "663" ":\n" ".pushsection .altinstructions,\"a\"\n" " .long 661b - .\n" " .long " "664""1""f - .\n" " .word " "( 9*32+23)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""1""f-""664""1""f" "\n" " .byte " "663""b-662b" "\n" ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" "664""1"":\n\t" ".byte 0x66; clflush %P0" "\n" "665""1" ":\n\t" ".popsection" : "+m" (*(volatile char *)__p) : "i" (0));



}

static inline __attribute__((no_instrument_function)) void clwb(volatile void *__p)
{
 volatile struct { char x[64]; } *p = __p;

 asm volatile("661:\n\t" ".byte " "0x3e" "; clflush (%[pax])" "\n662:\n" ".skip -((" "((" "665""1""f-""664""1""f" ") ^ (((" "665""1""f-""664""1""f" ") ^ (" "665""2""f-""664""2""f" ")) & -(-((" "665""1""f-""664""1""f" ") - (" "665""2""f-""664""2""f" ")))))" " - (" "662b-661b" ")) > 0) * " "(" "((" "665""1""f-""664""1""f" ") ^ (((" "665""1""f-""664""1""f" ") ^ (" "665""2""f-""664""2""f" ")) & -(-((" "665""1""f-""664""1""f" ") - (" "665""2""f-""664""2""f" ")))))" " - (" "662b-661b" ")), 0x90\n" "663" ":\n" ".pushsection .altinstructions,\"a\"\n" " .long 661b - .\n" " .long " "664""1""f - .\n" " .word " "( 9*32+23)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""1""f-""664""1""f" "\n" " .byte " "663""b-662b" "\n" " .long 661b - .\n" " .long " "664""2""f - .\n" " .word " "( 9*32+24)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""2""f-""664""2""f" "\n" " .byte " "663""b-662b" "\n" ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" "664""1"":\n\t" ".byte 0x66; clflush (%[pax])" "\n" "665""1" ":\n\t" "664""2"":\n\t" ".byte 0x66, 0x0f, 0xae, 0x30" "\n" "665""2" ":\n\t" ".popsection"





  : [p] "+m" (*p)
  : [pax] "a" (p));
}
# 24 "./arch/x86/include/asm/processor.h" 2
# 1 "./arch/x86/include/asm/fpu/types.h" 1
# 11 "./arch/x86/include/asm/fpu/types.h"
struct fregs_state {
 u32 cwd;
 u32 swd;
 u32 twd;
 u32 fip;
 u32 fcs;
 u32 foo;
 u32 fos;


 u32 st_space[20];


 u32 status;
};







struct fxregs_state {
 u16 cwd;
 u16 swd;
 u16 twd;
 u16 fop;
 union {
  struct {
   u64 rip;
   u64 rdp;
  };
  struct {
   u32 fip;
   u32 fcs;
   u32 foo;
   u32 fos;
  };
 };
 u32 mxcsr;
 u32 mxcsr_mask;


 u32 st_space[32];


 u32 xmm_space[64];

 u32 padding[12];

 union {
  u32 padding1[12];
  u32 sw_reserved[12];
 };

} __attribute__((aligned(16)));
# 75 "./arch/x86/include/asm/fpu/types.h"
struct swregs_state {
 u32 cwd;
 u32 swd;
 u32 twd;
 u32 fip;
 u32 fcs;
 u32 foo;
 u32 fos;

 u32 st_space[20];
 u8 ftop;
 u8 changed;
 u8 lookahead;
 u8 no_update;
 u8 rm;
 u8 alimit;
 struct math_emu_info *info;
 u32 entry_eip;
};




enum xfeature {
 XFEATURE_FP,
 XFEATURE_SSE,




 XFEATURE_YMM,
 XFEATURE_BNDREGS,
 XFEATURE_BNDCSR,
 XFEATURE_OPMASK,
 XFEATURE_ZMM_Hi256,
 XFEATURE_Hi16_ZMM,
 XFEATURE_PT_UNIMPLEMENTED_SO_FAR,
 XFEATURE_PKRU,

 XFEATURE_MAX,
};
# 135 "./arch/x86/include/asm/fpu/types.h"
struct reg_128_bit {
 u8 regbytes[128/8];
};
struct reg_256_bit {
 u8 regbytes[256/8];
};
struct reg_512_bit {
 u8 regbytes[512/8];
};
# 155 "./arch/x86/include/asm/fpu/types.h"
struct ymmh_struct {
 struct reg_128_bit hi_ymm[16];
} __attribute__((packed));



struct mpx_bndreg {
 u64 lower_bound;
 u64 upper_bound;
} __attribute__((packed));



struct mpx_bndreg_state {
 struct mpx_bndreg bndreg[4];
} __attribute__((packed));






struct mpx_bndcsr {
 u64 bndcfgu;
 u64 bndstatus;
} __attribute__((packed));




struct mpx_bndcsr_state {
 union {
  struct mpx_bndcsr bndcsr;
  u8 pad_to_64_bytes[64];
 };
} __attribute__((packed));







struct avx_512_opmask_state {
 u64 opmask_reg[8];
} __attribute__((packed));






struct avx_512_zmm_uppers_state {
 struct reg_256_bit zmm_upper[16];
} __attribute__((packed));





struct avx_512_hi16_state {
 struct reg_512_bit hi16_zmm[16];
} __attribute__((packed));





struct pkru_state {
 u32 pkru;
 u32 pad;
} __attribute__((packed));

struct xstate_header {
 u64 xfeatures;
 u64 xcomp_bv;
 u64 reserved[6];
} __attribute__((packed));
# 249 "./arch/x86/include/asm/fpu/types.h"
struct xregs_state {
 struct fxregs_state i387;
 struct xstate_header header;
 u8 extended_state_area[0];
} __attribute__ ((packed, aligned (64)));
# 264 "./arch/x86/include/asm/fpu/types.h"
union fpregs_state {
 struct fregs_state fsave;
 struct fxregs_state fxsave;
 struct swregs_state soft;
 struct xregs_state xsave;
 u8 __padding[((1UL) << 12)];
};






struct fpu {
# 290 "./arch/x86/include/asm/fpu/types.h"
 unsigned int last_cpu;
# 299 "./arch/x86/include/asm/fpu/types.h"
 unsigned char fpstate_active;
# 322 "./arch/x86/include/asm/fpu/types.h"
 unsigned char fpregs_active;
# 333 "./arch/x86/include/asm/fpu/types.h"
 union fpregs_state state;




};
# 25 "./arch/x86/include/asm/processor.h" 2

# 1 "./include/linux/personality.h" 1



# 1 "./include/uapi/linux/personality.h" 1
# 10 "./include/uapi/linux/personality.h"
enum {
 UNAME26 = 0x0020000,
 ADDR_NO_RANDOMIZE = 0x0040000,
 FDPIC_FUNCPTRS = 0x0080000,


 MMAP_PAGE_ZERO = 0x0100000,
 ADDR_COMPAT_LAYOUT = 0x0200000,
 READ_IMPLIES_EXEC = 0x0400000,
 ADDR_LIMIT_32BIT = 0x0800000,
 SHORT_INODE = 0x1000000,
 WHOLE_SECONDS = 0x2000000,
 STICKY_TIMEOUTS = 0x4000000,
 ADDR_LIMIT_3GB = 0x8000000,
};
# 41 "./include/uapi/linux/personality.h"
enum {
 PER_LINUX = 0x0000,
 PER_LINUX_32BIT = 0x0000 | ADDR_LIMIT_32BIT,
 PER_LINUX_FDPIC = 0x0000 | FDPIC_FUNCPTRS,
 PER_SVR4 = 0x0001 | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
 PER_SVR3 = 0x0002 | STICKY_TIMEOUTS | SHORT_INODE,
 PER_SCOSVR3 = 0x0003 | STICKY_TIMEOUTS |
      WHOLE_SECONDS | SHORT_INODE,
 PER_OSR5 = 0x0003 | STICKY_TIMEOUTS | WHOLE_SECONDS,
 PER_WYSEV386 = 0x0004 | STICKY_TIMEOUTS | SHORT_INODE,
 PER_ISCR4 = 0x0005 | STICKY_TIMEOUTS,
 PER_BSD = 0x0006,
 PER_SUNOS = 0x0006 | STICKY_TIMEOUTS,
 PER_XENIX = 0x0007 | STICKY_TIMEOUTS | SHORT_INODE,
 PER_LINUX32 = 0x0008,
 PER_LINUX32_3GB = 0x0008 | ADDR_LIMIT_3GB,
 PER_IRIX32 = 0x0009 | STICKY_TIMEOUTS,
 PER_IRIXN32 = 0x000a | STICKY_TIMEOUTS,
 PER_IRIX64 = 0x000b | STICKY_TIMEOUTS,
 PER_RISCOS = 0x000c,
 PER_SOLARIS = 0x000d | STICKY_TIMEOUTS,
 PER_UW7 = 0x000e | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
 PER_OSF4 = 0x000f,
 PER_HPUX = 0x0010,
 PER_MASK = 0x00ff,
};
# 5 "./include/linux/personality.h" 2
# 27 "./arch/x86/include/asm/processor.h" 2


# 1 "./include/linux/math64.h" 1




# 1 "./arch/x86/include/asm/div64.h" 1
# 74 "./arch/x86/include/asm/div64.h"
# 1 "./include/asm-generic/div64.h" 1
# 75 "./arch/x86/include/asm/div64.h" 2
# 6 "./include/linux/math64.h" 2
# 18 "./include/linux/math64.h"
static inline __attribute__((no_instrument_function)) u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}




static inline __attribute__((no_instrument_function)) s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}




static inline __attribute__((no_instrument_function)) u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}




static inline __attribute__((no_instrument_function)) u64 div64_u64(u64 dividend, u64 divisor)
{
 return dividend / divisor;
}




static inline __attribute__((no_instrument_function)) s64 div64_s64(s64 dividend, s64 divisor)
{
 return dividend / divisor;
}
# 97 "./include/linux/math64.h"
static inline __attribute__((no_instrument_function)) u64 div_u64(u64 dividend, u32 divisor)
{
 u32 remainder;
 return div_u64_rem(dividend, divisor, &remainder);
}






static inline __attribute__((no_instrument_function)) s64 div_s64(s64 dividend, s32 divisor)
{
 s32 remainder;
 return div_s64_rem(dividend, divisor, &remainder);
}


u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder);

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) u32
__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
{
 u32 ret = 0;

 while (dividend >= divisor) {


  asm("" : "+rm"(dividend));

  dividend -= divisor;
  ret++;
 }

 *remainder = dividend;

 return ret;
}





static inline __attribute__((no_instrument_function)) u64 mul_u32_u32(u32 a, u32 b)
{
 return (u64)a * b;
}





static inline __attribute__((no_instrument_function)) u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned int shift)
{
 return (u64)(((unsigned __int128)a * mul) >> shift);
}



static inline __attribute__((no_instrument_function)) u64 mul_u64_u64_shr(u64 a, u64 mul, unsigned int shift)
{
 return (u64)(((unsigned __int128)a * mul) >> shift);
}
# 228 "./include/linux/math64.h"
static inline __attribute__((no_instrument_function)) u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
{
 union {
  u64 ll;
  struct {



   u32 low, high;

  } l;
 } u, rl, rh;

 u.ll = a;
 rl.ll = mul_u32_u32(u.l.low, mul);
 rh.ll = mul_u32_u32(u.l.high, mul) + rl.l.high;


 rl.l.high = ({ uint32_t __base = (divisor); uint32_t __rem; __rem = ((uint64_t)(rh.ll)) % __base; (rh.ll) = ((uint64_t)(rh.ll)) / __base; __rem; });


 ({ uint32_t __base = (divisor); uint32_t __rem; __rem = ((uint64_t)(rl.ll)) % __base; (rl.ll) = ((uint64_t)(rl.ll)) / __base; __rem; });

 rl.l.high = rh.l.low;
 return rl.ll;
}
# 30 "./arch/x86/include/asm/processor.h" 2
# 1 "./include/linux/err.h" 1






# 1 "./arch/x86/include/uapi/asm/errno.h" 1
# 8 "./include/linux/err.h" 2
# 23 "./include/linux/err.h"
static inline __attribute__((no_instrument_function)) void * __attribute__((warn_unused_result)) ERR_PTR(long error)
{
 return (void *) error;
}

static inline __attribute__((no_instrument_function)) long __attribute__((warn_unused_result)) PTR_ERR( const void *ptr)
{
 return (long) ptr;
}

static inline __attribute__((no_instrument_function)) bool __attribute__((warn_unused_result)) IS_ERR( const void *ptr)
{
 return __builtin_expect(!!((unsigned long)(void *)((unsigned long)ptr) >= (unsigned long)-4095), 0);
}

static inline __attribute__((no_instrument_function)) bool __attribute__((warn_unused_result)) IS_ERR_OR_NULL( const void *ptr)
{
 return __builtin_expect(!!(!ptr), 0) || __builtin_expect(!!((unsigned long)(void *)((unsigned long)ptr) >= (unsigned long)-4095), 0);
}
# 50 "./include/linux/err.h"
static inline __attribute__((no_instrument_function)) void * __attribute__((warn_unused_result)) ERR_CAST( const void *ptr)
{

 return (void *) ptr;
}

static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) PTR_ERR_OR_ZERO( const void *ptr)
{
 if (IS_ERR(ptr))
  return PTR_ERR(ptr);
 else
  return 0;
}
# 31 "./arch/x86/include/asm/processor.h" 2
# 1 "./include/linux/irqflags.h" 1
# 15 "./include/linux/irqflags.h"
# 1 "./arch/x86/include/asm/irqflags.h" 1
# 15 "./arch/x86/include/asm/irqflags.h"
static inline __attribute__((no_instrument_function)) unsigned long native_save_fl(void)
{
 unsigned long flags;






 asm volatile("# __raw_save_flags\n\t"
       "pushf ; pop %0"
       : "=rm" (flags)
       :
       : "memory");

 return flags;
}

static inline __attribute__((no_instrument_function)) void native_restore_fl(unsigned long flags)
{
 asm volatile("push %0 ; popf"
       :
       :"g" (flags)
       :"memory", "cc");
}

static inline __attribute__((no_instrument_function)) void native_irq_disable(void)
{
 asm volatile("cli": : :"memory");
}

static inline __attribute__((no_instrument_function)) void native_irq_enable(void)
{
 asm volatile("sti": : :"memory");
}

static inline __attribute__((no_instrument_function)) __attribute__((__section__(".cpuidle.text"))) void native_safe_halt(void)
{
 asm volatile("sti; hlt": : :"memory");
}

static inline __attribute__((no_instrument_function)) __attribute__((__section__(".cpuidle.text"))) void native_halt(void)
{
 asm volatile("hlt": : :"memory");
}
# 69 "./arch/x86/include/asm/irqflags.h"
static inline __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) unsigned long arch_local_save_flags(void)
{
 return native_save_fl();
}

static inline __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) void arch_local_irq_restore(unsigned long flags)
{
 native_restore_fl(flags);
}

static inline __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) void arch_local_irq_disable(void)
{
 native_irq_disable();
}

static inline __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) void arch_local_irq_enable(void)
{
 native_irq_enable();
}





static inline __attribute__((no_instrument_function)) __attribute__((__section__(".cpuidle.text"))) void arch_safe_halt(void)
{
 native_safe_halt();
}





static inline __attribute__((no_instrument_function)) __attribute__((__section__(".cpuidle.text"))) void halt(void)
{
 native_halt();
}




static inline __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) unsigned long arch_local_irq_save(void)
{
 unsigned long flags = arch_local_save_flags();
 arch_local_irq_disable();
 return flags;
}
# 155 "./arch/x86/include/asm/irqflags.h"
static inline __attribute__((no_instrument_function)) int arch_irqs_disabled_flags(unsigned long flags)
{
 return !(flags & ((1UL) << (9)));
}

static inline __attribute__((no_instrument_function)) int arch_irqs_disabled(void)
{
 unsigned long flags = arch_local_save_flags();

 return arch_irqs_disabled_flags(flags);
}
# 16 "./include/linux/irqflags.h" 2
# 32 "./arch/x86/include/asm/processor.h" 2
# 46 "./arch/x86/include/asm/processor.h"
static inline __attribute__((no_instrument_function)) void *current_text_addr(void)
{
 void *pc;

 asm volatile("mov $1f, %0; 1:":"=r" (pc));

 return pc;
}
# 68 "./arch/x86/include/asm/processor.h"
enum tlb_infos {
 ENTRIES,
 NR_INFO
};

extern u16 __attribute__((__section__(".data..read_mostly"))) tlb_lli_4k[NR_INFO];
extern u16 __attribute__((__section__(".data..read_mostly"))) tlb_lli_2m[NR_INFO];
extern u16 __attribute__((__section__(".data..read_mostly"))) tlb_lli_4m[NR_INFO];
extern u16 __attribute__((__section__(".data..read_mostly"))) tlb_lld_4k[NR_INFO];
extern u16 __attribute__((__section__(".data..read_mostly"))) tlb_lld_2m[NR_INFO];
extern u16 __attribute__((__section__(".data..read_mostly"))) tlb_lld_4m[NR_INFO];
extern u16 __attribute__((__section__(".data..read_mostly"))) tlb_lld_1g[NR_INFO];







struct cpuinfo_x86 {
 __u8 x86;
 __u8 x86_vendor;
 __u8 x86_model;
 __u8 x86_mask;
# 101 "./arch/x86/include/asm/processor.h"
 int x86_tlbsize;

 __u8 x86_virt_bits;
 __u8 x86_phys_bits;

 __u8 x86_coreid_bits;
 __u8 cu_id;

 __u32 extended_cpuid_level;

 int cpuid_level;
 __u32 x86_capability[18 + 1];
 char x86_vendor_id[16];
 char x86_model_id[64];

 int x86_cache_size;
 int x86_cache_alignment;

 int x86_cache_max_rmid;
 int x86_cache_occ_scale;
 int x86_power;
 unsigned long loops_per_jiffy;

 u16 x86_max_cores;
 u16 apicid;
 u16 initial_apicid;
 u16 x86_clflush_size;

 u16 booted_cores;

 u16 phys_proc_id;

 u16 logical_proc_id;

 u16 cpu_core_id;

 u16 cpu_index;
 u32 microcode;
};

struct cpuid_regs {
 u32 eax, ebx, ecx, edx;
};

enum cpuid_regs_idx {
 CPUID_EAX = 0,
 CPUID_EBX,
 CPUID_ECX,
 CPUID_EDX,
};
# 166 "./arch/x86/include/asm/processor.h"
extern struct cpuinfo_x86 boot_cpu_data;
extern struct cpuinfo_x86 new_cpu_data;

extern struct tss_struct doublefault_tss;
extern __u32 cpu_caps_cleared[18];
extern __u32 cpu_caps_set[18];


extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(struct cpuinfo_x86) cpu_info;






extern const struct seq_operations cpuinfo_op;



extern void cpu_detect(struct cpuinfo_x86 *c);

extern void early_cpu_init(void);
extern void identify_boot_cpu(void);
extern void identify_secondary_cpu(struct cpuinfo_x86 *);
extern void print_cpu_info(struct cpuinfo_x86 *);
void print_cpu_msr(struct cpuinfo_x86 *);
extern void init_scattered_cpuid_features(struct cpuinfo_x86 *c);
extern u32 get_scattered_cpuid_leaf(unsigned int level,
        unsigned int sub_leaf,
        enum cpuid_regs_idx reg);
extern unsigned int init_intel_cacheinfo(struct cpuinfo_x86 *c);
extern void init_amd_cacheinfo(struct cpuinfo_x86 *c);

extern void detect_extended_topology(struct cpuinfo_x86 *c);
extern void detect_ht(struct cpuinfo_x86 *c);




static inline __attribute__((no_instrument_function)) int have_cpuid_p(void)
{
 return 1;
}

static inline __attribute__((no_instrument_function)) void native_cpuid(unsigned int *eax, unsigned int *ebx,
    unsigned int *ecx, unsigned int *edx)
{

 asm volatile("cpuid"
     : "=a" (*eax),
       "=b" (*ebx),
       "=c" (*ecx),
       "=d" (*edx)
     : "0" (*eax), "2" (*ecx)
     : "memory");
}
# 236 "./arch/x86/include/asm/processor.h"
static inline __attribute__((no_instrument_function)) unsigned int native_cpuid_eax(unsigned int op) { unsigned int eax = op, ebx, ecx = 0, edx; native_cpuid(&eax, &ebx, &ecx, &edx); return eax; }
static inline __attribute__((no_instrument_function)) unsigned int native_cpuid_ebx(unsigned int op) { unsigned int eax = op, ebx, ecx = 0, edx; native_cpuid(&eax, &ebx, &ecx, &edx); return ebx; }
static inline __attribute__((no_instrument_function)) unsigned int native_cpuid_ecx(unsigned int op) { unsigned int eax = op, ebx, ecx = 0, edx; native_cpuid(&eax, &ebx, &ecx, &edx); return ecx; }
static inline __attribute__((no_instrument_function)) unsigned int native_cpuid_edx(unsigned int op) { unsigned int eax = op, ebx, ecx = 0, edx; native_cpuid(&eax, &ebx, &ecx, &edx); return edx; }

static inline __attribute__((no_instrument_function)) void load_cr3(pgd_t *pgdir)
{
 write_cr3(__phys_addr_nodebug((unsigned long)(pgdir)));
}
# 295 "./arch/x86/include/asm/processor.h"
struct x86_hw_tss {
 u32 reserved1;
 u64 sp0;
 u64 sp1;
 u64 sp2;
 u64 reserved2;
 u64 ist[7];
 u32 reserved3;
 u32 reserved4;
 u16 reserved5;
 u16 io_bitmap_base;

} __attribute__((packed));
# 319 "./arch/x86/include/asm/processor.h"
struct tss_struct {



 struct x86_hw_tss x86_tss;







 unsigned long io_bitmap[((65536/8)/sizeof(long)) + 1];
# 341 "./arch/x86/include/asm/processor.h"
} __attribute__((__aligned__((1 << (6)))));

extern __attribute__((section(".data..percpu" ""))) __typeof__(struct tss_struct) cpu_tss __attribute__((__aligned__((1 << (6)))));
# 362 "./arch/x86/include/asm/processor.h"
struct orig_ist {
 unsigned long ist[7];
};


extern __attribute__((section(".data..percpu" ""))) __typeof__(struct orig_ist) orig_ist;

union irq_stack_union {
 char irq_stack[(((1UL) << 12) << (2 + 0))];





 struct {
  char gs_base[40];
  unsigned long stack_canary;
 };
};

extern __attribute__((section(".data..percpu" "..first"))) __typeof__(union irq_stack_union) irq_stack_union ;
extern typeof(irq_stack_union) init_per_cpu__irq_stack_union;

extern __attribute__((section(".data..percpu" ""))) __typeof__(char *) irq_stack_ptr;
extern __attribute__((section(".data..percpu" ""))) __typeof__(unsigned int) irq_count;
extern void ignore_sysret(void);
# 413 "./arch/x86/include/asm/processor.h"
extern unsigned int fpu_kernel_xstate_size;
extern unsigned int fpu_user_xstate_size;

struct perf_event;

typedef struct {
 unsigned long seg;
} mm_segment_t;

struct thread_struct {

 struct desc_struct tls_array[3];
 unsigned long sp0;
 unsigned long sp;



 unsigned short es;
 unsigned short ds;
 unsigned short fsindex;
 unsigned short gsindex;


 u32 status;


 unsigned long fsbase;
 unsigned long gsbase;
# 451 "./arch/x86/include/asm/processor.h"
 struct perf_event *ptrace_bps[4];

 unsigned long debugreg6;

 unsigned long ptrace_dr7;

 unsigned long cr2;
 unsigned long trap_nr;
 unsigned long error_code;





 unsigned long *io_bitmap_ptr;
 unsigned long iopl;

 unsigned io_bitmap_max;

 mm_segment_t addr_limit;

 unsigned int sig_on_uaccess_err:1;
 unsigned int uaccess_err:1;


 struct fpu fpu;




};
# 495 "./arch/x86/include/asm/processor.h"
static inline __attribute__((no_instrument_function)) void native_set_iopl_mask(unsigned mask)
{
# 509 "./arch/x86/include/asm/processor.h"
}

static inline __attribute__((no_instrument_function)) void
native_load_sp0(struct tss_struct *tss, struct thread_struct *thread)
{
 tss->x86_tss.sp0 = thread->sp0;







}

static inline __attribute__((no_instrument_function)) void native_swapgs(void)
{

 asm volatile("swapgs" ::: "memory");

}

static inline __attribute__((no_instrument_function)) unsigned long current_top_of_stack(void)
{

 return ({ typeof(cpu_tss.x86_tss.sp0) pfo_ret__; switch (sizeof(cpu_tss.x86_tss.sp0)) { case 1: asm("mov" "b ""%%""gs"":" "%" "P1"",%0" : "=q" (pfo_ret__) : "p" (&(cpu_tss.x86_tss.sp0))); break; case 2: asm("mov" "w ""%%""gs"":" "%" "P1"",%0" : "=r" (pfo_ret__) : "p" (&(cpu_tss.x86_tss.sp0))); break; case 4: asm("mov" "l ""%%""gs"":" "%" "P1"",%0" : "=r" (pfo_ret__) : "p" (&(cpu_tss.x86_tss.sp0))); break; case 8: asm("mov" "q ""%%""gs"":" "%" "P1"",%0" : "=r" (pfo_ret__) : "p" (&(cpu_tss.x86_tss.sp0))); break; default: __bad_percpu_size(); } pfo_ret__; });




}






static inline __attribute__((no_instrument_function)) void load_sp0(struct tss_struct *tss,
       struct thread_struct *thread)
{
 native_load_sp0(tss, thread);
}





extern void release_thread(struct task_struct *);

unsigned long get_wchan(struct task_struct *p);






static inline __attribute__((no_instrument_function)) void cpuid(unsigned int op,
    unsigned int *eax, unsigned int *ebx,
    unsigned int *ecx, unsigned int *edx)
{
 *eax = op;
 *ecx = 0;
 native_cpuid(eax, ebx, ecx, edx);
}


static inline __attribute__((no_instrument_function)) void cpuid_count(unsigned int op, int count,
          unsigned int *eax, unsigned int *ebx,
          unsigned int *ecx, unsigned int *edx)
{
 *eax = op;
 *ecx = count;
 native_cpuid(eax, ebx, ecx, edx);
}




static inline __attribute__((no_instrument_function)) unsigned int cpuid_eax(unsigned int op)
{
 unsigned int eax, ebx, ecx, edx;

 cpuid(op, &eax, &ebx, &ecx, &edx);

 return eax;
}

static inline __attribute__((no_instrument_function)) unsigned int cpuid_ebx(unsigned int op)
{
 unsigned int eax, ebx, ecx, edx;

 cpuid(op, &eax, &ebx, &ecx, &edx);

 return ebx;
}

static inline __attribute__((no_instrument_function)) unsigned int cpuid_ecx(unsigned int op)
{
 unsigned int eax, ebx, ecx, edx;

 cpuid(op, &eax, &ebx, &ecx, &edx);

 return ecx;
}

static inline __attribute__((no_instrument_function)) unsigned int cpuid_edx(unsigned int op)
{
 unsigned int eax, ebx, ecx, edx;

 cpuid(op, &eax, &ebx, &ecx, &edx);

 return edx;
}


static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void rep_nop(void)
{
 asm volatile("rep; nop" ::: "memory");
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void cpu_relax(void)
{
 rep_nop();
}
# 648 "./arch/x86/include/asm/processor.h"
static inline __attribute__((no_instrument_function)) void sync_core(void)
{
# 672 "./arch/x86/include/asm/processor.h"
 register void *__sp asm("rsp");
# 683 "./arch/x86/include/asm/processor.h"
 unsigned int tmp;

 asm volatile (
  "mov %%ss, %0\n\t"
  "pushq %q0\n\t"
  "pushq %%rsp\n\t"
  "addq $8, (%%rsp)\n\t"
  "pushfq\n\t"
  "mov %%cs, %0\n\t"
  "pushq %q0\n\t"
  "pushq $1f\n\t"
  "iretq\n\t"
  "1:"
  : "=&r" (tmp), "+r" (__sp) : : "cc", "memory");

}

extern void select_idle_routine(const struct cpuinfo_x86 *c);
extern void amd_e400_c1e_apic_setup(void);

extern unsigned long boot_option_idle_override;

enum idle_boot_override {IDLE_NO_OVERRIDE=0, IDLE_HALT, IDLE_NOMWAIT,
    IDLE_POLL};

extern void enable_sep_cpu(void);
extern int sysenter_setup(void);

extern void early_trap_init(void);
void early_trap_pf_init(void);


extern struct desc_ptr early_gdt_descr;

extern void cpu_set_gdt(int);
extern void switch_to_new_gdt(int);
extern void load_percpu_segment(int);
extern void cpu_init(void);

static inline __attribute__((no_instrument_function)) unsigned long get_debugctlmsr(void)
{
 unsigned long debugctlmsr = 0;





 ((debugctlmsr) = native_read_msr((0x000001d9)));

 return debugctlmsr;
}

static inline __attribute__((no_instrument_function)) void update_debugctlmsr(unsigned long debugctlmsr)
{




 wrmsrl(0x000001d9, debugctlmsr);
}

extern void set_task_blockstep(struct task_struct *task, bool on);


extern int bootloader_type;
extern int bootloader_version;

extern char ignore_fpu_irq;
# 769 "./arch/x86/include/asm/processor.h"
static inline __attribute__((no_instrument_function)) void prefetch(const void *x)
{
 asm volatile ("661:\n\t" "prefetcht0 %P1" "\n662:\n" ".skip -(((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")) > 0) * " "((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")),0x90\n" "663" ":\n" ".pushsection .altinstructions,\"a\"\n" " .long 661b - .\n" " .long " "664""1""f - .\n" " .word " "( 0*32+25)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""1""f-""664""1""f" "\n" " .byte " "663""b-662b" "\n" ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" "664""1"":\n\t" "prefetchnta %P1" "\n" "665""1" ":\n\t" ".popsection" : : "i" (0), "m" (*(const char *)x));


}






static inline __attribute__((no_instrument_function)) void prefetchw(const void *x)
{
 asm volatile ("661:\n\t" "prefetcht0 %P1" "\n662:\n" ".skip -(((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")) > 0) * " "((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")),0x90\n" "663" ":\n" ".pushsection .altinstructions,\"a\"\n" " .long 661b - .\n" " .long " "664""1""f - .\n" " .word " "( 6*32+ 8)" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""1""f-""664""1""f" "\n" " .byte " "663""b-662b" "\n" ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" "664""1"":\n\t" "prefetchw %P1" "\n" "665""1" ":\n\t" ".popsection" : : "i" (0), "m" (*(const char *)x));


}

static inline __attribute__((no_instrument_function)) void spin_lock_prefetch(const void *x)
{
 prefetchw(x);
}
# 863 "./arch/x86/include/asm/processor.h"
extern unsigned long KSTK_ESP(struct task_struct *task);



extern unsigned long thread_saved_pc(struct task_struct *tsk);

extern void start_thread(struct pt_regs *regs, unsigned long new_ip,
            unsigned long new_sp);
# 884 "./arch/x86/include/asm/processor.h"
extern int get_tsc_mode(unsigned long adr);
extern int set_tsc_mode(unsigned int val);
# 895 "./arch/x86/include/asm/processor.h"
static inline __attribute__((no_instrument_function)) int mpx_enable_management(void)
{
 return -22;
}
static inline __attribute__((no_instrument_function)) int mpx_disable_management(void)
{
 return -22;
}


extern u16 amd_get_nb_id(int cpu);
extern u32 amd_get_nodes_per_socket(void);

static inline __attribute__((no_instrument_function)) uint32_t hypervisor_cpuid_base(const char *sig, uint32_t leaves)
{
 uint32_t base, eax, signature[3];

 for (base = 0x40000000; base < 0x40010000; base += 0x100) {
  cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);

  if (!memcmp(sig, signature, 12) &&
      (leaves == 0 || ((eax - base) >= leaves)))
   return base;
 }

 return 0;
}

extern unsigned long arch_align_stack(unsigned long sp);
extern void free_init_pages(char *what, unsigned long begin, unsigned long end);

void default_idle(void);






void stop_this_cpu(void *dummy);
void df_debug(struct pt_regs *regs, long error_code);
# 5 "./arch/x86/include/asm/cpufeature.h" 2






enum cpuid_leafs
{
 CPUID_1_EDX = 0,
 CPUID_8000_0001_EDX,
 CPUID_8086_0001_EDX,
 CPUID_LNX_1,
 CPUID_1_ECX,
 CPUID_C000_0001_EDX,
 CPUID_8000_0001_ECX,
 CPUID_LNX_2,
 CPUID_LNX_3,
 CPUID_7_0_EBX,
 CPUID_D_1_EAX,
 CPUID_F_0_EDX,
 CPUID_F_1_EDX,
 CPUID_8000_0008_EBX,
 CPUID_6_EAX,
 CPUID_8000_000A_EDX,
 CPUID_7_ECX,
 CPUID_8000_0007_EBX,
};


extern const char * const x86_cap_flags[18*32];
extern const char * const x86_power_flags[32];
# 47 "./arch/x86/include/asm/cpufeature.h"
extern const char * const x86_bug_flags[1*32];
# 53 "./arch/x86/include/asm/thread_info.h" 2


struct thread_info {
 unsigned long flags;
};
# 155 "./arch/x86/include/asm/thread_info.h"
static inline __attribute__((no_instrument_function)) unsigned long current_stack_pointer(void)
{
 unsigned long sp;

 asm("mov %%rsp,%0" : "=g" (sp));



 return sp;
}
# 175 "./arch/x86/include/asm/thread_info.h"
static inline __attribute__((no_instrument_function)) int arch_within_stack_frames(const void * const stack,
        const void * const stackend,
        const void *obj, unsigned long len)
{

 const void *frame = ((void *)0);
 const void *oldframe;

 oldframe = __builtin_frame_address(1);
 if (oldframe)
  frame = __builtin_frame_address(2);






 while (stack <= frame && frame < stackend) {






  if (obj + len <= frame)
   return obj >= oldframe + 2 * sizeof(void *) ? 1 : -1;
  oldframe = frame;
  frame = *(const void * const *)frame;
 }
 return -1;



}
# 239 "./arch/x86/include/asm/thread_info.h"
extern void arch_task_cache_init(void);
extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
extern void arch_release_task_struct(struct task_struct *tsk);
# 26 "./include/linux/thread_info.h" 2
# 41 "./include/linux/thread_info.h"
static inline __attribute__((no_instrument_function)) void set_ti_thread_flag(struct thread_info *ti, int flag)
{
 set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((no_instrument_function)) void clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((no_instrument_function)) int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((no_instrument_function)) int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((no_instrument_function)) int test_ti_thread_flag(struct thread_info *ti, int flag)
{
 return (__builtin_constant_p((flag)) ? constant_test_bit((flag), ((unsigned long *)&ti->flags)) : variable_test_bit((flag), ((unsigned long *)&ti->flags)));
}
# 99 "./include/linux/thread_info.h"
static inline __attribute__((no_instrument_function)) void check_object_size(const void *ptr, unsigned long n,
         bool to_user)
{ }
# 7 "./arch/x86/include/asm/preempt.h" 2

extern __attribute__((section(".data..percpu" ""))) __typeof__(int) __preempt_count;
# 20 "./arch/x86/include/asm/preempt.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int preempt_count(void)
{
 return ({ typeof(__preempt_count) pfo_ret__; switch (sizeof(__preempt_count)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (__preempt_count)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; default: __bad_percpu_size(); } pfo_ret__; }) & ~0x80000000;
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void preempt_count_set(int pc)
{
 int old, new;

 do {
  old = ({ typeof(__preempt_count) pfo_ret__; switch (sizeof(__preempt_count)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (__preempt_count)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; default: __bad_percpu_size(); } pfo_ret__; });
  new = (old & 0x80000000) |
   (pc & ~0x80000000);
 } while (({ typeof(__preempt_count) pco_ret__; typeof(__preempt_count) pco_old__ = (old); typeof(__preempt_count) pco_new__ = (new); switch (sizeof(__preempt_count)) { case 1: asm("cmpxchgb %2, ""%%""gs"":" "%" "1" : "=a" (pco_ret__), "+m" (__preempt_count) : "q" (pco_new__), "0" (pco_old__) : "memory"); break; case 2: asm("cmpxchgw %2, ""%%""gs"":" "%" "1" : "=a" (pco_ret__), "+m" (__preempt_count) : "r" (pco_new__), "0" (pco_old__) : "memory"); break; case 4: asm("cmpxchgl %2, ""%%""gs"":" "%" "1" : "=a" (pco_ret__), "+m" (__preempt_count) : "r" (pco_new__), "0" (pco_old__) : "memory"); break; case 8: asm("cmpxchgq %2, ""%%""gs"":" "%" "1" : "=a" (pco_ret__), "+m" (__preempt_count) : "r" (pco_new__), "0" (pco_old__) : "memory"); break; default: __bad_percpu_size(); } pco_ret__; }) != old);
}
# 54 "./arch/x86/include/asm/preempt.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void set_preempt_need_resched(void)
{
 do { typedef typeof((__preempt_count)) pto_T__; if (0) { pto_T__ pto_tmp__; pto_tmp__ = (~0x80000000); (void)pto_tmp__; } switch (sizeof((__preempt_count))) { case 1: asm("and" "b %1,""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "qi" ((pto_T__)(~0x80000000))); break; case 2: asm("and" "w %1,""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "ri" ((pto_T__)(~0x80000000))); break; case 4: asm("and" "l %1,""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "ri" ((pto_T__)(~0x80000000))); break; case 8: asm("and" "q %1,""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "re" ((pto_T__)(~0x80000000))); break; default: __bad_percpu_size(); } } while (0);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void clear_preempt_need_resched(void)
{
 do { typedef typeof((__preempt_count)) pto_T__; if (0) { pto_T__ pto_tmp__; pto_tmp__ = (0x80000000); (void)pto_tmp__; } switch (sizeof((__preempt_count))) { case 1: asm("or" "b %1,""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "qi" ((pto_T__)(0x80000000))); break; case 2: asm("or" "w %1,""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "ri" ((pto_T__)(0x80000000))); break; case 4: asm("or" "l %1,""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "ri" ((pto_T__)(0x80000000))); break; case 8: asm("or" "q %1,""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "re" ((pto_T__)(0x80000000))); break; default: __bad_percpu_size(); } } while (0);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool test_preempt_need_resched(void)
{
 return !(({ typeof(__preempt_count) pfo_ret__; switch (sizeof(__preempt_count)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (__preempt_count)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; default: __bad_percpu_size(); } pfo_ret__; }) & 0x80000000);
}





static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __preempt_count_add(int val)
{
 do { typedef typeof((__preempt_count)) pao_T__; const int pao_ID__ = (__builtin_constant_p(val) && ((val) == 1 || (val) == -1)) ? (int)(val) : 0; if (0) { pao_T__ pao_tmp__; pao_tmp__ = (val); (void)pao_tmp__; } switch (sizeof((__preempt_count))) { case 1: if (pao_ID__ == 1) asm("incb ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else if (pao_ID__ == -1) asm("decb ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else asm("addb %1, ""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "qi" ((pao_T__)(val))); break; case 2: if (pao_ID__ == 1) asm("incw ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else if (pao_ID__ == -1) asm("decw ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else asm("addw %1, ""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "ri" ((pao_T__)(val))); break; case 4: if (pao_ID__ == 1) asm("incl ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else if (pao_ID__ == -1) asm("decl ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else asm("addl %1, ""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "ri" ((pao_T__)(val))); break; case 8: if (pao_ID__ == 1) asm("incq ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else if (pao_ID__ == -1) asm("decq ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else asm("addq %1, ""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "re" ((pao_T__)(val))); break; default: __bad_percpu_size(); } } while (0);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __preempt_count_sub(int val)
{
 do { typedef typeof((__preempt_count)) pao_T__; const int pao_ID__ = (__builtin_constant_p(-val) && ((-val) == 1 || (-val) == -1)) ? (int)(-val) : 0; if (0) { pao_T__ pao_tmp__; pao_tmp__ = (-val); (void)pao_tmp__; } switch (sizeof((__preempt_count))) { case 1: if (pao_ID__ == 1) asm("incb ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else if (pao_ID__ == -1) asm("decb ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else asm("addb %1, ""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "qi" ((pao_T__)(-val))); break; case 2: if (pao_ID__ == 1) asm("incw ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else if (pao_ID__ == -1) asm("decw ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else asm("addw %1, ""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "ri" ((pao_T__)(-val))); break; case 4: if (pao_ID__ == 1) asm("incl ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else if (pao_ID__ == -1) asm("decl ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else asm("addl %1, ""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "ri" ((pao_T__)(-val))); break; case 8: if (pao_ID__ == 1) asm("incq ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else if (pao_ID__ == -1) asm("decq ""%%""gs"":" "%" "0" : "+m" ((__preempt_count))); else asm("addq %1, ""%%""gs"":" "%" "0" : "+m" ((__preempt_count)) : "re" ((pao_T__)(-val))); break; default: __bad_percpu_size(); } } while (0);
}






static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool __preempt_count_dec_and_test(void)
{
 do { bool c; asm volatile ("decl" " " "%%""gs"":" "%" "0" ";" "\n\tset" "e" " %[_cc_" "e" "]\n" : "+m" (__preempt_count), [_cc_e] "=qm" (c) : : "memory"); return c; } while (0);
}




static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool should_resched(int preempt_offset)
{
 return __builtin_expect(!!(({ typeof(__preempt_count) pfo_ret__; switch (sizeof(__preempt_count)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (__preempt_count)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (__preempt_count)); break; default: __bad_percpu_size(); } pfo_ret__; }) == preempt_offset), 0);
}
# 81 "./include/linux/preempt.h" 2
# 51 "./include/linux/spinlock.h" 2






# 1 "./include/linux/bottom_half.h" 1








static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
{
 __preempt_count_add(cnt);
 __asm__ __volatile__("": : :"memory");
}


static inline __attribute__((no_instrument_function)) void local_bh_disable(void)
{
 __local_bh_disable_ip(({ __label__ __here; __here: (unsigned long)&&__here; }), (2 * (1UL << (0 + 8))));
}

extern void _local_bh_enable(void);
extern void __local_bh_enable_ip(unsigned long ip, unsigned int cnt);

static inline __attribute__((no_instrument_function)) void local_bh_enable_ip(unsigned long ip)
{
 __local_bh_enable_ip(ip, (2 * (1UL << (0 + 8))));
}

static inline __attribute__((no_instrument_function)) void local_bh_enable(void)
{
 __local_bh_enable_ip(({ __label__ __here; __here: (unsigned long)&&__here; }), (2 * (1UL << (0 + 8))));
}
# 58 "./include/linux/spinlock.h" 2
# 81 "./include/linux/spinlock.h"
# 1 "./include/linux/spinlock_types.h" 1
# 13 "./include/linux/spinlock_types.h"
# 1 "./arch/x86/include/asm/spinlock_types.h" 1
# 15 "./arch/x86/include/asm/spinlock_types.h"
typedef u8 __ticket_t;
typedef u16 __ticketpair_t;
# 26 "./arch/x86/include/asm/spinlock_types.h"
# 1 "./include/asm-generic/qspinlock_types.h" 1
# 31 "./include/asm-generic/qspinlock_types.h"
typedef struct qspinlock {
 atomic_t val;
} arch_spinlock_t;
# 27 "./arch/x86/include/asm/spinlock_types.h" 2

# 1 "./include/asm-generic/qrwlock_types.h" 1




# 1 "./arch/x86/include/asm/spinlock_types.h" 1
# 6 "./include/asm-generic/qrwlock_types.h" 2





typedef struct qrwlock {
 atomic_t cnts;
 arch_spinlock_t wait_lock;
} arch_rwlock_t;
# 29 "./arch/x86/include/asm/spinlock_types.h" 2
# 14 "./include/linux/spinlock_types.h" 2




# 1 "./include/linux/lockdep.h" 1
# 12 "./include/linux/lockdep.h"
struct task_struct;
struct lockdep_map;


extern int prove_locking;
extern int lock_stat;
# 404 "./include/linux/lockdep.h"
static inline __attribute__((no_instrument_function)) void lockdep_off(void)
{
}

static inline __attribute__((no_instrument_function)) void lockdep_on(void)
{
}
# 444 "./include/linux/lockdep.h"
struct lock_class_key { };
# 457 "./include/linux/lockdep.h"
struct pin_cookie { };
# 526 "./include/linux/lockdep.h"
static inline __attribute__((no_instrument_function)) void print_irqtrace_events(struct task_struct *curr)
{
}
# 594 "./include/linux/lockdep.h"
static inline __attribute__((no_instrument_function)) void
lockdep_rcu_suspicious(const char *file, const int line, const char *s)
{
}
# 19 "./include/linux/spinlock_types.h" 2

typedef struct raw_spinlock {
 arch_spinlock_t raw_lock;
# 32 "./include/linux/spinlock_types.h"
} raw_spinlock_t;
# 64 "./include/linux/spinlock_types.h"
typedef struct spinlock {
 union {
  struct raw_spinlock rlock;
# 75 "./include/linux/spinlock_types.h"
 };
} spinlock_t;
# 86 "./include/linux/spinlock_types.h"
# 1 "./include/linux/rwlock_types.h" 1
# 11 "./include/linux/rwlock_types.h"
typedef struct {
 arch_rwlock_t raw_lock;
# 23 "./include/linux/rwlock_types.h"
} rwlock_t;
# 87 "./include/linux/spinlock_types.h" 2
# 82 "./include/linux/spinlock.h" 2





# 1 "./arch/x86/include/asm/spinlock.h" 1








# 1 "./arch/x86/include/asm/paravirt.h" 1
# 942 "./arch/x86/include/asm/paravirt.h"
static inline __attribute__((no_instrument_function)) void paravirt_arch_dup_mmap(struct mm_struct *oldmm,
       struct mm_struct *mm)
{
}

static inline __attribute__((no_instrument_function)) void paravirt_arch_exit_mmap(struct mm_struct *mm)
{
}
# 10 "./arch/x86/include/asm/spinlock.h" 2
# 26 "./arch/x86/include/asm/spinlock.h"
# 1 "./arch/x86/include/asm/qspinlock.h" 1
# 15 "./arch/x86/include/asm/qspinlock.h"
static inline __attribute__((no_instrument_function)) void native_queued_spin_unlock(struct qspinlock *lock)
{
 do { do { bool __cond = !((sizeof(*(u8 *)lock) == sizeof(char) || sizeof(*(u8 *)lock) == sizeof(short) || sizeof(*(u8 *)lock) == sizeof(int) || sizeof(*(u8 *)lock) == sizeof(long))); extern void __compiletime_assert_17(void) ; if (__cond) __compiletime_assert_17(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); ({ union { typeof(*(u8 *)lock) __val; char __c[1]; } __u = { .__val = ( typeof(*(u8 *)lock)) (0) }; __write_once_size(&(*(u8 *)lock), __u.__c, sizeof(*(u8 *)lock)); __u.__val; }); } while (0);
}
# 42 "./arch/x86/include/asm/qspinlock.h"
static inline __attribute__((no_instrument_function)) void queued_spin_unlock(struct qspinlock *lock)
{
 native_queued_spin_unlock(lock);
}
# 70 "./arch/x86/include/asm/qspinlock.h"
# 1 "./include/asm-generic/qspinlock.h" 1
# 32 "./include/asm-generic/qspinlock.h"
extern void queued_spin_unlock_wait(struct qspinlock *lock);
# 41 "./include/asm-generic/qspinlock.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int queued_spin_is_locked(struct qspinlock *lock)
{






 return atomic_read(&lock->val);
}
# 63 "./include/asm-generic/qspinlock.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int queued_spin_value_unlocked(struct qspinlock lock)
{
 return !atomic_read(&lock.val);
}






static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int queued_spin_is_contended(struct qspinlock *lock)
{
 return atomic_read(&lock->val) & ~(((1U << 8) - 1) << 0);
}





static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int queued_spin_trylock(struct qspinlock *lock)
{
 if (!atomic_read(&lock->val) &&
    (atomic_cmpxchg(&lock->val, 0, (1U << 0)) == 0))
  return 1;
 return 0;
}

extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);





static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void queued_spin_lock(struct qspinlock *lock)
{
 u32 val;

 val = atomic_cmpxchg(&lock->val, 0, (1U << 0));
 if (__builtin_expect(!!(val == 0), 1))
  return;
 queued_spin_lock_slowpath(lock, val);
}
# 121 "./include/asm-generic/qspinlock.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) bool virt_spin_lock(struct qspinlock *lock)
{
 return false;
}
# 71 "./arch/x86/include/asm/qspinlock.h" 2
# 27 "./arch/x86/include/asm/spinlock.h" 2
# 42 "./arch/x86/include/asm/spinlock.h"
# 1 "./arch/x86/include/asm/qrwlock.h" 1




# 1 "./include/asm-generic/qrwlock.h" 1
# 52 "./include/asm-generic/qrwlock.h"
extern void queued_read_lock_slowpath(struct qrwlock *lock, u32 cnts);
extern void queued_write_lock_slowpath(struct qrwlock *lock);





static inline __attribute__((no_instrument_function)) int queued_read_can_lock(struct qrwlock *lock)
{
 return !(atomic_read(&lock->cnts) & 0xff);
}





static inline __attribute__((no_instrument_function)) int queued_write_can_lock(struct qrwlock *lock)
{
 return !atomic_read(&lock->cnts);
}






static inline __attribute__((no_instrument_function)) int queued_read_trylock(struct qrwlock *lock)
{
 u32 cnts;

 cnts = atomic_read(&lock->cnts);
 if (__builtin_expect(!!(!(cnts & 0xff)), 1)) {
  cnts = (u32)atomic_add_return((1U << 8), &lock->cnts);
  if (__builtin_expect(!!(!(cnts & 0xff)), 1))
   return 1;
  atomic_sub((1U << 8), &lock->cnts);
 }
 return 0;
}






static inline __attribute__((no_instrument_function)) int queued_write_trylock(struct qrwlock *lock)
{
 u32 cnts;

 cnts = atomic_read(&lock->cnts);
 if (__builtin_expect(!!(cnts), 0))
  return 0;

 return __builtin_expect(!!(atomic_cmpxchg(&lock->cnts, cnts, cnts | 0xff) == cnts), 1);

}




static inline __attribute__((no_instrument_function)) void queued_read_lock(struct qrwlock *lock)
{
 u32 cnts;

 cnts = atomic_add_return((1U << 8), &lock->cnts);
 if (__builtin_expect(!!(!(cnts & 0xff)), 1))
  return;


 queued_read_lock_slowpath(lock, cnts);
}





static inline __attribute__((no_instrument_function)) void queued_write_lock(struct qrwlock *lock)
{

 if (atomic_cmpxchg(&lock->cnts, 0, 0xff) == 0)
  return;

 queued_write_lock_slowpath(lock);
}





static inline __attribute__((no_instrument_function)) void queued_read_unlock(struct qrwlock *lock)
{



 (void)atomic_sub_return((1U << 8), &lock->cnts);
}






static inline __attribute__((no_instrument_function)) u8 *__qrwlock_write_byte(struct qrwlock *lock)
{
 return (u8 *)lock + 3 * 0;
}





static inline __attribute__((no_instrument_function)) void queued_write_unlock(struct qrwlock *lock)
{
 do { do { bool __cond = !((sizeof(*__qrwlock_write_byte(lock)) == sizeof(char) || sizeof(*__qrwlock_write_byte(lock)) == sizeof(short) || sizeof(*__qrwlock_write_byte(lock)) == sizeof(int) || sizeof(*__qrwlock_write_byte(lock)) == sizeof(long))); extern void __compiletime_assert_165(void) ; if (__cond) __compiletime_assert_165(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); ({ union { typeof(*__qrwlock_write_byte(lock)) __val; char __c[1]; } __u = { .__val = ( typeof(*__qrwlock_write_byte(lock))) (0) }; __write_once_size(&(*__qrwlock_write_byte(lock)), __u.__c, sizeof(*__qrwlock_write_byte(lock))); __u.__val; }); } while (0);
}
# 6 "./arch/x86/include/asm/qrwlock.h" 2
# 43 "./arch/x86/include/asm/spinlock.h" 2
# 88 "./include/linux/spinlock.h" 2
# 145 "./include/linux/spinlock.h"
static inline __attribute__((no_instrument_function)) void do_raw_spin_lock(raw_spinlock_t *lock)
{
 (void)0;
 queued_spin_lock(&lock->raw_lock);
}

static inline __attribute__((no_instrument_function)) void
do_raw_spin_lock_flags(raw_spinlock_t *lock, unsigned long *flags)
{
 (void)0;
 queued_spin_lock(&lock->raw_lock);
}

static inline __attribute__((no_instrument_function)) int do_raw_spin_trylock(raw_spinlock_t *lock)
{
 return queued_spin_trylock(&(lock)->raw_lock);
}

static inline __attribute__((no_instrument_function)) void do_raw_spin_unlock(raw_spinlock_t *lock)
{
 queued_spin_unlock(&lock->raw_lock);
 (void)0;
}
# 271 "./include/linux/spinlock.h"
# 1 "./include/linux/rwlock.h" 1
# 272 "./include/linux/spinlock.h" 2





# 1 "./include/linux/spinlock_api_smp.h" 1
# 18 "./include/linux/spinlock_api_smp.h"
int in_lock_functions(unsigned long addr);



void __attribute__((section(".spinlock.text"))) _raw_spin_lock(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_nested(raw_spinlock_t *lock, int subclass)
                        ;
void __attribute__((section(".spinlock.text")))
_raw_spin_lock_nest_lock(raw_spinlock_t *lock, struct lockdep_map *map)
                        ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_bh(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_irq(raw_spinlock_t *lock)
                        ;

unsigned long __attribute__((section(".spinlock.text"))) _raw_spin_lock_irqsave(raw_spinlock_t *lock)
                        ;
unsigned long __attribute__((section(".spinlock.text")))
_raw_spin_lock_irqsave_nested(raw_spinlock_t *lock, int subclass)
                        ;
int __attribute__((section(".spinlock.text"))) _raw_spin_trylock(raw_spinlock_t *lock);
int __attribute__((section(".spinlock.text"))) _raw_spin_trylock_bh(raw_spinlock_t *lock);
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock_bh(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock_irq(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text")))
_raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
                        ;
# 86 "./include/linux/spinlock_api_smp.h"
static inline __attribute__((no_instrument_function)) int __raw_spin_trylock(raw_spinlock_t *lock)
{
 __asm__ __volatile__("": : :"memory");
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 __asm__ __volatile__("": : :"memory");
 return 0;
}
# 104 "./include/linux/spinlock_api_smp.h"
static inline __attribute__((no_instrument_function)) unsigned long __raw_spin_lock_irqsave(raw_spinlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
# 119 "./include/linux/spinlock_api_smp.h"
 do_raw_spin_lock_flags(lock, &flags);

 return flags;
}

static inline __attribute__((no_instrument_function)) void __raw_spin_lock_irq(raw_spinlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 do_raw_spin_lock(lock);
}

static inline __attribute__((no_instrument_function)) void __raw_spin_lock_bh(raw_spinlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + 0));
 do { } while (0);
 do_raw_spin_lock(lock);
}

static inline __attribute__((no_instrument_function)) void __raw_spin_lock(raw_spinlock_t *lock)
{
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 do_raw_spin_lock(lock);
}



static inline __attribute__((no_instrument_function)) void __raw_spin_unlock(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __raw_spin_unlock_irqrestore(raw_spinlock_t *lock,
         unsigned long flags)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __raw_spin_unlock_irq(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { arch_local_irq_enable(); } while (0);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __raw_spin_unlock_bh(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 __local_bh_enable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + 0));
}

static inline __attribute__((no_instrument_function)) int __raw_spin_trylock_bh(raw_spinlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + 0));
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 __local_bh_enable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + 0));
 return 0;
}


# 1 "./include/linux/rwlock_api_smp.h" 1
# 18 "./include/linux/rwlock_api_smp.h"
void __attribute__((section(".spinlock.text"))) _raw_read_lock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_lock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_lock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock_irq(rwlock_t *lock) ;
unsigned long __attribute__((section(".spinlock.text"))) _raw_read_lock_irqsave(rwlock_t *lock)
                       ;
unsigned long __attribute__((section(".spinlock.text"))) _raw_write_lock_irqsave(rwlock_t *lock)
                       ;
int __attribute__((section(".spinlock.text"))) _raw_read_trylock(rwlock_t *lock);
int __attribute__((section(".spinlock.text"))) _raw_write_trylock(rwlock_t *lock);
void __attribute__((section(".spinlock.text"))) _raw_read_unlock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_unlock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_unlock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text")))
_raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
                       ;
void __attribute__((section(".spinlock.text")))
_raw_write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
                       ;
# 117 "./include/linux/rwlock_api_smp.h"
static inline __attribute__((no_instrument_function)) int __raw_read_trylock(rwlock_t *lock)
{
 __asm__ __volatile__("": : :"memory");
 if (queued_read_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 __asm__ __volatile__("": : :"memory");
 return 0;
}

static inline __attribute__((no_instrument_function)) int __raw_write_trylock(rwlock_t *lock)
{
 __asm__ __volatile__("": : :"memory");
 if (queued_write_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 __asm__ __volatile__("": : :"memory");
 return 0;
}
# 146 "./include/linux/rwlock_api_smp.h"
static inline __attribute__((no_instrument_function)) void __raw_read_lock(rwlock_t *lock)
{
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 do {(void)0; queued_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((no_instrument_function)) unsigned long __raw_read_lock_irqsave(rwlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 do {(void)0; queued_read_lock(&((lock))->raw_lock); } while (0);

 return flags;
}

static inline __attribute__((no_instrument_function)) void __raw_read_lock_irq(rwlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 do {(void)0; queued_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((no_instrument_function)) void __raw_read_lock_bh(rwlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + 0));
 do { } while (0);
 do {(void)0; queued_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((no_instrument_function)) unsigned long __raw_write_lock_irqsave(rwlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 do {(void)0; queued_write_lock(&((lock))->raw_lock); } while (0);

 return flags;
}

static inline __attribute__((no_instrument_function)) void __raw_write_lock_irq(rwlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 do {(void)0; queued_write_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((no_instrument_function)) void __raw_write_lock_bh(rwlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + 0));
 do { } while (0);
 do {(void)0; queued_write_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((no_instrument_function)) void __raw_write_lock(rwlock_t *lock)
{
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 do {(void)0; queued_write_lock(&(lock)->raw_lock); } while (0);
}



static inline __attribute__((no_instrument_function)) void __raw_write_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {queued_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __raw_read_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {queued_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void
__raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
{
 do { } while (0);
 do {queued_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __raw_read_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {queued_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { arch_local_irq_enable(); } while (0);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __raw_read_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {queued_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 __local_bh_enable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + 0));
}

static inline __attribute__((no_instrument_function)) void __raw_write_unlock_irqrestore(rwlock_t *lock,
          unsigned long flags)
{
 do { } while (0);
 do {queued_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __raw_write_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {queued_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { arch_local_irq_enable(); } while (0);
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __raw_write_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {queued_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 __local_bh_enable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + 0));
}
# 191 "./include/linux/spinlock_api_smp.h" 2
# 278 "./include/linux/spinlock.h" 2








static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) raw_spinlock_t *spinlock_check(spinlock_t *lock)
{
 return &lock->rlock;
}







static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_lock(spinlock_t *lock)
{
 _raw_spin_lock(&lock->rlock);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_lock_bh(spinlock_t *lock)
{
 _raw_spin_lock_bh(&lock->rlock);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_trylock(spinlock_t *lock)
{
 return (_raw_spin_trylock(&lock->rlock));
}
# 322 "./include/linux/spinlock.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_lock_irq(spinlock_t *lock)
{
 _raw_spin_lock_irq(&lock->rlock);
}
# 337 "./include/linux/spinlock.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock(spinlock_t *lock)
{
 __raw_spin_unlock(&lock->rlock);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock_bh(spinlock_t *lock)
{
 _raw_spin_unlock_bh(&lock->rlock);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock_irq(spinlock_t *lock)
{
 __raw_spin_unlock_irq(&lock->rlock);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
{
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); _raw_spin_unlock_irqrestore(&lock->rlock, flags); } while (0);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_trylock_bh(spinlock_t *lock)
{
 return (_raw_spin_trylock_bh(&lock->rlock));
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_trylock_irq(spinlock_t *lock)
{
 return ({ do { arch_local_irq_disable(); } while (0); (_raw_spin_trylock(&lock->rlock)) ? 1 : ({ do { arch_local_irq_enable(); } while (0); 0; }); });
}






static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock_wait(spinlock_t *lock)
{
 queued_spin_unlock_wait(&(&lock->rlock)->raw_lock);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_is_locked(spinlock_t *lock)
{
 return queued_spin_is_locked(&(&lock->rlock)->raw_lock);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_is_contended(spinlock_t *lock)
{
 return queued_spin_is_contended(&(&lock->rlock)->raw_lock);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_can_lock(spinlock_t *lock)
{
 return (!queued_spin_is_locked(&(&lock->rlock)->raw_lock));
}
# 407 "./include/linux/spinlock.h"
extern int _atomic_dec_and_lock(atomic_t *atomic, spinlock_t *lock);
# 36 "./include/linux/seqlock.h" 2
# 47 "./include/linux/seqlock.h"
typedef struct seqcount {
 unsigned sequence;



} seqcount_t;

static inline __attribute__((no_instrument_function)) void __seqcount_init(seqcount_t *s, const char *name,
       struct lock_class_key *key)
{



 do { (void)(name); (void)(key); } while (0);
 s->sequence = 0;
}
# 107 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) unsigned __read_seqcount_begin(const seqcount_t *s)
{
 unsigned ret;

repeat:
 ret = ({ union { typeof(s->sequence) __val; char __c[1]; } __u; if (1) __read_once_size(&(s->sequence), __u.__c, sizeof(s->sequence)); else __read_once_size_nocheck(&(s->sequence), __u.__c, sizeof(s->sequence)); __u.__val; });
 if (__builtin_expect(!!(ret & 1), 0)) {
  cpu_relax();
  goto repeat;
 }
 return ret;
}
# 129 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) unsigned raw_read_seqcount(const seqcount_t *s)
{
 unsigned ret = ({ union { typeof(s->sequence) __val; char __c[1]; } __u; if (1) __read_once_size(&(s->sequence), __u.__c, sizeof(s->sequence)); else __read_once_size_nocheck(&(s->sequence), __u.__c, sizeof(s->sequence)); __u.__val; });
 __asm__ __volatile__("": : :"memory");
 return ret;
}
# 145 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) unsigned raw_read_seqcount_begin(const seqcount_t *s)
{
 unsigned ret = __read_seqcount_begin(s);
 __asm__ __volatile__("": : :"memory");
 return ret;
}
# 161 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) unsigned read_seqcount_begin(const seqcount_t *s)
{
                                  ;
 return raw_read_seqcount_begin(s);
}
# 181 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) unsigned raw_seqcount_begin(const seqcount_t *s)
{
 unsigned ret = ({ union { typeof(s->sequence) __val; char __c[1]; } __u; if (1) __read_once_size(&(s->sequence), __u.__c, sizeof(s->sequence)); else __read_once_size_nocheck(&(s->sequence), __u.__c, sizeof(s->sequence)); __u.__val; });
 __asm__ __volatile__("": : :"memory");
 return ret & ~1;
}
# 202 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) int __read_seqcount_retry(const seqcount_t *s, unsigned start)
{
 return __builtin_expect(!!(s->sequence != start), 0);
}
# 217 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) int read_seqcount_retry(const seqcount_t *s, unsigned start)
{
 __asm__ __volatile__("": : :"memory");
 return __read_seqcount_retry(s, start);
}



static inline __attribute__((no_instrument_function)) void raw_write_seqcount_begin(seqcount_t *s)
{
 s->sequence++;
 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void raw_write_seqcount_end(seqcount_t *s)
{
 __asm__ __volatile__("": : :"memory");
 s->sequence++;
}
# 271 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) void raw_write_seqcount_barrier(seqcount_t *s)
{
 s->sequence++;
 __asm__ __volatile__("": : :"memory");
 s->sequence++;
}

static inline __attribute__((no_instrument_function)) int raw_read_seqcount_latch(seqcount_t *s)
{
 int seq = ({ union { typeof(s->sequence) __val; char __c[1]; } __u; if (1) __read_once_size(&(s->sequence), __u.__c, sizeof(s->sequence)); else __read_once_size_nocheck(&(s->sequence), __u.__c, sizeof(s->sequence)); __u.__val; });

 do { } while (0);
 return seq;
}
# 363 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) void raw_write_seqcount_latch(seqcount_t *s)
{
       __asm__ __volatile__("": : :"memory");
       s->sequence++;
       __asm__ __volatile__("": : :"memory");
}





static inline __attribute__((no_instrument_function)) void write_seqcount_begin_nested(seqcount_t *s, int subclass)
{
 raw_write_seqcount_begin(s);
 do { } while (0);
}

static inline __attribute__((no_instrument_function)) void write_seqcount_begin(seqcount_t *s)
{
 write_seqcount_begin_nested(s, 0);
}

static inline __attribute__((no_instrument_function)) void write_seqcount_end(seqcount_t *s)
{
 do { } while (0);
 raw_write_seqcount_end(s);
}
# 398 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) void write_seqcount_invalidate(seqcount_t *s)
{
 __asm__ __volatile__("": : :"memory");
 s->sequence+=2;
}

typedef struct {
 struct seqcount seqcount;
 spinlock_t lock;
} seqlock_t;
# 431 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) unsigned read_seqbegin(const seqlock_t *sl)
{
 return read_seqcount_begin(&sl->seqcount);
}

static inline __attribute__((no_instrument_function)) unsigned read_seqretry(const seqlock_t *sl, unsigned start)
{
 return read_seqcount_retry(&sl->seqcount, start);
}






static inline __attribute__((no_instrument_function)) void write_seqlock(seqlock_t *sl)
{
 spin_lock(&sl->lock);
 write_seqcount_begin(&sl->seqcount);
}

static inline __attribute__((no_instrument_function)) void write_sequnlock(seqlock_t *sl)
{
 write_seqcount_end(&sl->seqcount);
 spin_unlock(&sl->lock);
}

static inline __attribute__((no_instrument_function)) void write_seqlock_bh(seqlock_t *sl)
{
 spin_lock_bh(&sl->lock);
 write_seqcount_begin(&sl->seqcount);
}

static inline __attribute__((no_instrument_function)) void write_sequnlock_bh(seqlock_t *sl)
{
 write_seqcount_end(&sl->seqcount);
 spin_unlock_bh(&sl->lock);
}

static inline __attribute__((no_instrument_function)) void write_seqlock_irq(seqlock_t *sl)
{
 spin_lock_irq(&sl->lock);
 write_seqcount_begin(&sl->seqcount);
}

static inline __attribute__((no_instrument_function)) void write_sequnlock_irq(seqlock_t *sl)
{
 write_seqcount_end(&sl->seqcount);
 spin_unlock_irq(&sl->lock);
}

static inline __attribute__((no_instrument_function)) unsigned long __write_seqlock_irqsave(seqlock_t *sl)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&sl->lock)); } while (0); } while (0);
 write_seqcount_begin(&sl->seqcount);
 return flags;
}




static inline __attribute__((no_instrument_function)) void
write_sequnlock_irqrestore(seqlock_t *sl, unsigned long flags)
{
 write_seqcount_end(&sl->seqcount);
 spin_unlock_irqrestore(&sl->lock, flags);
}






static inline __attribute__((no_instrument_function)) void read_seqlock_excl(seqlock_t *sl)
{
 spin_lock(&sl->lock);
}

static inline __attribute__((no_instrument_function)) void read_sequnlock_excl(seqlock_t *sl)
{
 spin_unlock(&sl->lock);
}
# 526 "./include/linux/seqlock.h"
static inline __attribute__((no_instrument_function)) void read_seqbegin_or_lock(seqlock_t *lock, int *seq)
{
 if (!(*seq & 1))
  *seq = read_seqbegin(lock);
 else
  read_seqlock_excl(lock);
}

static inline __attribute__((no_instrument_function)) int need_seqretry(seqlock_t *lock, int seq)
{
 return !(seq & 1) && read_seqretry(lock, seq);
}

static inline __attribute__((no_instrument_function)) void done_seqretry(seqlock_t *lock, int seq)
{
 if (seq & 1)
  read_sequnlock_excl(lock);
}

static inline __attribute__((no_instrument_function)) void read_seqlock_excl_bh(seqlock_t *sl)
{
 spin_lock_bh(&sl->lock);
}

static inline __attribute__((no_instrument_function)) void read_sequnlock_excl_bh(seqlock_t *sl)
{
 spin_unlock_bh(&sl->lock);
}

static inline __attribute__((no_instrument_function)) void read_seqlock_excl_irq(seqlock_t *sl)
{
 spin_lock_irq(&sl->lock);
}

static inline __attribute__((no_instrument_function)) void read_sequnlock_excl_irq(seqlock_t *sl)
{
 spin_unlock_irq(&sl->lock);
}

static inline __attribute__((no_instrument_function)) unsigned long __read_seqlock_excl_irqsave(seqlock_t *sl)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&sl->lock)); } while (0); } while (0);
 return flags;
}




static inline __attribute__((no_instrument_function)) void
read_sequnlock_excl_irqrestore(seqlock_t *sl, unsigned long flags)
{
 spin_unlock_irqrestore(&sl->lock, flags);
}

static inline __attribute__((no_instrument_function)) unsigned long
read_seqbegin_or_lock_irqsave(seqlock_t *lock, int *seq)
{
 unsigned long flags = 0;

 if (!(*seq & 1))
  *seq = read_seqbegin(lock);
 else
  do { flags = __read_seqlock_excl_irqsave(lock); } while (0);

 return flags;
}

static inline __attribute__((no_instrument_function)) void
done_seqretry_irqrestore(seqlock_t *lock, int seq, unsigned long flags)
{
 if (seq & 1)
  read_sequnlock_excl_irqrestore(lock, flags);
}
# 6 "./include/linux/time.h" 2

# 1 "./include/linux/time64.h" 1



# 1 "./include/uapi/linux/time.h" 1








struct timespec {
 __kernel_time_t tv_sec;
 long tv_nsec;
};


struct timeval {
 __kernel_time_t tv_sec;
 __kernel_suseconds_t tv_usec;
};

struct timezone {
 int tz_minuteswest;
 int tz_dsttime;
};
# 34 "./include/uapi/linux/time.h"
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};

struct itimerval {
 struct timeval it_interval;
 struct timeval it_value;
};
# 5 "./include/linux/time64.h" 2


typedef __s64 time64_t;
typedef __u64 timeu64_t;
# 46 "./include/linux/time64.h"
static inline __attribute__((no_instrument_function)) struct timespec timespec64_to_timespec(const struct timespec ts64)
{
 return ts64;
}

static inline __attribute__((no_instrument_function)) struct timespec timespec_to_timespec64(const struct timespec ts)
{
 return ts;
}

static inline __attribute__((no_instrument_function)) struct itimerspec itimerspec64_to_itimerspec(struct itimerspec *its64)
{
 return *its64;
}

static inline __attribute__((no_instrument_function)) struct itimerspec itimerspec_to_itimerspec64(struct itimerspec *its)
{
 return *its;
}
# 222 "./include/linux/time64.h"
extern struct timespec timespec64_add_safe(const struct timespec lhs,
      const struct timespec rhs);
# 8 "./include/linux/time.h" 2

extern struct timezone sys_tz;



static inline __attribute__((no_instrument_function)) int timespec_equal(const struct timespec *a,
                                 const struct timespec *b)
{
 return (a->tv_sec == b->tv_sec) && (a->tv_nsec == b->tv_nsec);
}






static inline __attribute__((no_instrument_function)) int timespec_compare(const struct timespec *lhs, const struct timespec *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_nsec - rhs->tv_nsec;
}

static inline __attribute__((no_instrument_function)) int timeval_compare(const struct timeval *lhs, const struct timeval *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_usec - rhs->tv_usec;
}

extern time64_t mktime64(const unsigned int year, const unsigned int mon,
   const unsigned int day, const unsigned int hour,
   const unsigned int min, const unsigned int sec);




static inline __attribute__((no_instrument_function)) unsigned long mktime(const unsigned int year,
   const unsigned int mon, const unsigned int day,
   const unsigned int hour, const unsigned int min,
   const unsigned int sec)
{
 return mktime64(year, mon, day, hour, min, sec);
}

extern void set_normalized_timespec(struct timespec *ts, time_t sec, s64 nsec);






extern struct timespec timespec_add_safe(const struct timespec lhs,
      const struct timespec rhs);


static inline __attribute__((no_instrument_function)) struct timespec timespec_add(struct timespec lhs,
      struct timespec rhs)
{
 struct timespec ts_delta;
 set_normalized_timespec(&ts_delta, lhs.tv_sec + rhs.tv_sec,
    lhs.tv_nsec + rhs.tv_nsec);
 return ts_delta;
}




static inline __attribute__((no_instrument_function)) struct timespec timespec_sub(struct timespec lhs,
      struct timespec rhs)
{
 struct timespec ts_delta;
 set_normalized_timespec(&ts_delta, lhs.tv_sec - rhs.tv_sec,
    lhs.tv_nsec - rhs.tv_nsec);
 return ts_delta;
}




static inline __attribute__((no_instrument_function)) bool timespec_valid(const struct timespec *ts)
{

 if (ts->tv_sec < 0)
  return false;

 if ((unsigned long)ts->tv_nsec >= 1000000000L)
  return false;
 return true;
}

static inline __attribute__((no_instrument_function)) bool timespec_valid_strict(const struct timespec *ts)
{
 if (!timespec_valid(ts))
  return false;

 if ((unsigned long long)ts->tv_sec >= (((s64)~((u64)1 << 63)) / 1000000000L))
  return false;
 return true;
}

static inline __attribute__((no_instrument_function)) bool timeval_valid(const struct timeval *tv)
{

 if (tv->tv_sec < 0)
  return false;


 if (tv->tv_usec < 0 || tv->tv_usec >= 1000000L)
  return false;

 return true;
}

extern struct timespec timespec_trunc(struct timespec t, unsigned gran);







static inline __attribute__((no_instrument_function)) bool timeval_inject_offset_valid(const struct timeval *tv)
{



 if (tv->tv_usec < 0 || tv->tv_usec >= 1000000L)
  return false;
 return true;
}

static inline __attribute__((no_instrument_function)) bool timespec_inject_offset_valid(const struct timespec *ts)
{



 if (ts->tv_nsec < 0 || ts->tv_nsec >= 1000000000L)
  return false;
 return true;
}
# 170 "./include/linux/time.h"
struct itimerval;
extern int do_setitimer(int which, struct itimerval *value,
   struct itimerval *ovalue);
extern int do_getitimer(int which, struct itimerval *value);

extern long do_utimes(int dfd, const char *filename, struct timespec *times, int flags);

struct tms;
extern void do_sys_times(struct tms *);





struct tm {




 int tm_sec;

 int tm_min;

 int tm_hour;

 int tm_mday;

 int tm_mon;

 long tm_year;

 int tm_wday;

 int tm_yday;
};

void time64_to_tm(time64_t totalsecs, int offset, struct tm *result);
# 216 "./include/linux/time.h"
static inline __attribute__((no_instrument_function)) void time_to_tm(time_t totalsecs, int offset, struct tm *result)
{
 time64_to_tm(totalsecs, offset, result);
}
# 228 "./include/linux/time.h"
static inline __attribute__((no_instrument_function)) s64 timespec_to_ns(const struct timespec *ts)
{
 return ((s64) ts->tv_sec * 1000000000L) + ts->tv_nsec;
}
# 240 "./include/linux/time.h"
static inline __attribute__((no_instrument_function)) s64 timeval_to_ns(const struct timeval *tv)
{
 return ((s64) tv->tv_sec * 1000000000L) +
  tv->tv_usec * 1000L;
}







extern struct timespec ns_to_timespec(const s64 nsec);







extern struct timeval ns_to_timeval(const s64 nsec);
# 270 "./include/linux/time.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void timespec_add_ns(struct timespec *a, u64 ns)
{
 a->tv_sec += __iter_div_u64_rem(a->tv_nsec + ns, 1000000000L, &ns);
 a->tv_nsec = ns;
}
# 19 "./include/linux/stat.h" 2
# 1 "./include/linux/uidgid.h" 1
# 15 "./include/linux/uidgid.h"
# 1 "./include/linux/highuid.h" 1
# 34 "./include/linux/highuid.h"
extern int overflowuid;
extern int overflowgid;

extern void __bad_uid(void);
extern void __bad_gid(void);
# 81 "./include/linux/highuid.h"
extern int fs_overflowuid;
extern int fs_overflowgid;
# 16 "./include/linux/uidgid.h" 2

struct user_namespace;
extern struct user_namespace init_user_ns;

typedef struct {
 uid_t val;
} kuid_t;


typedef struct {
 gid_t val;
} kgid_t;





static inline __attribute__((no_instrument_function)) uid_t __kuid_val(kuid_t uid)
{
 return uid.val;
}

static inline __attribute__((no_instrument_function)) gid_t __kgid_val(kgid_t gid)
{
 return gid.val;
}
# 60 "./include/linux/uidgid.h"
static inline __attribute__((no_instrument_function)) bool uid_eq(kuid_t left, kuid_t right)
{
 return __kuid_val(left) == __kuid_val(right);
}

static inline __attribute__((no_instrument_function)) bool gid_eq(kgid_t left, kgid_t right)
{
 return __kgid_val(left) == __kgid_val(right);
}

static inline __attribute__((no_instrument_function)) bool uid_gt(kuid_t left, kuid_t right)
{
 return __kuid_val(left) > __kuid_val(right);
}

static inline __attribute__((no_instrument_function)) bool gid_gt(kgid_t left, kgid_t right)
{
 return __kgid_val(left) > __kgid_val(right);
}

static inline __attribute__((no_instrument_function)) bool uid_gte(kuid_t left, kuid_t right)
{
 return __kuid_val(left) >= __kuid_val(right);
}

static inline __attribute__((no_instrument_function)) bool gid_gte(kgid_t left, kgid_t right)
{
 return __kgid_val(left) >= __kgid_val(right);
}

static inline __attribute__((no_instrument_function)) bool uid_lt(kuid_t left, kuid_t right)
{
 return __kuid_val(left) < __kuid_val(right);
}

static inline __attribute__((no_instrument_function)) bool gid_lt(kgid_t left, kgid_t right)
{
 return __kgid_val(left) < __kgid_val(right);
}

static inline __attribute__((no_instrument_function)) bool uid_lte(kuid_t left, kuid_t right)
{
 return __kuid_val(left) <= __kuid_val(right);
}

static inline __attribute__((no_instrument_function)) bool gid_lte(kgid_t left, kgid_t right)
{
 return __kgid_val(left) <= __kgid_val(right);
}

static inline __attribute__((no_instrument_function)) bool uid_valid(kuid_t uid)
{
 return __kuid_val(uid) != (uid_t) -1;
}

static inline __attribute__((no_instrument_function)) bool gid_valid(kgid_t gid)
{
 return __kgid_val(gid) != (gid_t) -1;
}
# 142 "./include/linux/uidgid.h"
static inline __attribute__((no_instrument_function)) kuid_t make_kuid(struct user_namespace *from, uid_t uid)
{
 return (kuid_t){ uid };
}

static inline __attribute__((no_instrument_function)) kgid_t make_kgid(struct user_namespace *from, gid_t gid)
{
 return (kgid_t){ gid };
}

static inline __attribute__((no_instrument_function)) uid_t from_kuid(struct user_namespace *to, kuid_t kuid)
{
 return __kuid_val(kuid);
}

static inline __attribute__((no_instrument_function)) gid_t from_kgid(struct user_namespace *to, kgid_t kgid)
{
 return __kgid_val(kgid);
}

static inline __attribute__((no_instrument_function)) uid_t from_kuid_munged(struct user_namespace *to, kuid_t kuid)
{
 uid_t uid = from_kuid(to, kuid);
 if (uid == (uid_t)-1)
  uid = overflowuid;
 return uid;
}

static inline __attribute__((no_instrument_function)) gid_t from_kgid_munged(struct user_namespace *to, kgid_t kgid)
{
 gid_t gid = from_kgid(to, kgid);
 if (gid == (gid_t)-1)
  gid = overflowgid;
 return gid;
}

static inline __attribute__((no_instrument_function)) bool kuid_has_mapping(struct user_namespace *ns, kuid_t uid)
{
 return uid_valid(uid);
}

static inline __attribute__((no_instrument_function)) bool kgid_has_mapping(struct user_namespace *ns, kgid_t gid)
{
 return gid_valid(gid);
}
# 20 "./include/linux/stat.h" 2



struct kstat {
 u32 result_mask;
 umode_t mode;
 unsigned int nlink;
 uint32_t blksize;
 u64 attributes;







 u64 ino;
 dev_t dev;
 dev_t rdev;
 kuid_t uid;
 kgid_t gid;
 loff_t size;
 struct timespec atime;
 struct timespec mtime;
 struct timespec ctime;
 struct timespec btime;
 u64 blocks;
};
# 11 "./include/linux/module.h" 2


# 1 "./include/linux/kmod.h" 1
# 22 "./include/linux/kmod.h"
# 1 "./include/linux/gfp.h" 1



# 1 "./include/linux/mmdebug.h" 1






struct page;
struct vm_area_struct;
struct mm_struct;

extern void dump_page(struct page *page, const char *reason);
extern void __dump_page(struct page *page, const char *reason);
void dump_vma(const struct vm_area_struct *vma);
void dump_mm(const struct mm_struct *mm);
# 5 "./include/linux/gfp.h" 2
# 1 "./include/linux/mmzone.h" 1








# 1 "./include/linux/wait.h" 1
# 11 "./include/linux/wait.h"
# 1 "./include/uapi/linux/wait.h" 1
# 12 "./include/linux/wait.h" 2

typedef struct __wait_queue wait_queue_t;
typedef int (*wait_queue_func_t)(wait_queue_t *wait, unsigned mode, int flags, void *key);
int default_wake_function(wait_queue_t *wait, unsigned mode, int flags, void *key);





struct __wait_queue {
 unsigned int flags;
 void *private;
 wait_queue_func_t func;
 struct list_head task_list;
};

struct wait_bit_key {
 void *flags;
 int bit_nr;

 unsigned long timeout;
};

struct wait_bit_queue {
 struct wait_bit_key key;
 wait_queue_t wait;
};

struct __wait_queue_head {
 spinlock_t lock;
 struct list_head task_list;
};
typedef struct __wait_queue_head wait_queue_head_t;

struct task_struct;
# 73 "./include/linux/wait.h"
extern void __init_waitqueue_head(wait_queue_head_t *q, const char *name, struct lock_class_key *);
# 91 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) void init_waitqueue_entry(wait_queue_t *q, struct task_struct *p)
{
 q->flags = 0;
 q->private = p;
 q->func = default_wake_function;
}

static inline __attribute__((no_instrument_function)) void
init_waitqueue_func_entry(wait_queue_t *q, wait_queue_func_t func)
{
 q->flags = 0;
 q->private = ((void *)0);
 q->func = func;
}
# 136 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) int waitqueue_active(wait_queue_head_t *q)
{
 return !list_empty(&q->task_list);
}
# 149 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) bool wq_has_sleeper(wait_queue_head_t *wq)
{







 asm volatile("mfence":::"memory");
 return waitqueue_active(wq);
}

extern void add_wait_queue(wait_queue_head_t *q, wait_queue_t *wait);
extern void add_wait_queue_exclusive(wait_queue_head_t *q, wait_queue_t *wait);
extern void remove_wait_queue(wait_queue_head_t *q, wait_queue_t *wait);

static inline __attribute__((no_instrument_function)) void __add_wait_queue(wait_queue_head_t *head, wait_queue_t *new)
{
 list_add(&new->task_list, &head->task_list);
}




static inline __attribute__((no_instrument_function)) void
__add_wait_queue_exclusive(wait_queue_head_t *q, wait_queue_t *wait)
{
 wait->flags |= 0x01;
 __add_wait_queue(q, wait);
}

static inline __attribute__((no_instrument_function)) void __add_wait_queue_tail(wait_queue_head_t *head,
      wait_queue_t *new)
{
 list_add_tail(&new->task_list, &head->task_list);
}

static inline __attribute__((no_instrument_function)) void
__add_wait_queue_tail_exclusive(wait_queue_head_t *q, wait_queue_t *wait)
{
 wait->flags |= 0x01;
 __add_wait_queue_tail(q, wait);
}

static inline __attribute__((no_instrument_function)) void
__remove_wait_queue(wait_queue_head_t *head, wait_queue_t *old)
{
 list_del(&old->task_list);
}

typedef int wait_bit_action_f(struct wait_bit_key *, int mode);
void __wake_up(wait_queue_head_t *q, unsigned int mode, int nr, void *key);
void __wake_up_locked_key(wait_queue_head_t *q, unsigned int mode, void *key);
void __wake_up_sync_key(wait_queue_head_t *q, unsigned int mode, int nr, void *key);
void __wake_up_locked(wait_queue_head_t *q, unsigned int mode, int nr);
void __wake_up_sync(wait_queue_head_t *q, unsigned int mode, int nr);
void __wake_up_bit(wait_queue_head_t *, void *, int);
int __wait_on_bit(wait_queue_head_t *, struct wait_bit_queue *, wait_bit_action_f *, unsigned);
int __wait_on_bit_lock(wait_queue_head_t *, struct wait_bit_queue *, wait_bit_action_f *, unsigned);
void wake_up_bit(void *, int);
void wake_up_atomic_t(atomic_t *);
int out_of_line_wait_on_bit(void *, int, wait_bit_action_f *, unsigned);
int out_of_line_wait_on_bit_timeout(void *, int, wait_bit_action_f *, unsigned, unsigned long);
int out_of_line_wait_on_bit_lock(void *, int, wait_bit_action_f *, unsigned);
int out_of_line_wait_on_atomic_t(atomic_t *, int (*)(atomic_t *), unsigned);
wait_queue_head_t *bit_waitqueue(void *, int);
# 252 "./include/linux/wait.h"
extern void init_wait_entry(wait_queue_t *__wait, int flags);
# 623 "./include/linux/wait.h"
extern int do_wait_intr(wait_queue_head_t *, wait_queue_t *);
extern int do_wait_intr_irq(wait_queue_head_t *, wait_queue_t *);
# 970 "./include/linux/wait.h"
void prepare_to_wait(wait_queue_head_t *q, wait_queue_t *wait, int state);
void prepare_to_wait_exclusive(wait_queue_head_t *q, wait_queue_t *wait, int state);
long prepare_to_wait_event(wait_queue_head_t *q, wait_queue_t *wait, int state);
void finish_wait(wait_queue_head_t *q, wait_queue_t *wait);
long wait_woken(wait_queue_t *wait, unsigned mode, long timeout);
int woken_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
int autoremove_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
int wake_bit_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
# 1008 "./include/linux/wait.h"
extern int bit_wait(struct wait_bit_key *, int);
extern int bit_wait_io(struct wait_bit_key *, int);
extern int bit_wait_timeout(struct wait_bit_key *, int);
extern int bit_wait_io_timeout(struct wait_bit_key *, int);
# 1029 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) int
wait_on_bit(unsigned long *word, int bit, unsigned mode)
{
 do { _cond_resched(); } while (0);
 if (!(__builtin_constant_p((bit)) ? constant_test_bit((bit), (word)) : variable_test_bit((bit), (word))))
  return 0;
 return out_of_line_wait_on_bit(word, bit,
           bit_wait,
           mode);
}
# 1054 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) int
wait_on_bit_io(unsigned long *word, int bit, unsigned mode)
{
 do { _cond_resched(); } while (0);
 if (!(__builtin_constant_p((bit)) ? constant_test_bit((bit), (word)) : variable_test_bit((bit), (word))))
  return 0;
 return out_of_line_wait_on_bit(word, bit,
           bit_wait_io,
           mode);
}
# 1080 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) int
wait_on_bit_timeout(unsigned long *word, int bit, unsigned mode,
      unsigned long timeout)
{
 do { _cond_resched(); } while (0);
 if (!(__builtin_constant_p((bit)) ? constant_test_bit((bit), (word)) : variable_test_bit((bit), (word))))
  return 0;
 return out_of_line_wait_on_bit_timeout(word, bit,
            bit_wait_timeout,
            mode, timeout);
}
# 1108 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) int
wait_on_bit_action(unsigned long *word, int bit, wait_bit_action_f *action,
     unsigned mode)
{
 do { _cond_resched(); } while (0);
 if (!(__builtin_constant_p((bit)) ? constant_test_bit((bit), (word)) : variable_test_bit((bit), (word))))
  return 0;
 return out_of_line_wait_on_bit(word, bit, action, mode);
}
# 1137 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) int
wait_on_bit_lock(unsigned long *word, int bit, unsigned mode)
{
 do { _cond_resched(); } while (0);
 if (!test_and_set_bit(bit, word))
  return 0;
 return out_of_line_wait_on_bit_lock(word, bit, bit_wait, mode);
}
# 1161 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) int
wait_on_bit_lock_io(unsigned long *word, int bit, unsigned mode)
{
 do { _cond_resched(); } while (0);
 if (!test_and_set_bit(bit, word))
  return 0;
 return out_of_line_wait_on_bit_lock(word, bit, bit_wait_io, mode);
}
# 1187 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function)) int
wait_on_bit_lock_action(unsigned long *word, int bit, wait_bit_action_f *action,
   unsigned mode)
{
 do { _cond_resched(); } while (0);
 if (!test_and_set_bit(bit, word))
  return 0;
 return out_of_line_wait_on_bit_lock(word, bit, action, mode);
}
# 1207 "./include/linux/wait.h"
static inline __attribute__((no_instrument_function))
int wait_on_atomic_t(atomic_t *val, int (*action)(atomic_t *), unsigned mode)
{
 do { _cond_resched(); } while (0);
 if (atomic_read(val) == 0)
  return 0;
 return out_of_line_wait_on_atomic_t(val, action, mode);
}
# 10 "./include/linux/mmzone.h" 2



# 1 "./include/linux/numa.h" 1
# 14 "./include/linux/mmzone.h" 2


# 1 "./include/linux/nodemask.h" 1
# 97 "./include/linux/nodemask.h"
typedef struct { unsigned long bits[((((1 << 6)) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } nodemask_t;
extern nodemask_t _unused_nodemask_arg_;
# 118 "./include/linux/nodemask.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void __node_set(int node, volatile nodemask_t *dstp)
{
 set_bit(node, dstp->bits);
}


static inline __attribute__((no_instrument_function)) void __node_clear(int node, volatile nodemask_t *dstp)
{
 clear_bit(node, dstp->bits);
}


static inline __attribute__((no_instrument_function)) void __nodes_setall(nodemask_t *dstp, unsigned int nbits)
{
 bitmap_fill(dstp->bits, nbits);
}


static inline __attribute__((no_instrument_function)) void __nodes_clear(nodemask_t *dstp, unsigned int nbits)
{
 bitmap_zero(dstp->bits, nbits);
}






static inline __attribute__((no_instrument_function)) int __node_test_and_set(int node, nodemask_t *addr)
{
 return test_and_set_bit(node, addr->bits);
}



static inline __attribute__((no_instrument_function)) void __nodes_and(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_or(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_xor(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_andnot(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_complement(nodemask_t *dstp,
     const nodemask_t *srcp, unsigned int nbits)
{
 bitmap_complement(dstp->bits, srcp->bits, nbits);
}



static inline __attribute__((no_instrument_function)) int __nodes_equal(const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 return bitmap_equal(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((no_instrument_function)) int __nodes_intersects(const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((no_instrument_function)) int __nodes_subset(const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((no_instrument_function)) int __nodes_empty(const nodemask_t *srcp, unsigned int nbits)
{
 return bitmap_empty(srcp->bits, nbits);
}


static inline __attribute__((no_instrument_function)) int __nodes_full(const nodemask_t *srcp, unsigned int nbits)
{
 return bitmap_full(srcp->bits, nbits);
}


static inline __attribute__((no_instrument_function)) int __nodes_weight(const nodemask_t *srcp, unsigned int nbits)
{
 return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_shift_right(nodemask_t *dstp,
     const nodemask_t *srcp, int n, int nbits)
{
 bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_shift_left(nodemask_t *dstp,
     const nodemask_t *srcp, int n, int nbits)
{
 bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}





static inline __attribute__((no_instrument_function)) int __first_node(const nodemask_t *srcp)
{
 return ({ int __UNIQUE_ID_min1_0 = ((1 << 6)); int __UNIQUE_ID_min2_1 = (find_first_bit(srcp->bits, (1 << 6))); (void) (&__UNIQUE_ID_min1_0 == &__UNIQUE_ID_min2_1); __UNIQUE_ID_min1_0 < __UNIQUE_ID_min2_1 ? __UNIQUE_ID_min1_0 : __UNIQUE_ID_min2_1; });
}


static inline __attribute__((no_instrument_function)) int __next_node(int n, const nodemask_t *srcp)
{
 return ({ int __UNIQUE_ID_min1_2 = ((1 << 6)); int __UNIQUE_ID_min2_3 = (find_next_bit(srcp->bits, (1 << 6), n+1)); (void) (&__UNIQUE_ID_min1_2 == &__UNIQUE_ID_min2_3); __UNIQUE_ID_min1_2 < __UNIQUE_ID_min2_3 ? __UNIQUE_ID_min1_2 : __UNIQUE_ID_min2_3; });
}






int __next_node_in(int node, const nodemask_t *srcp);

static inline __attribute__((no_instrument_function)) void init_nodemask_of_node(nodemask_t *mask, int node)
{
 __nodes_clear(&(*mask), (1 << 6));
 __node_set((node), &(*mask));
}
# 289 "./include/linux/nodemask.h"
static inline __attribute__((no_instrument_function)) int __first_unset_node(const nodemask_t *maskp)
{
 return ({ int __UNIQUE_ID_min1_4 = ((1 << 6)); int __UNIQUE_ID_min2_5 = (find_first_zero_bit(maskp->bits, (1 << 6))); (void) (&__UNIQUE_ID_min1_4 == &__UNIQUE_ID_min2_5); __UNIQUE_ID_min1_4 < __UNIQUE_ID_min2_5 ? __UNIQUE_ID_min1_4 : __UNIQUE_ID_min2_5; });

}
# 323 "./include/linux/nodemask.h"
static inline __attribute__((no_instrument_function)) int __nodemask_parse_user(const char *buf, int len,
     nodemask_t *dstp, int nbits)
{
 return bitmap_parse_user(buf, len, dstp->bits, nbits);
}


static inline __attribute__((no_instrument_function)) int __nodelist_parse(const char *buf, nodemask_t *dstp, int nbits)
{
 return bitmap_parselist(buf, dstp->bits, nbits);
}



static inline __attribute__((no_instrument_function)) int __node_remap(int oldbit,
  const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
 return bitmap_bitremap(oldbit, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_remap(nodemask_t *dstp, const nodemask_t *srcp,
  const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
 bitmap_remap(dstp->bits, srcp->bits, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_onto(nodemask_t *dstp, const nodemask_t *origp,
  const nodemask_t *relmapp, int nbits)
{
 bitmap_onto(dstp->bits, origp->bits, relmapp->bits, nbits);
}



static inline __attribute__((no_instrument_function)) void __nodes_fold(nodemask_t *dstp, const nodemask_t *origp,
  int sz, int nbits)
{
 bitmap_fold(dstp->bits, origp->bits, sz, nbits);
}
# 381 "./include/linux/nodemask.h"
enum node_states {
 N_POSSIBLE,
 N_ONLINE,
 N_NORMAL_MEMORY,



 N_HIGH_MEMORY = N_NORMAL_MEMORY,




 N_MEMORY = N_HIGH_MEMORY,

 N_CPU,
 NR_NODE_STATES
};






extern nodemask_t node_states[NR_NODE_STATES];


static inline __attribute__((no_instrument_function)) int node_state(int node, enum node_states state)
{
 return (__builtin_constant_p(((node))) ? constant_test_bit(((node)), ((node_states[state]).bits)) : variable_test_bit(((node)), ((node_states[state]).bits)));
}

static inline __attribute__((no_instrument_function)) void node_set_state(int node, enum node_states state)
{
 __node_set(node, &node_states[state]);
}

static inline __attribute__((no_instrument_function)) void node_clear_state(int node, enum node_states state)
{
 __node_clear(node, &node_states[state]);
}

static inline __attribute__((no_instrument_function)) int num_node_state(enum node_states state)
{
 return __nodes_weight(&(node_states[state]), (1 << 6));
}






static inline __attribute__((no_instrument_function)) int next_online_node(int nid)
{
 return __next_node((nid), &(node_states[N_ONLINE]));
}
static inline __attribute__((no_instrument_function)) int next_memory_node(int nid)
{
 return __next_node((nid), &(node_states[N_MEMORY]));
}

extern int nr_node_ids;
extern int nr_online_nodes;

static inline __attribute__((no_instrument_function)) void node_set_online(int nid)
{
 node_set_state(nid, N_ONLINE);
 nr_online_nodes = num_node_state(N_ONLINE);
}

static inline __attribute__((no_instrument_function)) void node_set_offline(int nid)
{
 node_clear_state(nid, N_ONLINE);
 nr_online_nodes = num_node_state(N_ONLINE);
}
# 491 "./include/linux/nodemask.h"
extern int node_random(const nodemask_t *maskp);
# 525 "./include/linux/nodemask.h"
struct nodemask_scratch {
 nodemask_t mask1;
 nodemask_t mask2;
};
# 17 "./include/linux/mmzone.h" 2
# 1 "./include/linux/pageblock-flags.h" 1
# 29 "./include/linux/pageblock-flags.h"
enum pageblock_bits {
 PB_migrate,
 PB_migrate_end = PB_migrate + 3 - 1,

 PB_migrate_skip,





 NR_PAGEBLOCK_BITS
};
# 66 "./include/linux/pageblock-flags.h"
struct page;

unsigned long get_pfnblock_flags_mask(struct page *page,
    unsigned long pfn,
    unsigned long end_bitidx,
    unsigned long mask);

void set_pfnblock_flags_mask(struct page *page,
    unsigned long flags,
    unsigned long pfn,
    unsigned long end_bitidx,
    unsigned long mask);
# 18 "./include/linux/mmzone.h" 2
# 1 "./include/linux/page-flags-layout.h" 1




# 1 "./include/generated/bounds.h" 1
# 6 "./include/linux/page-flags-layout.h" 2
# 19 "./include/linux/mmzone.h" 2
# 38 "./include/linux/mmzone.h"
enum {
 MIGRATE_UNMOVABLE,
 MIGRATE_MOVABLE,
 MIGRATE_RECLAIMABLE,
 MIGRATE_PCPTYPES,
 MIGRATE_HIGHATOMIC = MIGRATE_PCPTYPES,
# 63 "./include/linux/mmzone.h"
 MIGRATE_TYPES
};


extern char * const migratetype_names[MIGRATE_TYPES];
# 81 "./include/linux/mmzone.h"
extern int page_group_by_mobility_disabled;
# 90 "./include/linux/mmzone.h"
struct free_area {
 struct list_head free_list[MIGRATE_TYPES];
 unsigned long nr_free;
};

struct pglist_data;
# 104 "./include/linux/mmzone.h"
struct zone_padding {
 char x[0];
} __attribute__((__aligned__(1 << (6))));





enum zone_stat_item {

 NR_FREE_PAGES,
 NR_ZONE_LRU_BASE,
 NR_ZONE_INACTIVE_ANON = NR_ZONE_LRU_BASE,
 NR_ZONE_ACTIVE_ANON,
 NR_ZONE_INACTIVE_FILE,
 NR_ZONE_ACTIVE_FILE,
 NR_ZONE_UNEVICTABLE,
 NR_ZONE_WRITE_PENDING,
 NR_MLOCK,
 NR_SLAB_RECLAIMABLE,
 NR_SLAB_UNRECLAIMABLE,
 NR_PAGETABLE,
 NR_KERNEL_STACK_KB,

 NR_BOUNCE,




 NUMA_HIT,
 NUMA_MISS,
 NUMA_FOREIGN,
 NUMA_INTERLEAVE_HIT,
 NUMA_LOCAL,
 NUMA_OTHER,

 NR_FREE_CMA_PAGES,
 NR_VM_ZONE_STAT_ITEMS };

enum node_stat_item {
 NR_LRU_BASE,
 NR_INACTIVE_ANON = NR_LRU_BASE,
 NR_ACTIVE_ANON,
 NR_INACTIVE_FILE,
 NR_ACTIVE_FILE,
 NR_UNEVICTABLE,
 NR_ISOLATED_ANON,
 NR_ISOLATED_FILE,
 NR_PAGES_SCANNED,
 WORKINGSET_REFAULT,
 WORKINGSET_ACTIVATE,
 WORKINGSET_NODERECLAIM,
 NR_ANON_MAPPED,
 NR_FILE_MAPPED,

 NR_FILE_PAGES,
 NR_FILE_DIRTY,
 NR_WRITEBACK,
 NR_WRITEBACK_TEMP,
 NR_SHMEM,
 NR_SHMEM_THPS,
 NR_SHMEM_PMDMAPPED,
 NR_ANON_THPS,
 NR_UNSTABLE_NFS,
 NR_VMSCAN_WRITE,
 NR_VMSCAN_IMMEDIATE,
 NR_DIRTIED,
 NR_WRITTEN,
 NR_VM_NODE_STAT_ITEMS
};
# 188 "./include/linux/mmzone.h"
enum lru_list {
 LRU_INACTIVE_ANON = 0,
 LRU_ACTIVE_ANON = 0 + 1,
 LRU_INACTIVE_FILE = 0 + 2,
 LRU_ACTIVE_FILE = 0 + 2 + 1,
 LRU_UNEVICTABLE,
 NR_LRU_LISTS
};





static inline __attribute__((no_instrument_function)) int is_file_lru(enum lru_list lru)
{
 return (lru == LRU_INACTIVE_FILE || lru == LRU_ACTIVE_FILE);
}

static inline __attribute__((no_instrument_function)) int is_active_lru(enum lru_list lru)
{
 return (lru == LRU_ACTIVE_ANON || lru == LRU_ACTIVE_FILE);
}

struct zone_reclaim_stat {
# 220 "./include/linux/mmzone.h"
 unsigned long recent_rotated[2];
 unsigned long recent_scanned[2];
};

struct lruvec {
 struct list_head lists[NR_LRU_LISTS];
 struct zone_reclaim_stat reclaim_stat;

 atomic_long_t inactive_age;



};
# 247 "./include/linux/mmzone.h"
typedef unsigned isolate_mode_t;

enum zone_watermarks {
 WMARK_MIN,
 WMARK_LOW,
 WMARK_HIGH,
 NR_WMARK
};





struct per_cpu_pages {
 int count;
 int high;
 int batch;


 struct list_head lists[MIGRATE_PCPTYPES];
};

struct per_cpu_pageset {
 struct per_cpu_pages pcp;

 s8 expire;


 s8 stat_threshold;
 s8 vm_stat_diff[NR_VM_ZONE_STAT_ITEMS];

};

struct per_cpu_nodestat {
 s8 stat_threshold;
 s8 vm_node_stat_diff[NR_VM_NODE_STAT_ITEMS];
};



enum zone_type {
# 307 "./include/linux/mmzone.h"
 ZONE_DMA,







 ZONE_DMA32,






 ZONE_NORMAL,
# 334 "./include/linux/mmzone.h"
 ZONE_MOVABLE,



 __MAX_NR_ZONES

};



struct zone {



 unsigned long watermark[NR_WMARK];

 unsigned long nr_reserved_highatomic;
# 361 "./include/linux/mmzone.h"
 long lowmem_reserve[4];


 int node;

 struct pglist_data *zone_pgdat;
 struct per_cpu_pageset *pageset;
# 378 "./include/linux/mmzone.h"
 unsigned long zone_start_pfn;
# 421 "./include/linux/mmzone.h"
 unsigned long managed_pages;
 unsigned long spanned_pages;
 unsigned long present_pages;

 const char *name;
# 441 "./include/linux/mmzone.h"
 int initialized;


 struct zone_padding _pad1_;


 struct free_area free_area[11];


 unsigned long flags;


 spinlock_t lock;


 struct zone_padding _pad2_;






 unsigned long percpu_drift_mark;



 unsigned long compact_cached_free_pfn;

 unsigned long compact_cached_migrate_pfn[2];
# 478 "./include/linux/mmzone.h"
 unsigned int compact_considered;
 unsigned int compact_defer_shift;
 int compact_order_failed;




 bool compact_blockskip_flush;


 bool contiguous;

 struct zone_padding _pad3_;

 atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];
} __attribute__((__aligned__(1 << (6))));

enum pgdat_flags {
 PGDAT_CONGESTED,


 PGDAT_DIRTY,



 PGDAT_WRITEBACK,


 PGDAT_RECLAIM_LOCKED,
};

static inline __attribute__((no_instrument_function)) unsigned long zone_end_pfn(const struct zone *zone)
{
 return zone->zone_start_pfn + zone->spanned_pages;
}

static inline __attribute__((no_instrument_function)) bool zone_spans_pfn(const struct zone *zone, unsigned long pfn)
{
 return zone->zone_start_pfn <= pfn && pfn < zone_end_pfn(zone);
}

static inline __attribute__((no_instrument_function)) bool zone_is_initialized(struct zone *zone)
{
 return zone->initialized;
}

static inline __attribute__((no_instrument_function)) bool zone_is_empty(struct zone *zone)
{
 return zone->spanned_pages == 0;
}
# 539 "./include/linux/mmzone.h"
enum {
 ZONELIST_FALLBACK,





 ZONELIST_NOFALLBACK,

 MAX_ZONELISTS
};





struct zoneref {
 struct zone *zone;
 int zone_idx;
};
# 574 "./include/linux/mmzone.h"
struct zonelist {
 struct zoneref _zonerefs[((1 << 6) * 4) + 1];
};



extern struct page *mem_map;
# 594 "./include/linux/mmzone.h"
struct bootmem_data;
typedef struct pglist_data {
 struct zone node_zones[4];
 struct zonelist node_zonelists[MAX_ZONELISTS];
 int nr_zones;
# 621 "./include/linux/mmzone.h"
 unsigned long node_start_pfn;
 unsigned long node_present_pages;
 unsigned long node_spanned_pages;

 int node_id;
 wait_queue_head_t kswapd_wait;
 wait_queue_head_t pfmemalloc_wait;
 struct task_struct *kswapd;

 int kswapd_order;
 enum zone_type kswapd_classzone_idx;


 int kcompactd_max_order;
 enum zone_type kcompactd_classzone_idx;
 wait_queue_head_t kcompactd_wait;
 struct task_struct *kcompactd;
# 653 "./include/linux/mmzone.h"
 unsigned long totalreserve_pages;





 unsigned long min_unmapped_pages;
 unsigned long min_slab_pages;



 struct zone_padding _pad1_;
 spinlock_t lru_lock;
# 682 "./include/linux/mmzone.h"
 struct lruvec lruvec;





 unsigned int inactive_ratio;

 unsigned long flags;

 struct zone_padding _pad2_;


 struct per_cpu_nodestat *per_cpu_nodestats;
 atomic_long_t vm_stat[NR_VM_NODE_STAT_ITEMS];
} pg_data_t;
# 710 "./include/linux/mmzone.h"
static inline __attribute__((no_instrument_function)) spinlock_t *zone_lru_lock(struct zone *zone)
{
 return &zone->zone_pgdat->lru_lock;
}

static inline __attribute__((no_instrument_function)) struct lruvec *node_lruvec(struct pglist_data *pgdat)
{
 return &pgdat->lruvec;
}

static inline __attribute__((no_instrument_function)) unsigned long pgdat_end_pfn(pg_data_t *pgdat)
{
 return pgdat->node_start_pfn + pgdat->node_spanned_pages;
}

static inline __attribute__((no_instrument_function)) bool pgdat_is_empty(pg_data_t *pgdat)
{
 return !pgdat->node_start_pfn && !pgdat->node_spanned_pages;
}

static inline __attribute__((no_instrument_function)) int zone_id(const struct zone *zone)
{
 struct pglist_data *pgdat = zone->zone_pgdat;

 return zone - pgdat->node_zones;
}







static inline __attribute__((no_instrument_function)) bool is_dev_zone(const struct zone *zone)
{
 return false;
}



# 1 "./include/linux/memory_hotplug.h" 1



# 1 "./include/linux/mmzone.h" 1
# 5 "./include/linux/memory_hotplug.h" 2

# 1 "./include/linux/notifier.h" 1
# 13 "./include/linux/notifier.h"
# 1 "./include/linux/mutex.h" 1
# 20 "./include/linux/mutex.h"
# 1 "./include/linux/osq_lock.h" 1







struct optimistic_spin_node {
 struct optimistic_spin_node *next, *prev;
 int locked;
 int cpu;
};

struct optimistic_spin_queue {




 atomic_t tail;
};






static inline __attribute__((no_instrument_function)) void osq_lock_init(struct optimistic_spin_queue *lock)
{
 atomic_set(&lock->tail, (0));
}

extern bool osq_lock(struct optimistic_spin_queue *lock);
extern void osq_unlock(struct optimistic_spin_queue *lock);

static inline __attribute__((no_instrument_function)) bool osq_is_locked(struct optimistic_spin_queue *lock)
{
 return atomic_read(&lock->tail) != (0);
}
# 21 "./include/linux/mutex.h" 2
# 1 "./include/linux/debug_locks.h" 1







struct task_struct;

extern int debug_locks;
extern int debug_locks_silent;


static inline __attribute__((no_instrument_function)) int __debug_locks_off(void)
{
 return ({ __typeof__ (*((&debug_locks))) __ret = ((0)); switch (sizeof(*((&debug_locks)))) { case 1: asm volatile ("" "xchg" "b %b0, %1\n" : "+q" (__ret), "+m" (*((&debug_locks))) : : "memory", "cc"); break; case 2: asm volatile ("" "xchg" "w %w0, %1\n" : "+r" (__ret), "+m" (*((&debug_locks))) : : "memory", "cc"); break; case 4: asm volatile ("" "xchg" "l %0, %1\n" : "+r" (__ret), "+m" (*((&debug_locks))) : : "memory", "cc"); break; case 8: asm volatile ("" "xchg" "q %q0, %1\n" : "+r" (__ret), "+m" (*((&debug_locks))) : : "memory", "cc"); break; default: __xchg_wrong_size(); } __ret; });
}




extern int debug_locks_off(void);
# 48 "./include/linux/debug_locks.h"
struct task_struct;







static inline __attribute__((no_instrument_function)) void debug_show_all_locks(void)
{
}

static inline __attribute__((no_instrument_function)) void debug_show_held_locks(struct task_struct *task)
{
}

static inline __attribute__((no_instrument_function)) void
debug_check_no_locks_freed(const void *from, unsigned long len)
{
}

static inline __attribute__((no_instrument_function)) void
debug_check_no_locks_held(void)
{
}
# 22 "./include/linux/mutex.h" 2

struct ww_acquire_ctx;
# 53 "./include/linux/mutex.h"
struct mutex {
 atomic_long_t owner;
 spinlock_t wait_lock;

 struct optimistic_spin_queue osq;

 struct list_head wait_list;






};

static inline __attribute__((no_instrument_function)) struct task_struct *__mutex_owner(struct mutex *lock)
{
 return (struct task_struct *)(atomic_long_read(&lock->owner) & ~0x07);
}





struct mutex_waiter {
 struct list_head list;
 struct task_struct *task;
 struct ww_acquire_ctx *ww_ctx;



};
# 97 "./include/linux/mutex.h"
static inline __attribute__((no_instrument_function)) void mutex_destroy(struct mutex *lock) {}
# 133 "./include/linux/mutex.h"
extern void __mutex_init(struct mutex *lock, const char *name,
    struct lock_class_key *key);







static inline __attribute__((no_instrument_function)) int mutex_is_locked(struct mutex *lock)
{



 return __mutex_owner(lock) != ((void *)0);
}
# 176 "./include/linux/mutex.h"
extern void mutex_lock(struct mutex *lock);
extern int __attribute__((warn_unused_result)) mutex_lock_interruptible(struct mutex *lock);
extern int __attribute__((warn_unused_result)) mutex_lock_killable(struct mutex *lock);
extern void mutex_lock_io(struct mutex *lock);
# 194 "./include/linux/mutex.h"
extern int mutex_trylock(struct mutex *lock);
extern void mutex_unlock(struct mutex *lock);

extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);





enum mutex_trylock_recursive_enum {
 MUTEX_TRYLOCK_FAILED = 0,
 MUTEX_TRYLOCK_SUCCESS = 1,
 MUTEX_TRYLOCK_RECURSIVE,
};
# 221 "./include/linux/mutex.h"
static inline __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) enum mutex_trylock_recursive_enum
mutex_trylock_recursive(struct mutex *lock)
{
 if (__builtin_expect(!!(__mutex_owner(lock) == get_current()), 0))
  return MUTEX_TRYLOCK_RECURSIVE;

 return mutex_trylock(lock);
}
# 14 "./include/linux/notifier.h" 2
# 1 "./include/linux/rwsem.h" 1
# 22 "./include/linux/rwsem.h"
struct rw_semaphore;






struct rw_semaphore {
 atomic_long_t count;
 struct list_head wait_list;
 raw_spinlock_t wait_lock;

 struct optimistic_spin_queue osq;




 struct task_struct *owner;




};

extern struct rw_semaphore *rwsem_down_read_failed(struct rw_semaphore *sem);
extern struct rw_semaphore *rwsem_down_write_failed(struct rw_semaphore *sem);
extern struct rw_semaphore *rwsem_down_write_failed_killable(struct rw_semaphore *sem);
extern struct rw_semaphore *rwsem_wake(struct rw_semaphore *);
extern struct rw_semaphore *rwsem_downgrade_wake(struct rw_semaphore *sem);



# 1 "./arch/x86/include/asm/rwsem.h" 1
# 63 "./arch/x86/include/asm/rwsem.h"
static inline __attribute__((no_instrument_function)) void __down_read(struct rw_semaphore *sem)
{
 asm volatile("# beginning down_read\n\t"
       ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " " " "incq" " " "(%1)\n\t"

       "  jns        1f\n"
       "  call call_rwsem_down_read_failed\n"
       "1:\n\t"
       "# ending down_read\n\t"
       : "+m" (sem->count)
       : "a" (sem)
       : "memory", "cc");
}




static inline __attribute__((no_instrument_function)) bool __down_read_trylock(struct rw_semaphore *sem)
{
 long result, tmp;
 asm volatile("# beginning __down_read_trylock\n\t"
       "  mov          %0,%1\n\t"
       "1:\n\t"
       "  mov          %1,%2\n\t"
       "  add          %3,%2\n\t"
       "  jle	     2f\n\t"
       ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "  cmpxchg  %2,%0\n\t"
       "  jnz	     1b\n\t"
       "2:\n\t"
       "# ending __down_read_trylock\n\t"
       : "+m" (sem->count), "=&a" (result), "=&r" (tmp)
       : "i" (0x00000001L)
       : "memory", "cc");
 return result >= 0;
}
# 123 "./arch/x86/include/asm/rwsem.h"
static inline __attribute__((no_instrument_function)) void __down_write(struct rw_semaphore *sem)
{
 ({ long tmp; struct rw_semaphore* ret; register void *__sp asm("rsp"); asm volatile("# beginning down_write\n\t" ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "  xadd      %1,(%4)\n\t" "  test " " " "%k1" " " "," " " "%k1" " " "\n\t" "  jz        1f\n" "  call " "call_rwsem_down_write_failed" "\n" "1:\n" "# ending down_write" : "+m" (sem->count), "=d" (tmp), "=a" (ret), "+r" (__sp) : "a" (sem), "1" (((-0xffffffffL -1) + 0x00000001L)) : "memory", "cc"); ret; });
}

static inline __attribute__((no_instrument_function)) int __down_write_killable(struct rw_semaphore *sem)
{
 if (IS_ERR(({ long tmp; struct rw_semaphore* ret; register void *__sp asm("rsp"); asm volatile("# beginning down_write\n\t" ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "  xadd      %1,(%4)\n\t" "  test " " " "%k1" " " "," " " "%k1" " " "\n\t" "  jz        1f\n" "  call " "call_rwsem_down_write_failed_killable" "\n" "1:\n" "# ending down_write" : "+m" (sem->count), "=d" (tmp), "=a" (ret), "+r" (__sp) : "a" (sem), "1" (((-0xffffffffL -1) + 0x00000001L)) : "memory", "cc"); ret; })))
  return -4;

 return 0;
}




static inline __attribute__((no_instrument_function)) bool __down_write_trylock(struct rw_semaphore *sem)
{
 bool result;
 long tmp0, tmp1;
 asm volatile("# beginning __down_write_trylock\n\t"
       "  mov          %0,%1\n\t"
       "1:\n\t"
       "  test " " " "%k1" " " "," " " "%k1" " " "\n\t"

       "  jnz          2f\n\t"
       "  mov          %1,%2\n\t"
       "  add          %4,%2\n\t"
       ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "  cmpxchg  %2,%0\n\t"
       "  jnz	     1b\n\t"
       "2:\n\t"
       "\n\tset" "e" " %[_cc_" "e" "]\n"
       "# ending __down_write_trylock\n\t"
       : "+m" (sem->count), "=&a" (tmp0), "=&r" (tmp1),
         [_cc_e] "=qm" (result)
       : "er" (((-0xffffffffL -1) + 0x00000001L))
       : "memory");
 return result;
}




static inline __attribute__((no_instrument_function)) void __up_read(struct rw_semaphore *sem)
{
 long tmp;
 asm volatile("# beginning __up_read\n\t"
       ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "  xadd      %1,(%2)\n\t"

       "  jns        1f\n\t"
       "  call call_rwsem_wake\n"
       "1:\n"
       "# ending __up_read\n"
       : "+m" (sem->count), "=d" (tmp)
       : "a" (sem), "1" (-0x00000001L)
       : "memory", "cc");
}




static inline __attribute__((no_instrument_function)) void __up_write(struct rw_semaphore *sem)
{
 long tmp;
 asm volatile("# beginning __up_write\n\t"
       ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " "  xadd      %1,(%2)\n\t"

       "  jns        1f\n\t"
       "  call call_rwsem_wake\n"
       "1:\n\t"
       "# ending __up_write\n"
       : "+m" (sem->count), "=d" (tmp)
       : "a" (sem), "1" (-((-0xffffffffL -1) + 0x00000001L))
       : "memory", "cc");
}




static inline __attribute__((no_instrument_function)) void __downgrade_write(struct rw_semaphore *sem)
{
 asm volatile("# beginning __downgrade_write\n\t"
       ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:" "\n\tlock; " " " "addq" " " "%2,(%1)\n\t"




       "  jns       1f\n\t"
       "  call call_rwsem_downgrade_wake\n"
       "1:\n\t"
       "# ending __downgrade_write\n"
       : "+m" (sem->count)
       : "a" (sem), "er" (-(-0xffffffffL -1))
       : "memory", "cc");
}
# 54 "./include/linux/rwsem.h" 2


static inline __attribute__((no_instrument_function)) int rwsem_is_locked(struct rw_semaphore *sem)
{
 return atomic_long_read(&sem->count) != 0;
}
# 88 "./include/linux/rwsem.h"
extern void __init_rwsem(struct rw_semaphore *sem, const char *name,
    struct lock_class_key *key);
# 104 "./include/linux/rwsem.h"
static inline __attribute__((no_instrument_function)) int rwsem_is_contended(struct rw_semaphore *sem)
{
 return !list_empty(&sem->wait_list);
}




extern void down_read(struct rw_semaphore *sem);




extern int down_read_trylock(struct rw_semaphore *sem);




extern void down_write(struct rw_semaphore *sem);
extern int __attribute__((warn_unused_result)) down_write_killable(struct rw_semaphore *sem);




extern int down_write_trylock(struct rw_semaphore *sem);




extern void up_read(struct rw_semaphore *sem);




extern void up_write(struct rw_semaphore *sem);




extern void downgrade_write(struct rw_semaphore *sem);
# 15 "./include/linux/notifier.h" 2
# 1 "./include/linux/srcu.h" 1
# 33 "./include/linux/srcu.h"
# 1 "./include/linux/rcupdate.h" 1
# 43 "./include/linux/rcupdate.h"
# 1 "./include/linux/debugobjects.h" 1






enum debug_obj_state {
 ODEBUG_STATE_NONE,
 ODEBUG_STATE_INIT,
 ODEBUG_STATE_INACTIVE,
 ODEBUG_STATE_ACTIVE,
 ODEBUG_STATE_DESTROYED,
 ODEBUG_STATE_NOTAVAILABLE,
 ODEBUG_STATE_MAX,
};

struct debug_obj_descr;
# 27 "./include/linux/debugobjects.h"
struct debug_obj {
 struct hlist_node node;
 enum debug_obj_state state;
 unsigned int astate;
 void *object;
 struct debug_obj_descr *descr;
};
# 54 "./include/linux/debugobjects.h"
struct debug_obj_descr {
 const char *name;
 void *(*debug_hint)(void *addr);
 bool (*is_static_object)(void *addr);
 bool (*fixup_init)(void *addr, enum debug_obj_state state);
 bool (*fixup_activate)(void *addr, enum debug_obj_state state);
 bool (*fixup_destroy)(void *addr, enum debug_obj_state state);
 bool (*fixup_free)(void *addr, enum debug_obj_state state);
 bool (*fixup_assert_init)(void *addr, enum debug_obj_state state);
};
# 87 "./include/linux/debugobjects.h"
static inline __attribute__((no_instrument_function)) void
debug_object_init (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((no_instrument_function)) void
debug_object_init_on_stack(void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((no_instrument_function)) int
debug_object_activate (void *addr, struct debug_obj_descr *descr) { return 0; }
static inline __attribute__((no_instrument_function)) void
debug_object_deactivate(void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((no_instrument_function)) void
debug_object_destroy (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((no_instrument_function)) void
debug_object_free (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((no_instrument_function)) void
debug_object_assert_init(void *addr, struct debug_obj_descr *descr) { }

static inline __attribute__((no_instrument_function)) void debug_objects_early_init(void) { }
static inline __attribute__((no_instrument_function)) void debug_objects_mem_init(void) { }





static inline __attribute__((no_instrument_function)) void
debug_check_no_obj_freed(const void *address, unsigned long size) { }
# 44 "./include/linux/rcupdate.h" 2


# 1 "./include/linux/ktime.h" 1
# 25 "./include/linux/ktime.h"
# 1 "./include/linux/jiffies.h" 1







# 1 "./include/linux/timex.h" 1
# 56 "./include/linux/timex.h"
# 1 "./include/uapi/linux/timex.h" 1
# 64 "./include/uapi/linux/timex.h"
struct timex {
 unsigned int modes;
 __kernel_long_t offset;
 __kernel_long_t freq;
 __kernel_long_t maxerror;
 __kernel_long_t esterror;
 int status;
 __kernel_long_t constant;
 __kernel_long_t precision;
 __kernel_long_t tolerance;


 struct timeval time;
 __kernel_long_t tick;

 __kernel_long_t ppsfreq;
 __kernel_long_t jitter;
 int shift;
 __kernel_long_t stabil;
 __kernel_long_t jitcnt;
 __kernel_long_t calcnt;
 __kernel_long_t errcnt;
 __kernel_long_t stbcnt;

 int tai;

 int :32; int :32; int :32; int :32;
 int :32; int :32; int :32; int :32;
 int :32; int :32; int :32;
};
# 57 "./include/linux/timex.h" 2






# 1 "./include/uapi/linux/param.h" 1



# 1 "./arch/x86/include/uapi/asm/param.h" 1
# 1 "./include/asm-generic/param.h" 1



# 1 "./include/uapi/asm-generic/param.h" 1
# 5 "./include/asm-generic/param.h" 2
# 2 "./arch/x86/include/uapi/asm/param.h" 2
# 5 "./include/uapi/linux/param.h" 2
# 64 "./include/linux/timex.h" 2

# 1 "./arch/x86/include/asm/timex.h" 1




# 1 "./arch/x86/include/asm/tsc.h" 1
# 15 "./arch/x86/include/asm/tsc.h"
typedef unsigned long long cycles_t;

extern unsigned int cpu_khz;
extern unsigned int tsc_khz;

extern void disable_TSC(void);

static inline __attribute__((no_instrument_function)) cycles_t get_cycles(void)
{





 return rdtsc();
}

extern struct system_counterval_t convert_art_to_tsc(u64 art);

extern void tsc_init(void);
extern void mark_tsc_unstable(char *reason);
extern int unsynchronized_tsc(void);
extern int check_tsc_unstable(void);
extern unsigned long native_calibrate_cpu(void);
extern unsigned long native_calibrate_tsc(void);
extern unsigned long long native_sched_clock_from_tsc(u64 tsc);

extern int tsc_clocksource_reliable;






extern bool tsc_store_and_check_tsc_adjust(bool bootcpu);
extern void tsc_verify_tsc_adjust(bool resume);
extern void check_tsc_sync_source(int cpu);
extern void check_tsc_sync_target(void);







extern int notsc_setup(char *);
extern void tsc_save_sched_clock_state(void);
extern void tsc_restore_sched_clock_state(void);

unsigned long cpu_khz_from_msr(void);
# 6 "./arch/x86/include/asm/timex.h" 2
# 66 "./include/linux/timex.h" 2
# 139 "./include/linux/timex.h"
extern unsigned long tick_usec;
extern unsigned long tick_nsec;
# 154 "./include/linux/timex.h"
extern int do_adjtimex(struct timex *);
extern void hardpps(const struct timespec *, const struct timespec *);

int read_current_timer(unsigned long *timer_val);
void ntp_notify_cmos_timer(void);
# 9 "./include/linux/jiffies.h" 2
# 1 "./arch/x86/include/uapi/asm/param.h" 1
# 10 "./include/linux/jiffies.h" 2
# 1 "./include/generated/timeconst.h" 1
# 11 "./include/linux/jiffies.h" 2
# 58 "./include/linux/jiffies.h"
extern int register_refined_jiffies(long clock_tick_rate);
# 77 "./include/linux/jiffies.h"
extern u64 __attribute__((section(".data"))) jiffies_64;
extern unsigned long volatile __attribute__((section(".data"))) jiffies;




static inline __attribute__((no_instrument_function)) u64 get_jiffies_64(void)
{
 return (u64)jiffies;
}
# 187 "./include/linux/jiffies.h"
extern unsigned long preset_lpj;
# 288 "./include/linux/jiffies.h"
extern unsigned int jiffies_to_msecs(const unsigned long j);
extern unsigned int jiffies_to_usecs(const unsigned long j);

static inline __attribute__((no_instrument_function)) u64 jiffies_to_nsecs(const unsigned long j)
{
 return (u64)jiffies_to_usecs(j) * 1000L;
}

extern u64 jiffies64_to_nsecs(u64 j);

extern unsigned long __msecs_to_jiffies(const unsigned int m);






static inline __attribute__((no_instrument_function)) unsigned long _msecs_to_jiffies(const unsigned int m)
{
 return (m + (1000L / 1000) - 1) / (1000L / 1000);
}
# 360 "./include/linux/jiffies.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long msecs_to_jiffies(const unsigned int m)
{
 if (__builtin_constant_p(m)) {
  if ((int)m < 0)
   return ((((long)(~0UL>>1)) >> 1)-1);
  return _msecs_to_jiffies(m);
 } else {
  return __msecs_to_jiffies(m);
 }
}

extern unsigned long __usecs_to_jiffies(const unsigned int u);

static inline __attribute__((no_instrument_function)) unsigned long _usecs_to_jiffies(const unsigned int u)
{
 return (u + (1000000L / 1000) - 1) / (1000000L / 1000);
}
# 407 "./include/linux/jiffies.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long usecs_to_jiffies(const unsigned int u)
{
 if (__builtin_constant_p(u)) {
  if (u > jiffies_to_usecs(((((long)(~0UL>>1)) >> 1)-1)))
   return ((((long)(~0UL>>1)) >> 1)-1);
  return _usecs_to_jiffies(u);
 } else {
  return __usecs_to_jiffies(u);
 }
}

extern unsigned long timespec64_to_jiffies(const struct timespec *value);
extern void jiffies_to_timespec64(const unsigned long jiffies,
      struct timespec *value);
static inline __attribute__((no_instrument_function)) unsigned long timespec_to_jiffies(const struct timespec *value)
{
 struct timespec ts = timespec_to_timespec64(*value);

 return timespec64_to_jiffies(&ts);
}

static inline __attribute__((no_instrument_function)) void jiffies_to_timespec(const unsigned long jiffies,
           struct timespec *value)
{
 struct timespec ts;

 jiffies_to_timespec64(jiffies, &ts);
 *value = timespec64_to_timespec(ts);
}

extern unsigned long timeval_to_jiffies(const struct timeval *value);
extern void jiffies_to_timeval(const unsigned long jiffies,
          struct timeval *value);

extern clock_t jiffies_to_clock_t(unsigned long x);
static inline __attribute__((no_instrument_function)) clock_t jiffies_delta_to_clock_t(long delta)
{
 return jiffies_to_clock_t(({ typeof(0L) __UNIQUE_ID_max1_6 = (0L); typeof(delta) __UNIQUE_ID_max2_7 = (delta); (void) (&__UNIQUE_ID_max1_6 == &__UNIQUE_ID_max2_7); __UNIQUE_ID_max1_6 > __UNIQUE_ID_max2_7 ? __UNIQUE_ID_max1_6 : __UNIQUE_ID_max2_7; }));
}

extern unsigned long clock_t_to_jiffies(unsigned long x);
extern u64 jiffies_64_to_clock_t(u64 x);
extern u64 nsec_to_clock_t(u64 x);
extern u64 nsecs_to_jiffies64(u64 n);
extern unsigned long nsecs_to_jiffies(u64 n);
# 26 "./include/linux/ktime.h" 2


typedef s64 ktime_t;
# 37 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) ktime_t ktime_set(const s64 secs, const unsigned long nsecs)
{
 if (__builtin_expect(!!(secs >= (((s64)~((u64)1 << 63)) / 1000000000L)), 0))
  return ((s64)~((u64)1 << 63));

 return secs * 1000000000L + (s64)nsecs;
}
# 70 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) ktime_t timespec_to_ktime(struct timespec ts)
{
 return ktime_set(ts.tv_sec, ts.tv_nsec);
}


static inline __attribute__((no_instrument_function)) ktime_t timespec64_to_ktime(struct timespec ts)
{
 return ktime_set(ts.tv_sec, ts.tv_nsec);
}


static inline __attribute__((no_instrument_function)) ktime_t timeval_to_ktime(struct timeval tv)
{
 return ktime_set(tv.tv_sec, tv.tv_usec * 1000L);
}
# 109 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) int ktime_compare(const ktime_t cmp1, const ktime_t cmp2)
{
 if (cmp1 < cmp2)
  return -1;
 if (cmp1 > cmp2)
  return 1;
 return 0;
}
# 125 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) bool ktime_after(const ktime_t cmp1, const ktime_t cmp2)
{
 return ktime_compare(cmp1, cmp2) > 0;
}
# 137 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) bool ktime_before(const ktime_t cmp1, const ktime_t cmp2)
{
 return ktime_compare(cmp1, cmp2) < 0;
}
# 162 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) s64 ktime_divns(const ktime_t kt, s64 div)
{




 ({ int __ret_warn_on = !!(div < 0); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("./include/linux/ktime.h", 168); __builtin_expect(!!(__ret_warn_on), 0); });
 return kt / div;
}


static inline __attribute__((no_instrument_function)) s64 ktime_to_us(const ktime_t kt)
{
 return ktime_divns(kt, 1000L);
}

static inline __attribute__((no_instrument_function)) s64 ktime_to_ms(const ktime_t kt)
{
 return ktime_divns(kt, 1000000L);
}

static inline __attribute__((no_instrument_function)) s64 ktime_us_delta(const ktime_t later, const ktime_t earlier)
{
       return ktime_to_us(((later) - (earlier)));
}

static inline __attribute__((no_instrument_function)) s64 ktime_ms_delta(const ktime_t later, const ktime_t earlier)
{
 return ktime_to_ms(((later) - (earlier)));
}

static inline __attribute__((no_instrument_function)) ktime_t ktime_add_us(const ktime_t kt, const u64 usec)
{
 return ((kt) + (usec * 1000L));
}

static inline __attribute__((no_instrument_function)) ktime_t ktime_add_ms(const ktime_t kt, const u64 msec)
{
 return ((kt) + (msec * 1000000L));
}

static inline __attribute__((no_instrument_function)) ktime_t ktime_sub_us(const ktime_t kt, const u64 usec)
{
 return ((kt) - (usec * 1000L));
}

static inline __attribute__((no_instrument_function)) ktime_t ktime_sub_ms(const ktime_t kt, const u64 msec)
{
 return ((kt) - (msec * 1000000L));
}

extern ktime_t ktime_add_safe(const ktime_t lhs, const ktime_t rhs);
# 223 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool ktime_to_timespec_cond(const ktime_t kt,
             struct timespec *ts)
{
 if (kt) {
  *ts = ns_to_timespec((kt));
  return true;
 } else {
  return false;
 }
}
# 242 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool ktime_to_timespec64_cond(const ktime_t kt,
             struct timespec *ts)
{
 if (kt) {
  *ts = ns_to_timespec((kt));
  return true;
 } else {
  return false;
 }
}
# 262 "./include/linux/ktime.h"
static inline __attribute__((no_instrument_function)) ktime_t ns_to_ktime(u64 ns)
{
 return ns;
}

static inline __attribute__((no_instrument_function)) ktime_t ms_to_ktime(u64 ms)
{
 return ms * 1000000L;
}


# 1 "./include/linux/timekeeping.h" 1







void timekeeping_init(void);
extern int timekeeping_suspended;


extern void update_process_times(int user);
extern void xtime_update(unsigned long ticks);




extern void do_gettimeofday(struct timeval *tv);
extern int do_settimeofday64(const struct timespec *ts);
extern int do_sys_settimeofday64(const struct timespec *tv,
     const struct timezone *tz);
static inline __attribute__((no_instrument_function)) int do_sys_settimeofday(const struct timespec *tv,
          const struct timezone *tz)
{
 struct timespec ts64;

 if (!tv)
  return do_sys_settimeofday64(((void *)0), tz);

 if (!timespec_valid(tv))
  return -22;

 ts64 = timespec_to_timespec64(*tv);
 return do_sys_settimeofday64(&ts64, tz);
}




unsigned long get_seconds(void);
struct timespec current_kernel_time64(void);

struct timespec __current_kernel_time(void);

static inline __attribute__((no_instrument_function)) struct timespec current_kernel_time(void)
{
 struct timespec now = current_kernel_time64();

 return timespec64_to_timespec(now);
}




struct timespec get_monotonic_coarse64(void);
extern void getrawmonotonic64(struct timespec *ts);
extern void ktime_get_ts64(struct timespec *ts);
extern time64_t ktime_get_seconds(void);
extern time64_t ktime_get_real_seconds(void);

extern int __getnstimeofday64(struct timespec *tv);
extern void getnstimeofday64(struct timespec *tv);
extern void getboottime64(struct timespec *ts);





static inline __attribute__((no_instrument_function)) int do_settimeofday(const struct timespec *ts)
{
 return do_settimeofday64(ts);
}

static inline __attribute__((no_instrument_function)) int __getnstimeofday(struct timespec *ts)
{
 return __getnstimeofday64(ts);
}

static inline __attribute__((no_instrument_function)) void getnstimeofday(struct timespec *ts)
{
 getnstimeofday64(ts);
}

static inline __attribute__((no_instrument_function)) void ktime_get_ts(struct timespec *ts)
{
 ktime_get_ts64(ts);
}

static inline __attribute__((no_instrument_function)) void ktime_get_real_ts(struct timespec *ts)
{
 getnstimeofday64(ts);
}

static inline __attribute__((no_instrument_function)) void getrawmonotonic(struct timespec *ts)
{
 getrawmonotonic64(ts);
}

static inline __attribute__((no_instrument_function)) struct timespec get_monotonic_coarse(void)
{
 return get_monotonic_coarse64();
}

static inline __attribute__((no_instrument_function)) void getboottime(struct timespec *ts)
{
 return getboottime64(ts);
}
# 181 "./include/linux/timekeeping.h"
enum tk_offsets {
 TK_OFFS_REAL,
 TK_OFFS_BOOT,
 TK_OFFS_TAI,
 TK_OFFS_MAX,
};

extern ktime_t ktime_get(void);
extern ktime_t ktime_get_with_offset(enum tk_offsets offs);
extern ktime_t ktime_mono_to_any(ktime_t tmono, enum tk_offsets offs);
extern ktime_t ktime_get_raw(void);
extern u32 ktime_get_resolution_ns(void);




static inline __attribute__((no_instrument_function)) ktime_t ktime_get_real(void)
{
 return ktime_get_with_offset(TK_OFFS_REAL);
}







static inline __attribute__((no_instrument_function)) ktime_t ktime_get_boottime(void)
{
 return ktime_get_with_offset(TK_OFFS_BOOT);
}




static inline __attribute__((no_instrument_function)) ktime_t ktime_get_clocktai(void)
{
 return ktime_get_with_offset(TK_OFFS_TAI);
}




static inline __attribute__((no_instrument_function)) ktime_t ktime_mono_to_real(ktime_t mono)
{
 return ktime_mono_to_any(mono, TK_OFFS_REAL);
}

static inline __attribute__((no_instrument_function)) u64 ktime_get_ns(void)
{
 return (ktime_get());
}

static inline __attribute__((no_instrument_function)) u64 ktime_get_real_ns(void)
{
 return (ktime_get_real());
}

static inline __attribute__((no_instrument_function)) u64 ktime_get_boot_ns(void)
{
 return (ktime_get_boottime());
}

static inline __attribute__((no_instrument_function)) u64 ktime_get_tai_ns(void)
{
 return (ktime_get_clocktai());
}

static inline __attribute__((no_instrument_function)) u64 ktime_get_raw_ns(void)
{
 return (ktime_get_raw());
}

extern u64 ktime_get_mono_fast_ns(void);
extern u64 ktime_get_raw_fast_ns(void);
extern u64 ktime_get_boot_fast_ns(void);




static inline __attribute__((no_instrument_function)) void get_monotonic_boottime(struct timespec *ts)
{
 *ts = ns_to_timespec((ktime_get_boottime()));
}

static inline __attribute__((no_instrument_function)) void get_monotonic_boottime64(struct timespec *ts)
{
 *ts = ns_to_timespec((ktime_get_boottime()));
}

static inline __attribute__((no_instrument_function)) void timekeeping_clocktai(struct timespec *ts)
{
 *ts = ns_to_timespec((ktime_get_clocktai()));
}




extern bool timekeeping_rtc_skipsuspend(void);
extern bool timekeeping_rtc_skipresume(void);

extern void timekeeping_inject_sleeptime64(struct timespec *delta);




extern void ktime_get_raw_and_real_ts64(struct timespec *ts_raw,
            struct timespec *ts_real);
# 299 "./include/linux/timekeeping.h"
struct system_time_snapshot {
 u64 cycles;
 ktime_t real;
 ktime_t raw;
 unsigned int clock_was_set_seq;
 u8 cs_was_changed_seq;
};
# 314 "./include/linux/timekeeping.h"
struct system_device_crosststamp {
 ktime_t device;
 ktime_t sys_realtime;
 ktime_t sys_monoraw;
};
# 327 "./include/linux/timekeeping.h"
struct system_counterval_t {
 u64 cycles;
 struct clocksource *cs;
};




extern int get_device_system_crosststamp(
   int (*get_time_fn)(ktime_t *device_time,
    struct system_counterval_t *system_counterval,
    void *ctx),
   void *ctx,
   struct system_time_snapshot *history,
   struct system_device_crosststamp *xtstamp);




extern void ktime_get_snapshot(struct system_time_snapshot *systime_snapshot);




extern int persistent_clock_is_local;

extern void read_persistent_clock(struct timespec *ts);
extern void read_persistent_clock64(struct timespec *ts);
extern void read_boot_clock64(struct timespec *ts);
extern int update_persistent_clock(struct timespec now);
extern int update_persistent_clock64(struct timespec now);
# 273 "./include/linux/ktime.h" 2
# 47 "./include/linux/rcupdate.h" 2





extern int rcu_expedited;
extern int rcu_normal;
# 75 "./include/linux/rcupdate.h"
bool rcu_gp_is_normal(void);
bool rcu_gp_is_expedited(void);
void rcu_expedite_gp(void);
void rcu_unexpedite_gp(void);


enum rcutorture_type {
 RCU_FLAVOR,
 RCU_BH_FLAVOR,
 RCU_SCHED_FLAVOR,
 RCU_TASKS_FLAVOR,
 SRCU_FLAVOR,
 INVALID_RCU_FLAVOR
};


void rcutorture_get_gp_data(enum rcutorture_type test_type, int *flags,
       unsigned long *gpnum, unsigned long *completed);
void rcutorture_record_test_transition(void);
void rcutorture_record_progress(unsigned long vernum);
void do_trace_rcu_torture_read(const char *rcutorturename,
          struct callback_head *rhp,
          unsigned long secs,
          unsigned long c_old,
          unsigned long c);
# 201 "./include/linux/rcupdate.h"
void call_rcu_bh(struct callback_head *head,
   rcu_callback_t func);
# 223 "./include/linux/rcupdate.h"
void call_rcu_sched(struct callback_head *head,
      rcu_callback_t func);

void synchronize_sched(void);
# 246 "./include/linux/rcupdate.h"
void call_rcu_tasks(struct callback_head *head, rcu_callback_t func);
void synchronize_rcu_tasks(void);
void rcu_barrier_tasks(void);
# 267 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) void __rcu_read_lock(void)
{
 if (0)
  __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void __rcu_read_unlock(void)
{
 if (0)
  __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void synchronize_rcu(void)
{
 synchronize_sched();
}

static inline __attribute__((no_instrument_function)) int rcu_preempt_depth(void)
{
 return 0;
}




void rcu_init(void);
void rcu_sched_qs(void);
void rcu_bh_qs(void);
void rcu_check_callbacks(int user);
void rcu_report_dead(unsigned int cpu);
void rcu_cpu_starting(unsigned int cpu);


void rcu_end_inkernel_boot(void);





void rcu_sysrq_start(void);
void rcu_sysrq_end(void);
# 321 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) void rcu_user_enter(void) { }
static inline __attribute__((no_instrument_function)) void rcu_user_exit(void) { }





static inline __attribute__((no_instrument_function)) void rcu_init_nohz(void)
{
}
# 391 "./include/linux/rcupdate.h"
bool __rcu_is_watching(void);
# 400 "./include/linux/rcupdate.h"
# 1 "./include/linux/rcutree.h" 1
# 33 "./include/linux/rcutree.h"
void rcu_note_context_switch(void);
int rcu_needs_cpu(u64 basem, u64 *nextevt);
void rcu_cpu_stall_reset(void);






static inline __attribute__((no_instrument_function)) void rcu_virt_note_context_switch(int cpu)
{
 rcu_note_context_switch();
}

void synchronize_rcu_bh(void);
void synchronize_sched_expedited(void);
void synchronize_rcu_expedited(void);

void kfree_call_rcu(struct callback_head *head, rcu_callback_t func);
# 69 "./include/linux/rcutree.h"
static inline __attribute__((no_instrument_function)) void synchronize_rcu_bh_expedited(void)
{
 synchronize_sched_expedited();
}

void rcu_barrier(void);
void rcu_barrier_bh(void);
void rcu_barrier_sched(void);
unsigned long get_state_synchronize_rcu(void);
void cond_synchronize_rcu(unsigned long oldstate);
unsigned long get_state_synchronize_sched(void);
void cond_synchronize_sched(unsigned long oldstate);

extern unsigned long rcutorture_testseq;
extern unsigned long rcutorture_vernum;
unsigned long rcu_batches_started(void);
unsigned long rcu_batches_started_bh(void);
unsigned long rcu_batches_started_sched(void);
unsigned long rcu_batches_completed(void);
unsigned long rcu_batches_completed_bh(void);
unsigned long rcu_batches_completed_sched(void);
unsigned long rcu_exp_batches_completed(void);
unsigned long rcu_exp_batches_completed_sched(void);
void show_rcu_gp_kthreads(void);

void rcu_force_quiescent_state(void);
void rcu_bh_force_quiescent_state(void);
void rcu_sched_force_quiescent_state(void);

void rcu_idle_enter(void);
void rcu_idle_exit(void);
void rcu_irq_enter(void);
void rcu_irq_exit(void);
void rcu_irq_enter_irqson(void);
void rcu_irq_exit_irqson(void);

void exit_rcu(void);

void rcu_scheduler_starting(void);
extern int rcu_scheduler_active __attribute__((__section__(".data..read_mostly")));

bool rcu_is_watching(void);

void rcu_all_qs(void);


int rcutree_prepare_cpu(unsigned int cpu);
int rcutree_online_cpu(unsigned int cpu);
int rcutree_offline_cpu(unsigned int cpu);
int rcutree_dead_cpu(unsigned int cpu);
int rcutree_dying_cpu(unsigned int cpu);
# 401 "./include/linux/rcupdate.h" 2
# 423 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) void init_rcu_head(struct callback_head *head)
{
}

static inline __attribute__((no_instrument_function)) void destroy_rcu_head(struct callback_head *head)
{
}

static inline __attribute__((no_instrument_function)) void init_rcu_head_on_stack(struct callback_head *head)
{
}

static inline __attribute__((no_instrument_function)) void destroy_rcu_head_on_stack(struct callback_head *head)
{
}





static inline __attribute__((no_instrument_function)) bool rcu_lockdep_current_cpu_online(void)
{
 return true;
}
# 485 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) int rcu_read_lock_held(void)
{
 return 1;
}

static inline __attribute__((no_instrument_function)) int rcu_read_lock_bh_held(void)
{
 return 1;
}

static inline __attribute__((no_instrument_function)) int rcu_read_lock_sched_held(void)
{
 return !0;
}
# 831 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) void rcu_read_lock(void)
{
 __rcu_read_lock();
 (void)0;
 do { } while (0);
 do { } while (0);

}
# 885 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) void rcu_read_unlock(void)
{
 do { } while (0);

 (void)0;
 __rcu_read_unlock();
 do { } while (0);
}
# 911 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) void rcu_read_lock_bh(void)
{
 local_bh_disable();
 (void)0;
 do { } while (0);
 do { } while (0);

}






static inline __attribute__((no_instrument_function)) void rcu_read_unlock_bh(void)
{
 do { } while (0);

 do { } while (0);
 (void)0;
 local_bh_enable();
}
# 947 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) void rcu_read_lock_sched(void)
{
 __asm__ __volatile__("": : :"memory");
 (void)0;
 do { } while (0);
 do { } while (0);

}


static inline __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) void rcu_read_lock_sched_notrace(void)
{
 __asm__ __volatile__("": : :"memory");
 (void)0;
}






static inline __attribute__((no_instrument_function)) void rcu_read_unlock_sched(void)
{
 do { } while (0);

 do { } while (0);
 (void)0;
 __asm__ __volatile__("": : :"memory");
}


static inline __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) void rcu_read_unlock_sched_notrace(void)
{
 (void)0;
 __asm__ __volatile__("": : :"memory");
}
# 1090 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) bool rcu_is_nocb_cpu(int cpu) { return false; }
# 1100 "./include/linux/rcupdate.h"
static inline __attribute__((no_instrument_function)) bool rcu_sys_is_idle(void)
{
 return false;
}

static inline __attribute__((no_instrument_function)) void rcu_sysidle_force_exit(void)
{
}
# 34 "./include/linux/srcu.h" 2
# 1 "./include/linux/workqueue.h" 1







# 1 "./include/linux/timer.h" 1
# 10 "./include/linux/timer.h"
struct tvec_base;

struct timer_list {




 struct hlist_node entry;
 unsigned long expires;
 void (*function)(unsigned long);
 unsigned long data;
 u32 flags;




};
# 92 "./include/linux/timer.h"
void init_timer_key(struct timer_list *timer, unsigned int flags,
      const char *name, struct lock_class_key *key);







static inline __attribute__((no_instrument_function)) void destroy_timer_on_stack(struct timer_list *timer) { }
static inline __attribute__((no_instrument_function)) void init_timer_on_stack_key(struct timer_list *timer,
        unsigned int flags, const char *name,
        struct lock_class_key *key)
{
 init_timer_key(timer, flags, name, key);
}
# 181 "./include/linux/timer.h"
static inline __attribute__((no_instrument_function)) int timer_pending(const struct timer_list * timer)
{
 return timer->entry.pprev != ((void *)0);
}

extern void add_timer_on(struct timer_list *timer, int cpu);
extern int del_timer(struct timer_list * timer);
extern int mod_timer(struct timer_list *timer, unsigned long expires);
extern int mod_timer_pending(struct timer_list *timer, unsigned long expires);







extern void add_timer(struct timer_list *timer);

extern int try_to_del_timer_sync(struct timer_list *timer);


  extern int del_timer_sync(struct timer_list *timer);






extern void init_timers(void);
extern void run_local_timers(void);
struct hrtimer;
extern enum hrtimer_restart it_real_fn(struct hrtimer *);


struct ctl_table;

extern unsigned int sysctl_timer_migration;
int timer_migration_handler(struct ctl_table *table, int write,
       void *buffer, size_t *lenp,
       loff_t *ppos);


unsigned long __round_jiffies(unsigned long j, int cpu);
unsigned long __round_jiffies_relative(unsigned long j, int cpu);
unsigned long round_jiffies(unsigned long j);
unsigned long round_jiffies_relative(unsigned long j);

unsigned long __round_jiffies_up(unsigned long j, int cpu);
unsigned long __round_jiffies_up_relative(unsigned long j, int cpu);
unsigned long round_jiffies_up(unsigned long j);
unsigned long round_jiffies_up_relative(unsigned long j);


int timers_dead_cpu(unsigned int cpu);
# 9 "./include/linux/workqueue.h" 2







struct workqueue_struct;

struct work_struct;
typedef void (*work_func_t)(struct work_struct *work);
void delayed_work_timer_fn(unsigned long __data);







enum {
 WORK_STRUCT_PENDING_BIT = 0,
 WORK_STRUCT_DELAYED_BIT = 1,
 WORK_STRUCT_PWQ_BIT = 2,
 WORK_STRUCT_LINKED_BIT = 3,




 WORK_STRUCT_COLOR_SHIFT = 4,


 WORK_STRUCT_COLOR_BITS = 4,

 WORK_STRUCT_PENDING = 1 << WORK_STRUCT_PENDING_BIT,
 WORK_STRUCT_DELAYED = 1 << WORK_STRUCT_DELAYED_BIT,
 WORK_STRUCT_PWQ = 1 << WORK_STRUCT_PWQ_BIT,
 WORK_STRUCT_LINKED = 1 << WORK_STRUCT_LINKED_BIT,



 WORK_STRUCT_STATIC = 0,






 WORK_NR_COLORS = (1 << WORK_STRUCT_COLOR_BITS) - 1,
 WORK_NO_COLOR = WORK_NR_COLORS,


 WORK_CPU_UNBOUND = 64,






 WORK_STRUCT_FLAG_BITS = WORK_STRUCT_COLOR_SHIFT +
      WORK_STRUCT_COLOR_BITS,


 WORK_OFFQ_FLAG_BASE = WORK_STRUCT_COLOR_SHIFT,

 __WORK_OFFQ_CANCELING = WORK_OFFQ_FLAG_BASE,
 WORK_OFFQ_CANCELING = (1 << __WORK_OFFQ_CANCELING),






 WORK_OFFQ_FLAG_BITS = 1,
 WORK_OFFQ_POOL_SHIFT = WORK_OFFQ_FLAG_BASE + WORK_OFFQ_FLAG_BITS,
 WORK_OFFQ_LEFT = 64 - WORK_OFFQ_POOL_SHIFT,
 WORK_OFFQ_POOL_BITS = WORK_OFFQ_LEFT <= 31 ? WORK_OFFQ_LEFT : 31,
 WORK_OFFQ_POOL_NONE = (1LU << WORK_OFFQ_POOL_BITS) - 1,


 WORK_STRUCT_FLAG_MASK = (1UL << WORK_STRUCT_FLAG_BITS) - 1,
 WORK_STRUCT_WQ_DATA_MASK = ~WORK_STRUCT_FLAG_MASK,
 WORK_STRUCT_NO_POOL = (unsigned long)WORK_OFFQ_POOL_NONE << WORK_OFFQ_POOL_SHIFT,


 WORK_BUSY_PENDING = 1 << 0,
 WORK_BUSY_RUNNING = 1 << 1,


 WORKER_DESC_LEN = 24,
};

struct work_struct {
 atomic_long_t data;
 struct list_head entry;
 work_func_t func;



};





struct delayed_work {
 struct work_struct work;
 struct timer_list timer;


 struct workqueue_struct *wq;
 int cpu;
};






struct workqueue_attrs {



 int nice;




 cpumask_var_t cpumask;
# 145 "./include/linux/workqueue.h"
 bool no_numa;
};

static inline __attribute__((no_instrument_function)) struct delayed_work *to_delayed_work(struct work_struct *work)
{
 return ({ const typeof( ((struct delayed_work *)0)->work ) *__mptr = (work); (struct delayed_work *)( (char *)__mptr - __builtin_offsetof(struct delayed_work, work) );});
}

struct execute_work {
 struct work_struct work;
};
# 201 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) void __init_work(struct work_struct *work, int onstack) { }
static inline __attribute__((no_instrument_function)) void destroy_work_on_stack(struct work_struct *work) { }
static inline __attribute__((no_instrument_function)) void destroy_delayed_work_on_stack(struct delayed_work *work) { }
static inline __attribute__((no_instrument_function)) unsigned int work_static(struct work_struct *work) { return 0; }
# 289 "./include/linux/workqueue.h"
enum {
 WQ_UNBOUND = 1 << 1,
 WQ_FREEZABLE = 1 << 2,
 WQ_MEM_RECLAIM = 1 << 3,
 WQ_HIGHPRI = 1 << 4,
 WQ_CPU_INTENSIVE = 1 << 5,
 WQ_SYSFS = 1 << 6,
# 322 "./include/linux/workqueue.h"
 WQ_POWER_EFFICIENT = 1 << 7,

 __WQ_DRAINING = 1 << 16,
 __WQ_ORDERED = 1 << 17,
 __WQ_LEGACY = 1 << 18,

 WQ_MAX_ACTIVE = 512,
 WQ_MAX_UNBOUND_PER_CPU = 4,
 WQ_DFL_ACTIVE = WQ_MAX_ACTIVE / 2,
};
# 365 "./include/linux/workqueue.h"
extern struct workqueue_struct *system_wq;
extern struct workqueue_struct *system_highpri_wq;
extern struct workqueue_struct *system_long_wq;
extern struct workqueue_struct *system_unbound_wq;
extern struct workqueue_struct *system_freezable_wq;
extern struct workqueue_struct *system_power_efficient_wq;
extern struct workqueue_struct *system_freezable_power_efficient_wq;

extern struct workqueue_struct *
__alloc_workqueue_key(const char *fmt, unsigned int flags, int max_active,
 struct lock_class_key *key, const char *lock_name, ...) __attribute__((format(printf, 1, 6)));
# 435 "./include/linux/workqueue.h"
extern void destroy_workqueue(struct workqueue_struct *wq);

struct workqueue_attrs *alloc_workqueue_attrs(gfp_t gfp_mask);
void free_workqueue_attrs(struct workqueue_attrs *attrs);
int apply_workqueue_attrs(struct workqueue_struct *wq,
     const struct workqueue_attrs *attrs);
int workqueue_set_unbound_cpumask(cpumask_var_t cpumask);

extern bool queue_work_on(int cpu, struct workqueue_struct *wq,
   struct work_struct *work);
extern bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
   struct delayed_work *work, unsigned long delay);
extern bool mod_delayed_work_on(int cpu, struct workqueue_struct *wq,
   struct delayed_work *dwork, unsigned long delay);

extern void flush_workqueue(struct workqueue_struct *wq);
extern void drain_workqueue(struct workqueue_struct *wq);

extern int schedule_on_each_cpu(work_func_t func);

int execute_in_process_context(work_func_t fn, struct execute_work *);

extern bool flush_work(struct work_struct *work);
extern bool cancel_work(struct work_struct *work);
extern bool cancel_work_sync(struct work_struct *work);

extern bool flush_delayed_work(struct delayed_work *dwork);
extern bool cancel_delayed_work(struct delayed_work *dwork);
extern bool cancel_delayed_work_sync(struct delayed_work *dwork);

extern void workqueue_set_max_active(struct workqueue_struct *wq,
         int max_active);
extern bool current_is_workqueue_rescuer(void);
extern bool workqueue_congested(int cpu, struct workqueue_struct *wq);
extern unsigned int work_busy(struct work_struct *work);
extern __attribute__((format(printf, 1, 2))) void set_worker_desc(const char *fmt, ...);
extern void print_worker_info(const char *log_lvl, struct task_struct *task);
extern void show_workqueue_state(void);
# 484 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) bool queue_work(struct workqueue_struct *wq,
         struct work_struct *work)
{
 return queue_work_on(WORK_CPU_UNBOUND, wq, work);
}
# 498 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) bool queue_delayed_work(struct workqueue_struct *wq,
          struct delayed_work *dwork,
          unsigned long delay)
{
 return queue_delayed_work_on(WORK_CPU_UNBOUND, wq, dwork, delay);
}
# 513 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) bool mod_delayed_work(struct workqueue_struct *wq,
        struct delayed_work *dwork,
        unsigned long delay)
{
 return mod_delayed_work_on(WORK_CPU_UNBOUND, wq, dwork, delay);
}
# 527 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) bool schedule_work_on(int cpu, struct work_struct *work)
{
 return queue_work_on(cpu, system_wq, work);
}
# 543 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) bool schedule_work(struct work_struct *work)
{
 return queue_work(system_wq, work);
}
# 572 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) void flush_scheduled_work(void)
{
 flush_workqueue(system_wq);
}
# 586 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) bool schedule_delayed_work_on(int cpu, struct delayed_work *dwork,
         unsigned long delay)
{
 return queue_delayed_work_on(cpu, system_wq, dwork, delay);
}
# 600 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) bool schedule_delayed_work(struct delayed_work *dwork,
      unsigned long delay)
{
 return queue_delayed_work(system_wq, dwork, delay);
}







long work_on_cpu(int cpu, long (*fn)(void *), void *arg);



extern void freeze_workqueues_begin(void);
extern bool freeze_workqueues_busy(void);
extern void thaw_workqueues(void);



int workqueue_sysfs_register(struct workqueue_struct *wq);
# 631 "./include/linux/workqueue.h"
static inline __attribute__((no_instrument_function)) void wq_watchdog_touch(int cpu) { }



int workqueue_prepare_cpu(unsigned int cpu);
int workqueue_online_cpu(unsigned int cpu);
int workqueue_offline_cpu(unsigned int cpu);


int __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) workqueue_init_early(void);
int __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) workqueue_init(void);
# 35 "./include/linux/srcu.h" 2

struct srcu_array {
 unsigned long lock_count[2];
 unsigned long unlock_count[2];
};

struct rcu_batch {
 struct callback_head *head, **tail;
};



struct srcu_struct {
 unsigned long completed;
 struct srcu_array *per_cpu_ref;
 spinlock_t queue_lock;
 bool running;

 struct rcu_batch batch_queue;

 struct rcu_batch batch_check0;

 struct rcu_batch batch_check1;
 struct rcu_batch batch_done;
 struct delayed_work work;



};
# 80 "./include/linux/srcu.h"
int init_srcu_struct(struct srcu_struct *sp);




void process_srcu(struct work_struct *work);
# 143 "./include/linux/srcu.h"
void call_srcu(struct srcu_struct *sp, struct callback_head *head,
  void (*func)(struct callback_head *head));

void cleanup_srcu_struct(struct srcu_struct *sp);
int __srcu_read_lock(struct srcu_struct *sp) ;
void __srcu_read_unlock(struct srcu_struct *sp, int idx) ;
void synchronize_srcu(struct srcu_struct *sp);
void synchronize_srcu_expedited(struct srcu_struct *sp);
unsigned long srcu_batches_completed(struct srcu_struct *sp);
void srcu_barrier(struct srcu_struct *sp);
# 180 "./include/linux/srcu.h"
static inline __attribute__((no_instrument_function)) int srcu_read_lock_held(struct srcu_struct *sp)
{
 return 1;
}
# 231 "./include/linux/srcu.h"
static inline __attribute__((no_instrument_function)) int srcu_read_lock(struct srcu_struct *sp)
{
 int retval;

 __asm__ __volatile__("": : :"memory");
 retval = __srcu_read_lock(sp);
 __asm__ __volatile__("": : :"memory");
 do { } while (0);
 return retval;
}
# 249 "./include/linux/srcu.h"
static inline __attribute__((no_instrument_function)) void srcu_read_unlock(struct srcu_struct *sp, int idx)

{
 do { } while (0);
 __srcu_read_unlock(sp, idx);
}
# 265 "./include/linux/srcu.h"
static inline __attribute__((no_instrument_function)) void smp_mb__after_srcu_read_unlock(void)
{

}
# 16 "./include/linux/notifier.h" 2
# 50 "./include/linux/notifier.h"
struct notifier_block;

typedef int (*notifier_fn_t)(struct notifier_block *nb,
   unsigned long action, void *data);

struct notifier_block {
 notifier_fn_t notifier_call;
 struct notifier_block *next;
 int priority;
};

struct atomic_notifier_head {
 spinlock_t lock;
 struct notifier_block *head;
};

struct blocking_notifier_head {
 struct rw_semaphore rwsem;
 struct notifier_block *head;
};

struct raw_notifier_head {
 struct notifier_block *head;
};

struct srcu_notifier_head {
 struct mutex mutex;
 struct srcu_struct srcu;
 struct notifier_block *head;
};
# 94 "./include/linux/notifier.h"
extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
# 120 "./include/linux/notifier.h"
extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
  struct notifier_block *nb);
extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
  struct notifier_block *nb);
extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
  struct notifier_block *nb);
extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
  struct notifier_block *nb);

extern int blocking_notifier_chain_cond_register(
  struct blocking_notifier_head *nh,
  struct notifier_block *nb);

extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
  struct notifier_block *nb);
extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
  struct notifier_block *nb);
extern int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
  struct notifier_block *nb);
extern int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
  struct notifier_block *nb);

extern int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
  unsigned long val, void *v);
extern int __atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
  unsigned long val, void *v);
extern int __blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int raw_notifier_call_chain(struct raw_notifier_head *nh,
  unsigned long val, void *v);
extern int __raw_notifier_call_chain(struct raw_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
  unsigned long val, void *v);
extern int __srcu_notifier_call_chain(struct srcu_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
# 170 "./include/linux/notifier.h"
static inline __attribute__((no_instrument_function)) int notifier_from_errno(int err)
{
 if (err)
  return 0x8000 | (0x0001 - err);

 return 0x0001;
}


static inline __attribute__((no_instrument_function)) int notifier_to_errno(int ret)
{
 ret &= ~0x8000;
 return ret > 0x0001 ? 0x0001 - ret : 0;
}
# 214 "./include/linux/notifier.h"
extern struct blocking_notifier_head reboot_notifier_list;
# 7 "./include/linux/memory_hotplug.h" 2


struct page;
struct zone;
struct pglist_data;
struct mem_section;
struct memory_block;
struct resource;
# 209 "./include/linux/memory_hotplug.h"
static inline __attribute__((no_instrument_function)) void pgdat_resize_lock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((no_instrument_function)) void pgdat_resize_unlock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((no_instrument_function)) void pgdat_resize_init(struct pglist_data *pgdat) {}

static inline __attribute__((no_instrument_function)) unsigned zone_span_seqbegin(struct zone *zone)
{
 return 0;
}
static inline __attribute__((no_instrument_function)) int zone_span_seqretry(struct zone *zone, unsigned iv)
{
 return 0;
}
static inline __attribute__((no_instrument_function)) void zone_span_writelock(struct zone *zone) {}
static inline __attribute__((no_instrument_function)) void zone_span_writeunlock(struct zone *zone) {}
static inline __attribute__((no_instrument_function)) void zone_seqlock_init(struct zone *zone) {}

static inline __attribute__((no_instrument_function)) int mhp_notimplemented(const char *func)
{
 printk("\001" "4" "%s() called, with CONFIG_MEMORY_HOTPLUG disabled\n", func);
 dump_stack();
 return -38;
}

static inline __attribute__((no_instrument_function)) void register_page_bootmem_info_node(struct pglist_data *pgdat)
{
}

static inline __attribute__((no_instrument_function)) int try_online_node(int nid)
{
 return 0;
}

static inline __attribute__((no_instrument_function)) void get_online_mems(void) {}
static inline __attribute__((no_instrument_function)) void put_online_mems(void) {}

static inline __attribute__((no_instrument_function)) void mem_hotplug_begin(void) {}
static inline __attribute__((no_instrument_function)) void mem_hotplug_done(void) {}
# 257 "./include/linux/memory_hotplug.h"
static inline __attribute__((no_instrument_function)) bool is_mem_section_removable(unsigned long pfn,
     unsigned long nr_pages)
{
 return false;
}

static inline __attribute__((no_instrument_function)) void try_offline_node(int nid) {}

static inline __attribute__((no_instrument_function)) int offline_pages(unsigned long start_pfn, unsigned long nr_pages)
{
 return -22;
}

static inline __attribute__((no_instrument_function)) void remove_memory(int nid, u64 start, u64 size) {}


extern int walk_memory_range(unsigned long start_pfn, unsigned long end_pfn,
  void *arg, int (*func)(struct memory_block *, void *));
extern int add_memory(int nid, u64 start, u64 size);
extern int add_memory_resource(int nid, struct resource *resource, bool online);
extern int zone_for_memory(int nid, u64 start, u64 size, int zone_default,
  bool for_device);
extern int arch_add_memory(int nid, u64 start, u64 size, bool for_device);
extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages);
extern bool is_memblock_offlined(struct memory_block *mem);
extern void remove_memory(int nid, u64 start, u64 size);
extern int sparse_add_one_section(struct zone *zone, unsigned long start_pfn);
extern void sparse_remove_one_section(struct zone *zone, struct mem_section *ms,
  unsigned long map_offset);
extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
       unsigned long pnum);
extern bool zone_can_shift(unsigned long pfn, unsigned long nr_pages,
     enum zone_type target, int *zone_shift);
# 750 "./include/linux/mmzone.h" 2

extern struct mutex zonelists_mutex;
void build_all_zonelists(pg_data_t *pgdat, struct zone *zone);
void wakeup_kswapd(struct zone *zone, int order, enum zone_type classzone_idx);
bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
    int classzone_idx, unsigned int alloc_flags,
    long free_pages);
bool zone_watermark_ok(struct zone *z, unsigned int order,
  unsigned long mark, int classzone_idx,
  unsigned int alloc_flags);
bool zone_watermark_ok_safe(struct zone *z, unsigned int order,
  unsigned long mark, int classzone_idx);
enum memmap_context {
 MEMMAP_EARLY,
 MEMMAP_HOTPLUG,
};
extern int init_currently_empty_zone(struct zone *zone, unsigned long start_pfn,
         unsigned long size);

extern void lruvec_init(struct lruvec *lruvec);

static inline __attribute__((no_instrument_function)) struct pglist_data *lruvec_pgdat(struct lruvec *lruvec)
{



 return ({ const typeof( ((struct pglist_data *)0)->lruvec ) *__mptr = (lruvec); (struct pglist_data *)( (char *)__mptr - __builtin_offsetof(struct pglist_data, lruvec) );});

}

extern unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone_idx);


void memory_present(int nid, unsigned long start, unsigned long end);







static inline __attribute__((no_instrument_function)) int local_memory_node(int node_id) { return node_id; };
# 809 "./include/linux/mmzone.h"
static inline __attribute__((no_instrument_function)) bool managed_zone(struct zone *zone)
{
 return zone->managed_pages;
}


static inline __attribute__((no_instrument_function)) bool populated_zone(struct zone *zone)
{
 return zone->present_pages;
}

extern int movable_zone;
# 833 "./include/linux/mmzone.h"
static inline __attribute__((no_instrument_function)) int is_highmem_idx(enum zone_type idx)
{




 return 0;

}







static inline __attribute__((no_instrument_function)) int is_highmem(struct zone *zone)
{



 return 0;

}


struct ctl_table;
int min_free_kbytes_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int watermark_scale_factor_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int sysctl_lowmem_reserve_ratio[4 -1];
int lowmem_reserve_ratio_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int percpu_pagelist_fraction_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int sysctl_min_unmapped_ratio_sysctl_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);
int sysctl_min_slab_ratio_sysctl_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);

extern int numa_zonelist_order_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);
extern char numa_zonelist_order[];
# 887 "./include/linux/mmzone.h"
# 1 "./arch/x86/include/asm/mmzone.h" 1



# 1 "./arch/x86/include/asm/mmzone_64.h" 1
# 10 "./arch/x86/include/asm/mmzone_64.h"
# 1 "./arch/x86/include/asm/smp.h" 1
# 11 "./arch/x86/include/asm/smp.h"
# 1 "./arch/x86/include/asm/mpspec.h" 1




# 1 "./arch/x86/include/asm/mpspec_def.h" 1
# 21 "./arch/x86/include/asm/mpspec_def.h"
struct mpf_intel {
 char signature[4];
 unsigned int physptr;
 unsigned char length;
 unsigned char specification;
 unsigned char checksum;
 unsigned char feature1;
 unsigned char feature2;
 unsigned char feature3;
 unsigned char feature4;
 unsigned char feature5;
};



struct mpc_table {
 char signature[4];
 unsigned short length;
 char spec;
 char checksum;
 char oem[8];
 char productid[12];
 unsigned int oemptr;
 unsigned short oemsize;
 unsigned short oemcount;
 unsigned int lapic;
 unsigned int reserved;
};
# 67 "./arch/x86/include/asm/mpspec_def.h"
struct mpc_cpu {
 unsigned char type;
 unsigned char apicid;
 unsigned char apicver;
 unsigned char cpuflag;
 unsigned int cpufeature;
 unsigned int featureflag;
 unsigned int reserved[2];
};

struct mpc_bus {
 unsigned char type;
 unsigned char busid;
 unsigned char bustype[6];
};
# 105 "./arch/x86/include/asm/mpspec_def.h"
struct mpc_ioapic {
 unsigned char type;
 unsigned char apicid;
 unsigned char apicver;
 unsigned char flags;
 unsigned int apicaddr;
};

struct mpc_intsrc {
 unsigned char type;
 unsigned char irqtype;
 unsigned short irqflag;
 unsigned char srcbus;
 unsigned char srcbusirq;
 unsigned char dstapic;
 unsigned char dstirq;
};

enum mp_irq_source_types {
 mp_INT = 0,
 mp_NMI = 1,
 mp_SMI = 2,
 mp_ExtINT = 3
};







struct mpc_lintsrc {
 unsigned char type;
 unsigned char irqtype;
 unsigned short irqflag;
 unsigned char srcbusid;
 unsigned char srcbusirq;
 unsigned char destapic;
 unsigned char destapiclint;
};



struct mpc_oemtable {
 char signature[4];
 unsigned short length;
 char rev;
 char checksum;
 char mpc[8];
};
# 168 "./arch/x86/include/asm/mpspec_def.h"
enum mp_bustype {
 MP_BUS_ISA = 1,
 MP_BUS_EISA,
 MP_BUS_PCI,
};
# 6 "./arch/x86/include/asm/mpspec.h" 2
# 1 "./arch/x86/include/asm/x86_init.h" 1



# 1 "./arch/x86/include/uapi/asm/bootparam.h" 1
# 34 "./arch/x86/include/uapi/asm/bootparam.h"
# 1 "./include/linux/screen_info.h" 1



# 1 "./include/uapi/linux/screen_info.h" 1
# 10 "./include/uapi/linux/screen_info.h"
struct screen_info {
 __u8 orig_x;
 __u8 orig_y;
 __u16 ext_mem_k;
 __u16 orig_video_page;
 __u8 orig_video_mode;
 __u8 orig_video_cols;
 __u8 flags;
 __u8 unused2;
 __u16 orig_video_ega_bx;
 __u16 unused3;
 __u8 orig_video_lines;
 __u8 orig_video_isVGA;
 __u16 orig_video_points;


 __u16 lfb_width;
 __u16 lfb_height;
 __u16 lfb_depth;
 __u32 lfb_base;
 __u32 lfb_size;
 __u16 cl_magic, cl_offset;
 __u16 lfb_linelength;
 __u8 red_size;
 __u8 red_pos;
 __u8 green_size;
 __u8 green_pos;
 __u8 blue_size;
 __u8 blue_pos;
 __u8 rsvd_size;
 __u8 rsvd_pos;
 __u16 vesapm_seg;
 __u16 vesapm_off;
 __u16 pages;
 __u16 vesa_attributes;
 __u32 capabilities;
 __u32 ext_lfb_base;
 __u8 _reserved[2];
} __attribute__((packed));
# 5 "./include/linux/screen_info.h" 2

extern struct screen_info screen_info;
# 35 "./arch/x86/include/uapi/asm/bootparam.h" 2
# 1 "./include/linux/apm_bios.h" 1
# 18 "./include/linux/apm_bios.h"
# 1 "./include/uapi/linux/apm_bios.h" 1
# 21 "./include/uapi/linux/apm_bios.h"
typedef unsigned short apm_event_t;
typedef unsigned short apm_eventinfo_t;

struct apm_bios_info {
 __u16 version;
 __u16 cseg;
 __u32 offset;
 __u16 cseg_16;
 __u16 dseg;
 __u16 flags;
 __u16 cseg_len;
 __u16 cseg_16_len;
 __u16 dseg_len;
};
# 19 "./include/linux/apm_bios.h" 2
# 35 "./include/linux/apm_bios.h"
struct apm_info {
 struct apm_bios_info bios;
 unsigned short connection_version;
 int get_power_status_broken;
 int get_power_status_swabinminutes;
 int allow_ints;
 int forbid_idle;
 int realmode_power_off;
 int disabled;
};
# 94 "./include/linux/apm_bios.h"
extern struct apm_info apm_info;
# 36 "./arch/x86/include/uapi/asm/bootparam.h" 2
# 1 "./include/linux/edd.h" 1
# 33 "./include/linux/edd.h"
# 1 "./include/uapi/linux/edd.h" 1
# 71 "./include/uapi/linux/edd.h"
struct edd_device_params {
 __u16 length;
 __u16 info_flags;
 __u32 num_default_cylinders;
 __u32 num_default_heads;
 __u32 sectors_per_track;
 __u64 number_of_sectors;
 __u16 bytes_per_sector;
 __u32 dpte_ptr;
 __u16 key;
 __u8 device_path_info_length;
 __u8 reserved2;
 __u16 reserved3;
 __u8 host_bus_type[4];
 __u8 interface_type[8];
 union {
  struct {
   __u16 base_address;
   __u16 reserved1;
   __u32 reserved2;
  } __attribute__ ((packed)) isa;
  struct {
   __u8 bus;
   __u8 slot;
   __u8 function;
   __u8 channel;
   __u32 reserved;
  } __attribute__ ((packed)) pci;

  struct {
   __u64 reserved;
  } __attribute__ ((packed)) ibnd;
  struct {
   __u64 reserved;
  } __attribute__ ((packed)) xprs;
  struct {
   __u64 reserved;
  } __attribute__ ((packed)) htpt;
  struct {
   __u64 reserved;
  } __attribute__ ((packed)) unknown;
 } interface_path;
 union {
  struct {
   __u8 device;
   __u8 reserved1;
   __u16 reserved2;
   __u32 reserved3;
   __u64 reserved4;
  } __attribute__ ((packed)) ata;
  struct {
   __u8 device;
   __u8 lun;
   __u8 reserved1;
   __u8 reserved2;
   __u32 reserved3;
   __u64 reserved4;
  } __attribute__ ((packed)) atapi;
  struct {
   __u16 id;
   __u64 lun;
   __u16 reserved1;
   __u32 reserved2;
  } __attribute__ ((packed)) scsi;
  struct {
   __u64 serial_number;
   __u64 reserved;
  } __attribute__ ((packed)) usb;
  struct {
   __u64 eui;
   __u64 reserved;
  } __attribute__ ((packed)) i1394;
  struct {
   __u64 wwid;
   __u64 lun;
  } __attribute__ ((packed)) fibre;
  struct {
   __u64 identity_tag;
   __u64 reserved;
  } __attribute__ ((packed)) i2o;
  struct {
   __u32 array_number;
   __u32 reserved1;
   __u64 reserved2;
  } __attribute__ ((packed)) raid;
  struct {
   __u8 device;
   __u8 reserved1;
   __u16 reserved2;
   __u32 reserved3;
   __u64 reserved4;
  } __attribute__ ((packed)) sata;
  struct {
   __u64 reserved1;
   __u64 reserved2;
  } __attribute__ ((packed)) unknown;
 } device_path;
 __u8 reserved4;
 __u8 checksum;
} __attribute__ ((packed));

struct edd_info {
 __u8 device;
 __u8 version;
 __u16 interface_support;
 __u16 legacy_max_cylinder;
 __u8 legacy_max_head;
 __u8 legacy_sectors_per_track;
 struct edd_device_params params;
} __attribute__ ((packed));

struct edd {
 unsigned int mbr_signature[16];
 struct edd_info edd_info[6];
 unsigned char mbr_signature_nr;
 unsigned char edd_info_nr;
};
# 34 "./include/linux/edd.h" 2


extern struct edd edd;
# 37 "./arch/x86/include/uapi/asm/bootparam.h" 2
# 1 "./arch/x86/include/asm/e820.h" 1
# 13 "./arch/x86/include/asm/e820.h"
# 1 "./arch/x86/include/uapi/asm/e820.h" 1
# 58 "./arch/x86/include/uapi/asm/e820.h"
struct e820entry {
 __u64 addr;
 __u64 size;
 __u32 type;
} __attribute__((packed));

struct e820map {
 __u32 nr_map;
 struct e820entry map[(128 + 3 * (1 << 6))];
};
# 14 "./arch/x86/include/asm/e820.h" 2



extern struct e820map *e820;
extern struct e820map *e820_saved;

extern unsigned long pci_mem_start;
extern int e820_any_mapped(u64 start, u64 end, unsigned type);
extern int e820_all_mapped(u64 start, u64 end, unsigned type);
extern void e820_add_region(u64 start, u64 size, int type);
extern void e820_print_map(char *who);
extern int
sanitize_e820_map(struct e820entry *biosmap, int max_nr_map, u32 *pnr_map);
extern u64 e820_update_range(u64 start, u64 size, unsigned old_type,
          unsigned new_type);
extern u64 e820_remove_range(u64 start, u64 size, unsigned old_type,
        int checktype);
extern void update_e820(void);
extern void e820_setup_gap(void);
struct setup_data;
extern void parse_e820_ext(u64 phys_addr, u32 data_len);



extern void e820_mark_nosave_regions(unsigned long limit_pfn);






extern unsigned long e820_end_of_ram_pfn(void);
extern unsigned long e820_end_of_low_ram_pfn(void);
extern u64 early_reserve_e820(u64 sizet, u64 align);

void memblock_x86_fill(void);
void memblock_find_dma_reserve(void);

extern void finish_e820_parsing(void);
extern void e820_reserve_resources(void);
extern void e820_reserve_resources_late(void);
extern void setup_memory_map(void);
extern char *default_machine_specific_memory_setup(void);

extern void e820_reallocate_tables(void);





static inline __attribute__((no_instrument_function)) bool is_ISA_range(u64 s, u64 e)
{
 return s >= 0xa0000 && e <= 0x100000;
}



# 1 "./include/linux/ioport.h" 1
# 18 "./include/linux/ioport.h"
struct resource {
 resource_size_t start;
 resource_size_t end;
 const char *name;
 unsigned long flags;
 unsigned long desc;
 struct resource *parent, *sibling, *child;
};
# 126 "./include/linux/ioport.h"
enum {
 IORES_DESC_NONE = 0,
 IORES_DESC_CRASH_KERNEL = 1,
 IORES_DESC_ACPI_TABLES = 2,
 IORES_DESC_ACPI_NV_STORAGE = 3,
 IORES_DESC_PERSISTENT_MEMORY = 4,
 IORES_DESC_PERSISTENT_MEMORY_LEGACY = 5,
};
# 166 "./include/linux/ioport.h"
extern struct resource ioport_resource;
extern struct resource iomem_resource;

extern struct resource *request_resource_conflict(struct resource *root, struct resource *new);
extern int request_resource(struct resource *root, struct resource *new);
extern int release_resource(struct resource *new);
void release_child_resources(struct resource *new);
extern void reserve_region_with_split(struct resource *root,
        resource_size_t start, resource_size_t end,
        const char *name);
extern struct resource *insert_resource_conflict(struct resource *parent, struct resource *new);
extern int insert_resource(struct resource *parent, struct resource *new);
extern void insert_resource_expand_to_fit(struct resource *root, struct resource *new);
extern int remove_resource(struct resource *old);
extern void arch_remove_reservations(struct resource *avail);
extern int allocate_resource(struct resource *root, struct resource *new,
        resource_size_t size, resource_size_t min,
        resource_size_t max, resource_size_t align,
        resource_size_t (*alignf)(void *,
             const struct resource *,
             resource_size_t,
             resource_size_t),
        void *alignf_data);
struct resource *lookup_resource(struct resource *root, resource_size_t start);
int adjust_resource(struct resource *res, resource_size_t start,
      resource_size_t size);
resource_size_t resource_alignment(struct resource *res);
static inline __attribute__((no_instrument_function)) resource_size_t resource_size(const struct resource *res)
{
 return res->end - res->start + 1;
}
static inline __attribute__((no_instrument_function)) unsigned long resource_type(const struct resource *res)
{
 return res->flags & 0x00001f00;
}
static inline __attribute__((no_instrument_function)) unsigned long resource_ext_type(const struct resource *res)
{
 return res->flags & 0x01000000;
}

static inline __attribute__((no_instrument_function)) bool resource_contains(struct resource *r1, struct resource *r2)
{
 if (resource_type(r1) != resource_type(r2))
  return false;
 if (r1->flags & 0x20000000 || r2->flags & 0x20000000)
  return false;
 return r1->start <= r2->start && r1->end >= r2->end;
}
# 225 "./include/linux/ioport.h"
extern struct resource * __request_region(struct resource *,
     resource_size_t start,
     resource_size_t n,
     const char *name, int flags);





extern void __release_region(struct resource *, resource_size_t,
    resource_size_t);






struct device;

extern int devm_request_resource(struct device *dev, struct resource *root,
     struct resource *new);
extern void devm_release_resource(struct device *dev, struct resource *new);






extern struct resource * __devm_request_region(struct device *dev,
    struct resource *parent, resource_size_t start,
    resource_size_t n, const char *name);






extern void __devm_release_region(struct device *dev, struct resource *parent,
      resource_size_t start, resource_size_t n);
extern int iomem_map_sanity_check(resource_size_t addr, unsigned long size);
extern int iomem_is_exclusive(u64 addr);

extern int
walk_system_ram_range(unsigned long start_pfn, unsigned long nr_pages,
  void *arg, int (*func)(unsigned long, unsigned long, void *));
extern int
walk_system_ram_res(u64 start, u64 end, void *arg,
      int (*func)(u64, u64, void *));
extern int
walk_iomem_res_desc(unsigned long desc, unsigned long flags, u64 start, u64 end,
      void *arg, int (*func)(u64, u64, void *));


static inline __attribute__((no_instrument_function)) bool resource_overlaps(struct resource *r1, struct resource *r2)
{
       return (r1->start <= r2->end && r1->end >= r2->start);
}
# 71 "./arch/x86/include/asm/e820.h" 2
# 38 "./arch/x86/include/uapi/asm/bootparam.h" 2
# 1 "./arch/x86/include/asm/ist.h" 1
# 18 "./arch/x86/include/asm/ist.h"
# 1 "./arch/x86/include/uapi/asm/ist.h" 1
# 22 "./arch/x86/include/uapi/asm/ist.h"
struct ist_info {
 __u32 signature;
 __u32 command;
 __u32 event;
 __u32 perf_level;
};
# 19 "./arch/x86/include/asm/ist.h" 2


extern struct ist_info ist_info;
# 39 "./arch/x86/include/uapi/asm/bootparam.h" 2
# 1 "./include/video/edid.h" 1



# 1 "./include/uapi/video/edid.h" 1



struct edid_info {
 unsigned char dummy[128];
};
# 5 "./include/video/edid.h" 2


extern struct edid_info edid_info;
# 40 "./arch/x86/include/uapi/asm/bootparam.h" 2


struct setup_data {
 __u64 next;
 __u32 type;
 __u32 len;
 __u8 data[0];
};

struct setup_header {
 __u8 setup_sects;
 __u16 root_flags;
 __u32 syssize;
 __u16 ram_size;
 __u16 vid_mode;
 __u16 root_dev;
 __u16 boot_flag;
 __u16 jump;
 __u32 header;
 __u16 version;
 __u32 realmode_swtch;
 __u16 start_sys_seg;
 __u16 kernel_version;
 __u8 type_of_loader;
 __u8 loadflags;
 __u16 setup_move_size;
 __u32 code32_start;
 __u32 ramdisk_image;
 __u32 ramdisk_size;
 __u32 bootsect_kludge;
 __u16 heap_end_ptr;
 __u8 ext_loader_ver;
 __u8 ext_loader_type;
 __u32 cmd_line_ptr;
 __u32 initrd_addr_max;
 __u32 kernel_alignment;
 __u8 relocatable_kernel;
 __u8 min_alignment;
 __u16 xloadflags;
 __u32 cmdline_size;
 __u32 hardware_subarch;
 __u64 hardware_subarch_data;
 __u32 payload_offset;
 __u32 payload_length;
 __u64 setup_data;
 __u64 pref_address;
 __u32 init_size;
 __u32 handover_offset;
} __attribute__((packed));

struct sys_desc_table {
 __u16 length;
 __u8 table[14];
};


struct olpc_ofw_header {
 __u32 ofw_magic;
 __u32 ofw_version;
 __u32 cif_handler;
 __u32 irq_desc_table;
} __attribute__((packed));

struct efi_info {
 __u32 efi_loader_signature;
 __u32 efi_systab;
 __u32 efi_memdesc_size;
 __u32 efi_memdesc_version;
 __u32 efi_memmap;
 __u32 efi_memmap_size;
 __u32 efi_systab_hi;
 __u32 efi_memmap_hi;
};


struct boot_params {
 struct screen_info screen_info;
 struct apm_bios_info apm_bios_info;
 __u8 _pad2[4];
 __u64 tboot_addr;
 struct ist_info ist_info;
 __u8 _pad3[16];
 __u8 hd0_info[16];
 __u8 hd1_info[16];
 struct sys_desc_table sys_desc_table;
 struct olpc_ofw_header olpc_ofw_header;
 __u32 ext_ramdisk_image;
 __u32 ext_ramdisk_size;
 __u32 ext_cmd_line_ptr;
 __u8 _pad4[116];
 struct edid_info edid_info;
 struct efi_info efi_info;
 __u32 alt_mem_k;
 __u32 scratch;
 __u8 e820_entries;
 __u8 eddbuf_entries;
 __u8 edd_mbr_sig_buf_entries;
 __u8 kbd_status;
 __u8 secure_boot;
 __u8 _pad5[2];
# 151 "./arch/x86/include/uapi/asm/bootparam.h"
 __u8 sentinel;
 __u8 _pad6[1];
 struct setup_header hdr;
 __u8 _pad7[0x290-0x1f1-sizeof(struct setup_header)];
 __u32 edd_mbr_sig_buffer[16];
 struct e820entry e820_map[128];
 __u8 _pad8[48];
 struct edd_info eddbuf[6];
 __u8 _pad9[276];
} __attribute__((packed));
# 201 "./arch/x86/include/uapi/asm/bootparam.h"
enum x86_hardware_subarch {
 X86_SUBARCH_PC = 0,
 X86_SUBARCH_LGUEST,
 X86_SUBARCH_XEN,
 X86_SUBARCH_INTEL_MID,
 X86_SUBARCH_CE4100,
 X86_NR_SUBARCHS,
};
# 5 "./arch/x86/include/asm/x86_init.h" 2

struct mpc_bus;
struct mpc_cpu;
struct mpc_table;
struct cpuinfo_x86;
# 22 "./arch/x86/include/asm/x86_init.h"
struct x86_init_mpparse {
 void (*mpc_record)(unsigned int mode);
 void (*setup_ioapic_ids)(void);
 int (*mpc_apic_id)(struct mpc_cpu *m);
 void (*smp_read_mpc_oem)(struct mpc_table *mpc);
 void (*mpc_oem_pci_bus)(struct mpc_bus *m);
 void (*mpc_oem_bus_info)(struct mpc_bus *m, char *name);
 void (*find_smp_config)(void);
 void (*get_smp_config)(unsigned int early);
};
# 41 "./arch/x86/include/asm/x86_init.h"
struct x86_init_resources {
 void (*probe_roms)(void);
 void (*reserve_resources)(void);
 char *(*memory_setup)(void);
};
# 54 "./arch/x86/include/asm/x86_init.h"
struct x86_init_irqs {
 void (*pre_vector_init)(void);
 void (*intr_init)(void);
 void (*trap_init)(void);
};






struct x86_init_oem {
 void (*arch_setup)(void);
 void (*banner)(void);
};
# 77 "./arch/x86/include/asm/x86_init.h"
struct x86_init_paging {
 void (*pagetable_init)(void);
};
# 88 "./arch/x86/include/asm/x86_init.h"
struct x86_init_timers {
 void (*setup_percpu_clockev)(void);
 void (*timer_init)(void);
 void (*wallclock_init)(void);
};





struct x86_init_iommu {
 int (*iommu_init)(void);
};
# 109 "./arch/x86/include/asm/x86_init.h"
struct x86_init_pci {
 int (*arch_init)(void);
 int (*init)(void);
 void (*init_irq)(void);
 void (*fixup_irqs)(void);
};





struct x86_init_ops {
 struct x86_init_resources resources;
 struct x86_init_mpparse mpparse;
 struct x86_init_irqs irqs;
 struct x86_init_oem oem;
 struct x86_init_paging paging;
 struct x86_init_timers timers;
 struct x86_init_iommu iommu;
 struct x86_init_pci pci;
};






struct x86_cpuinit_ops {
 void (*setup_percpu_clockev)(void);
 void (*early_percpu_clock_init)(void);
 void (*fixup_cpu_id)(struct cpuinfo_x86 *c, int node);
};

struct timespec;
# 163 "./arch/x86/include/asm/x86_init.h"
struct x86_legacy_devices {
 int pnpbios;
};
# 176 "./arch/x86/include/asm/x86_init.h"
enum x86_legacy_i8042_state {
 X86_LEGACY_I8042_PLATFORM_ABSENT,
 X86_LEGACY_I8042_FIRMWARE_ABSENT,
 X86_LEGACY_I8042_EXPECTED_PRESENT,
};
# 194 "./arch/x86/include/asm/x86_init.h"
struct x86_legacy_features {
 enum x86_legacy_i8042_state i8042;
 int rtc;
 int reserve_bios_regions;
 struct x86_legacy_devices devices;
};
# 221 "./arch/x86/include/asm/x86_init.h"
struct x86_platform_ops {
 unsigned long (*calibrate_cpu)(void);
 unsigned long (*calibrate_tsc)(void);
 void (*get_wallclock)(struct timespec *ts);
 int (*set_wallclock)(const struct timespec *ts);
 void (*iommu_shutdown)(void);
 bool (*is_untracked_pat_range)(u64 start, u64 end);
 void (*nmi_init)(void);
 unsigned char (*get_nmi_reason)(void);
 void (*save_sched_clock_state)(void);
 void (*restore_sched_clock_state)(void);
 void (*apic_post_init)(void);
 struct x86_legacy_features legacy;
 void (*set_legacy_features)(void);
};

struct pci_dev;

struct x86_msi_ops {
 int (*setup_msi_irqs)(struct pci_dev *dev, int nvec, int type);
 void (*teardown_msi_irq)(unsigned int irq);
 void (*teardown_msi_irqs)(struct pci_dev *dev);
 void (*restore_msi_irqs)(struct pci_dev *dev);
};

struct x86_io_apic_ops {
 unsigned int (*read) (unsigned int apic, unsigned int reg);
 void (*disable)(void);
};

extern struct x86_init_ops x86_init;
extern struct x86_cpuinit_ops x86_cpuinit;
extern struct x86_platform_ops x86_platform;
extern struct x86_msi_ops x86_msi;
extern struct x86_io_apic_ops x86_io_apic_ops;

extern void x86_early_init_platform_quirks(void);
extern void x86_init_noop(void);
extern void x86_init_uint_noop(unsigned int unused);
# 7 "./arch/x86/include/asm/mpspec.h" 2
# 1 "./arch/x86/include/asm/apicdef.h" 1
# 178 "./arch/x86/include/asm/apicdef.h"
struct local_apic {

        struct { unsigned int __reserved[4]; } __reserved_01;

        struct { unsigned int __reserved[4]; } __reserved_02;

        struct {
  unsigned int __reserved_1 : 24,
   phys_apic_id : 4,
   __reserved_2 : 4;
  unsigned int __reserved[3];
 } id;

        const
 struct {
  unsigned int version : 8,
   __reserved_1 : 8,
   max_lvt : 8,
   __reserved_2 : 8;
  unsigned int __reserved[3];
 } version;

        struct { unsigned int __reserved[4]; } __reserved_03;

        struct { unsigned int __reserved[4]; } __reserved_04;

        struct { unsigned int __reserved[4]; } __reserved_05;

        struct { unsigned int __reserved[4]; } __reserved_06;

        struct {
  unsigned int priority : 8,
   __reserved_1 : 24;
  unsigned int __reserved_2[3];
 } tpr;

        const
 struct {
  unsigned int priority : 8,
   __reserved_1 : 24;
  unsigned int __reserved_2[3];
 } apr;

        const
 struct {
  unsigned int priority : 8,
   __reserved_1 : 24;
  unsigned int __reserved_2[3];
 } ppr;

        struct {
  unsigned int eoi;
  unsigned int __reserved[3];
 } eoi;

        struct { unsigned int __reserved[4]; } __reserved_07;

        struct {
  unsigned int __reserved_1 : 24,
   logical_dest : 8;
  unsigned int __reserved_2[3];
 } ldr;

        struct {
  unsigned int __reserved_1 : 28,
   model : 4;
  unsigned int __reserved_2[3];
 } dfr;

        struct {
  unsigned int spurious_vector : 8,
   apic_enabled : 1,
   focus_cpu : 1,
   __reserved_2 : 22;
  unsigned int __reserved_3[3];
 } svr;

        struct {
         unsigned int bitfield;
  unsigned int __reserved[3];
 } isr [8];

        struct {
         unsigned int bitfield;
  unsigned int __reserved[3];
 } tmr [8];

        struct {
         unsigned int bitfield;
  unsigned int __reserved[3];
 } irr [8];

        union {
  struct {
   unsigned int send_cs_error : 1,
    receive_cs_error : 1,
    send_accept_error : 1,
    receive_accept_error : 1,
    __reserved_1 : 1,
    send_illegal_vector : 1,
    receive_illegal_vector : 1,
    illegal_register_address : 1,
    __reserved_2 : 24;
   unsigned int __reserved_3[3];
  } error_bits;
  struct {
   unsigned int errors;
   unsigned int __reserved_3[3];
  } all_errors;
 } esr;

        struct { unsigned int __reserved[4]; } __reserved_08;

        struct { unsigned int __reserved[4]; } __reserved_09;

        struct { unsigned int __reserved[4]; } __reserved_10;

        struct { unsigned int __reserved[4]; } __reserved_11;

        struct { unsigned int __reserved[4]; } __reserved_12;

        struct { unsigned int __reserved[4]; } __reserved_13;

        struct { unsigned int __reserved[4]; } __reserved_14;

        struct {
  unsigned int vector : 8,
   delivery_mode : 3,
   destination_mode : 1,
   delivery_status : 1,
   __reserved_1 : 1,
   level : 1,
   trigger : 1,
   __reserved_2 : 2,
   shorthand : 2,
   __reserved_3 : 12;
  unsigned int __reserved_4[3];
 } icr1;

        struct {
  union {
   unsigned int __reserved_1 : 24,
    phys_dest : 4,
    __reserved_2 : 4;
   unsigned int __reserved_3 : 24,
    logical_dest : 8;
  } dest;
  unsigned int __reserved_4[3];
 } icr2;

        struct {
  unsigned int vector : 8,
   __reserved_1 : 4,
   delivery_status : 1,
   __reserved_2 : 3,
   mask : 1,
   timer_mode : 1,
   __reserved_3 : 14;
  unsigned int __reserved_4[3];
 } lvt_timer;

        struct {
  unsigned int vector : 8,
   delivery_mode : 3,
   __reserved_1 : 1,
   delivery_status : 1,
   __reserved_2 : 3,
   mask : 1,
   __reserved_3 : 15;
  unsigned int __reserved_4[3];
 } lvt_thermal;

        struct {
  unsigned int vector : 8,
   delivery_mode : 3,
   __reserved_1 : 1,
   delivery_status : 1,
   __reserved_2 : 3,
   mask : 1,
   __reserved_3 : 15;
  unsigned int __reserved_4[3];
 } lvt_pc;

        struct {
  unsigned int vector : 8,
   delivery_mode : 3,
   __reserved_1 : 1,
   delivery_status : 1,
   polarity : 1,
   remote_irr : 1,
   trigger : 1,
   mask : 1,
   __reserved_2 : 15;
  unsigned int __reserved_3[3];
 } lvt_lint0;

        struct {
  unsigned int vector : 8,
   delivery_mode : 3,
   __reserved_1 : 1,
   delivery_status : 1,
   polarity : 1,
   remote_irr : 1,
   trigger : 1,
   mask : 1,
   __reserved_2 : 15;
  unsigned int __reserved_3[3];
 } lvt_lint1;

        struct {
  unsigned int vector : 8,
   __reserved_1 : 4,
   delivery_status : 1,
   __reserved_2 : 3,
   mask : 1,
   __reserved_3 : 15;
  unsigned int __reserved_4[3];
 } lvt_error;

        struct {
  unsigned int initial_count;
  unsigned int __reserved_2[3];
 } timer_icr;

        const
 struct {
  unsigned int curr_count;
  unsigned int __reserved_2[3];
 } timer_ccr;

        struct { unsigned int __reserved[4]; } __reserved_16;

        struct { unsigned int __reserved[4]; } __reserved_17;

        struct { unsigned int __reserved[4]; } __reserved_18;

        struct { unsigned int __reserved[4]; } __reserved_19;

        struct {
  unsigned int divisor : 4,
   __reserved_1 : 28;
  unsigned int __reserved_2[3];
 } timer_dcr;

        struct { unsigned int __reserved[4]; } __reserved_20;

} __attribute__ ((packed));
# 434 "./arch/x86/include/asm/apicdef.h"
enum ioapic_irq_destination_types {
 dest_Fixed = 0,
 dest_LowestPrio = 1,
 dest_SMI = 2,
 dest__reserved_1 = 3,
 dest_NMI = 4,
 dest_INIT = 5,
 dest__reserved_2 = 6,
 dest_ExtINT = 7
};
# 8 "./arch/x86/include/asm/mpspec.h" 2

extern int pic_mode;
# 39 "./arch/x86/include/asm/mpspec.h"
extern unsigned long mp_bus_not_pci[(((256) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];

extern unsigned int boot_cpu_physical_apicid;
extern u8 boot_cpu_apic_version;
extern unsigned long mp_lapic_addr;


extern int smp_found_config;




static inline __attribute__((no_instrument_function)) void get_smp_config(void)
{
 x86_init.mpparse.get_smp_config(0);
}

static inline __attribute__((no_instrument_function)) void early_get_smp_config(void)
{
 x86_init.mpparse.get_smp_config(1);
}

static inline __attribute__((no_instrument_function)) void find_smp_config(void)
{
 x86_init.mpparse.find_smp_config();
}


extern void early_reserve_e820_mpc_new(void);
extern int enable_update_mptable;
extern int default_mpc_apic_id(struct mpc_cpu *m);
extern void default_smp_read_mpc_oem(struct mpc_table *mpc);

extern void default_mpc_oem_bus_info(struct mpc_bus *m, char *str);



extern void default_find_smp_config(void);
extern void default_get_smp_config(unsigned int early);
# 88 "./arch/x86/include/asm/mpspec.h"
int generic_processor_info(int apicid, int version);
int __generic_processor_info(int apicid, int version, bool enabled);



struct physid_mask {
 unsigned long mask[(((32768) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];
};

typedef struct physid_mask physid_mask_t;
# 132 "./arch/x86/include/asm/mpspec.h"
static inline __attribute__((no_instrument_function)) unsigned long physids_coerce(physid_mask_t *map)
{
 return map->mask[0];
}

static inline __attribute__((no_instrument_function)) void physids_promote(unsigned long physids, physid_mask_t *map)
{
 bitmap_zero((*map).mask, 32768);
 map->mask[0] = physids;
}

static inline __attribute__((no_instrument_function)) void physid_set_mask_of_physid(int physid, physid_mask_t *map)
{
 bitmap_zero((*map).mask, 32768);
 set_bit(physid, (*map).mask);
}




extern physid_mask_t phys_cpu_present_map;
# 12 "./arch/x86/include/asm/smp.h" 2
# 1 "./arch/x86/include/asm/apic.h" 1
# 10 "./arch/x86/include/asm/apic.h"
# 1 "./arch/x86/include/asm/fixmap.h" 1
# 19 "./arch/x86/include/asm/fixmap.h"
# 1 "./arch/x86/include/asm/acpi.h" 1
# 26 "./arch/x86/include/asm/acpi.h"
# 1 "./include/acpi/pdc_intel.h" 1
# 27 "./arch/x86/include/asm/acpi.h" 2

# 1 "./arch/x86/include/asm/numa.h" 1





# 1 "./arch/x86/include/asm/topology.h" 1
# 42 "./arch/x86/include/asm/topology.h"
extern __attribute__((section(".data..percpu" ""))) __typeof__(int) x86_cpu_to_node_map; extern __typeof__(int) * x86_cpu_to_node_map_early_ptr; extern __typeof__(int) x86_cpu_to_node_map_early_map[];
# 56 "./arch/x86/include/asm/topology.h"
static inline __attribute__((no_instrument_function)) int early_cpu_to_node(int cpu)
{
 return *((x86_cpu_to_node_map_early_ptr) ? &(x86_cpu_to_node_map_early_ptr)[cpu] : &(*({ do { const void *__vpp_verify = (typeof((&(x86_cpu_to_node_map)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(x86_cpu_to_node_map)))) *)((&(x86_cpu_to_node_map))))); (typeof((typeof(*((&(x86_cpu_to_node_map)))) *)((&(x86_cpu_to_node_map))))) (__ptr + (((__per_cpu_offset[(cpu)])))); }); })));
}




extern cpumask_var_t node_to_cpumask_map[(1 << 6)];





static inline __attribute__((no_instrument_function)) const struct cpumask *cpumask_of_node(int node)
{
 return node_to_cpumask_map[node];
}


extern void setup_node_to_cpumask_map(void);
# 86 "./arch/x86/include/asm/topology.h"
extern int __node_distance(int, int);
# 109 "./arch/x86/include/asm/topology.h"
# 1 "./include/asm-generic/topology.h" 1
# 110 "./arch/x86/include/asm/topology.h" 2

extern const struct cpumask *cpu_coregroup_mask(int cpu);
# 121 "./arch/x86/include/asm/topology.h"
extern unsigned int __max_logical_packages;


extern int __max_smt_threads;

static inline __attribute__((no_instrument_function)) int topology_max_smt_threads(void)
{
 return __max_smt_threads;
}

int topology_update_package_map(unsigned int apicid, unsigned int cpu);
extern int topology_phys_to_logical_pkg(unsigned int pkg);
# 141 "./arch/x86/include/asm/topology.h"
static inline __attribute__((no_instrument_function)) void arch_fix_phys_package_id(int num, u32 slot)
{
}

struct pci_bus;
int x86_pci_root_bus_node(int bus);
void x86_pci_root_bus_resources(int bus, struct list_head *resources);

extern bool x86_topology_update;




extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(int) sched_core_priority;
extern unsigned int __attribute__((__section__(".data..read_mostly"))) sysctl_sched_itmt_enabled;


void sched_set_itmt_core_prio(int prio, int core_cpu);


int sched_set_itmt_support(void);


void sched_clear_itmt_support(void);
# 7 "./arch/x86/include/asm/numa.h" 2
# 20 "./arch/x86/include/asm/numa.h"
extern int numa_off;
# 30 "./arch/x86/include/asm/numa.h"
extern s16 __apicid_to_node[32768];
extern nodemask_t numa_nodes_parsed __attribute__ ((__section__(".init.data")));

extern int __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) numa_add_memblk(int nodeid, u64 start, u64 end);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) numa_set_distance(int from, int to, int distance);

static inline __attribute__((no_instrument_function)) void set_apicid_to_node(int apicid, s16 node)
{
 __apicid_to_node[apicid] = node;
}

extern int numa_cpu_node(int cpu);
# 59 "./arch/x86/include/asm/numa.h"
extern void numa_set_node(int cpu, int node);
extern void numa_clear_node(int cpu);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) init_cpu_to_node(void);
extern void numa_add_cpu(int cpu);
extern void numa_remove_cpu(int cpu);
# 29 "./arch/x86/include/asm/acpi.h" 2
# 1 "./arch/x86/include/asm/fixmap.h" 1
# 30 "./arch/x86/include/asm/acpi.h" 2

# 1 "./arch/x86/include/asm/mmu.h" 1
# 11 "./arch/x86/include/asm/mmu.h"
typedef struct {

 struct ldt_struct *ldt;




 unsigned short ia32_compat;


 struct mutex lock;
 void *vdso;
 const struct vdso_image *vdso_image;

 atomic_t perf_rdpmc_allowed;





 u16 pkey_allocation_map;
 s16 execute_only_pkey;





} mm_context_t;


void leave_mm(int cpu);
# 32 "./arch/x86/include/asm/acpi.h" 2

# 1 "./arch/x86/include/asm/realmode.h" 1




# 1 "./arch/x86/include/asm/io.h" 1
# 43 "./arch/x86/include/asm/io.h"
# 1 "./arch/x86/include/generated/asm/early_ioremap.h" 1
# 1 "./include/asm-generic/early_ioremap.h" 1
# 10 "./include/asm-generic/early_ioremap.h"
extern void *early_ioremap(resource_size_t phys_addr,
       unsigned long size);
extern void *early_memremap(resource_size_t phys_addr,
       unsigned long size);
extern void *early_memremap_ro(resource_size_t phys_addr,
          unsigned long size);
extern void early_iounmap(void *addr, unsigned long size);
extern void early_memunmap(void *addr, unsigned long size);





extern void early_ioremap_shutdown(void);



extern void early_ioremap_init(void);


extern void early_ioremap_setup(void);





extern void early_ioremap_reset(void);




extern void copy_from_early_mem(void *dest, phys_addr_t src,
    unsigned long size);
# 2 "./arch/x86/include/generated/asm/early_ioremap.h" 2
# 44 "./arch/x86/include/asm/io.h" 2
# 56 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) unsigned char readb(const volatile void *addr) { unsigned char ret; asm volatile("mov" "b" " %1,%0":"=q" (ret) :"m" (*(volatile unsigned char *)addr) :"memory"); return ret; }
static inline __attribute__((no_instrument_function)) unsigned short readw(const volatile void *addr) { unsigned short ret; asm volatile("mov" "w" " %1,%0":"=r" (ret) :"m" (*(volatile unsigned short *)addr) :"memory"); return ret; }
static inline __attribute__((no_instrument_function)) unsigned int readl(const volatile void *addr) { unsigned int ret; asm volatile("mov" "l" " %1,%0":"=r" (ret) :"m" (*(volatile unsigned int *)addr) :"memory"); return ret; }

static inline __attribute__((no_instrument_function)) unsigned char __readb(const volatile void *addr) { unsigned char ret; asm volatile("mov" "b" " %1,%0":"=q" (ret) :"m" (*(volatile unsigned char *)addr) ); return ret; }
static inline __attribute__((no_instrument_function)) unsigned short __readw(const volatile void *addr) { unsigned short ret; asm volatile("mov" "w" " %1,%0":"=r" (ret) :"m" (*(volatile unsigned short *)addr) ); return ret; }
static inline __attribute__((no_instrument_function)) unsigned int __readl(const volatile void *addr) { unsigned int ret; asm volatile("mov" "l" " %1,%0":"=r" (ret) :"m" (*(volatile unsigned int *)addr) ); return ret; }

static inline __attribute__((no_instrument_function)) void writeb(unsigned char val, volatile void *addr) { asm volatile("mov" "b" " %0,%1": :"q" (val), "m" (*(volatile unsigned char *)addr) :"memory"); }
static inline __attribute__((no_instrument_function)) void writew(unsigned short val, volatile void *addr) { asm volatile("mov" "w" " %0,%1": :"r" (val), "m" (*(volatile unsigned short *)addr) :"memory"); }
static inline __attribute__((no_instrument_function)) void writel(unsigned int val, volatile void *addr) { asm volatile("mov" "l" " %0,%1": :"r" (val), "m" (*(volatile unsigned int *)addr) :"memory"); }

static inline __attribute__((no_instrument_function)) void __writeb(unsigned char val, volatile void *addr) { asm volatile("mov" "b" " %0,%1": :"q" (val), "m" (*(volatile unsigned char *)addr) ); }
static inline __attribute__((no_instrument_function)) void __writew(unsigned short val, volatile void *addr) { asm volatile("mov" "w" " %0,%1": :"r" (val), "m" (*(volatile unsigned short *)addr) ); }
static inline __attribute__((no_instrument_function)) void __writel(unsigned int val, volatile void *addr) { asm volatile("mov" "l" " %0,%1": :"r" (val), "m" (*(volatile unsigned int *)addr) ); }
# 90 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) unsigned long readq(const volatile void *addr) { unsigned long ret; asm volatile("mov" "q" " %1,%0":"=r" (ret) :"m" (*(volatile unsigned long *)addr) :"memory"); return ret; }
static inline __attribute__((no_instrument_function)) void writeq(unsigned long val, volatile void *addr) { asm volatile("mov" "q" " %0,%1": :"r" (val), "m" (*(volatile unsigned long *)addr) :"memory"); }
# 118 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) phys_addr_t virt_to_phys(volatile void *address)
{
 return __phys_addr_nodebug((unsigned long)(address));
}
# 136 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) void *phys_to_virt(phys_addr_t address)
{
 return ((void *)((unsigned long)(address)+((unsigned long)(0xffff880000000000UL))));
}
# 151 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) unsigned int isa_virt_to_bus(volatile void *address)
{
 return (unsigned int)virt_to_phys(address);
}
# 171 "./arch/x86/include/asm/io.h"
extern void *ioremap_nocache(resource_size_t offset, unsigned long size);
extern void *ioremap_uc(resource_size_t offset, unsigned long size);


extern void *ioremap_cache(resource_size_t offset, unsigned long size);
extern void *ioremap_prot(resource_size_t offset, unsigned long size, unsigned long prot_val);
# 192 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) void *ioremap(resource_size_t offset, unsigned long size)
{
 return ioremap_nocache(offset, size);
}

extern void iounmap(volatile void *addr);

extern void set_iounmap_nonlazy(void);




# 1 "./include/asm-generic/iomap.h" 1
# 28 "./include/asm-generic/iomap.h"
extern unsigned int ioread8(void *);
extern unsigned int ioread16(void *);
extern unsigned int ioread16be(void *);
extern unsigned int ioread32(void *);
extern unsigned int ioread32be(void *);

extern u64 ioread64(void *);
extern u64 ioread64be(void *);


extern void iowrite8(u8, void *);
extern void iowrite16(u16, void *);
extern void iowrite16be(u16, void *);
extern void iowrite32(u32, void *);
extern void iowrite32be(u32, void *);

extern void iowrite64(u64, void *);
extern void iowrite64be(u64, void *);
# 59 "./include/asm-generic/iomap.h"
extern void ioread8_rep(void *port, void *buf, unsigned long count);
extern void ioread16_rep(void *port, void *buf, unsigned long count);
extern void ioread32_rep(void *port, void *buf, unsigned long count);

extern void iowrite8_rep(void *port, const void *buf, unsigned long count);
extern void iowrite16_rep(void *port, const void *buf, unsigned long count);
extern void iowrite32_rep(void *port, const void *buf, unsigned long count);



extern void *ioport_map(unsigned long port, unsigned int nr);
extern void ioport_unmap(void *);
# 83 "./include/asm-generic/iomap.h"
struct pci_dev;
extern void pci_iounmap(struct pci_dev *dev, void *);







# 1 "./include/asm-generic/pci_iomap.h" 1
# 14 "./include/asm-generic/pci_iomap.h"
struct pci_dev;


extern void *pci_iomap(struct pci_dev *dev, int bar, unsigned long max);
extern void *pci_iomap_wc(struct pci_dev *dev, int bar, unsigned long max);
extern void *pci_iomap_range(struct pci_dev *dev, int bar,
         unsigned long offset,
         unsigned long maxlen);
extern void *pci_iomap_wc_range(struct pci_dev *dev, int bar,
     unsigned long offset,
     unsigned long maxlen);
# 92 "./include/asm-generic/iomap.h" 2
# 204 "./arch/x86/include/asm/io.h" 2
# 218 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) void
memset_io(volatile void *addr, unsigned char val, size_t count)
{
 memset((void *)addr, val, count);
}
# 232 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) void
memcpy_fromio(void *dst, const volatile void *src, size_t count)
{
 ({ size_t __len = (count); void *__ret; if (__builtin_constant_p(count) && __len >= 64) __ret = __memcpy((dst), ((const void *)src), __len); else __ret = __builtin_memcpy((dst), ((const void *)src), __len); __ret; });
}
# 246 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) void
memcpy_toio(volatile void *dst, const void *src, size_t count)
{
 ({ size_t __len = (count); void *__ret; if (__builtin_constant_p(count) && __len >= 64) __ret = __memcpy(((void *)dst), (src), __len); else __ret = __builtin_memcpy(((void *)dst), (src), __len); __ret; });
}
# 270 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) void flush_write_buffers(void)
{



}



extern void native_io_delay(void);

extern int io_delay_type;
extern void io_delay_init(void);





static inline __attribute__((no_instrument_function)) void slow_down_io(void)
{
 native_io_delay();





}
# 340 "./arch/x86/include/asm/io.h"
static inline __attribute__((no_instrument_function)) void outb(unsigned char value, int port) { asm volatile("out" "b" " %" "b" "0, %w1" : : "a"(value), "Nd"(port)); } static inline __attribute__((no_instrument_function)) unsigned char inb(int port) { unsigned char value; asm volatile("in" "b" " %w1, %" "b" "0" : "=a"(value) : "Nd"(port)); return value; } static inline __attribute__((no_instrument_function)) void outb_p(unsigned char value, int port) { outb(value, port); slow_down_io(); } static inline __attribute__((no_instrument_function)) unsigned char inb_p(int port) { unsigned char value = inb(port); slow_down_io(); return value; } static inline __attribute__((no_instrument_function)) void outsb(int port, const void *addr, unsigned long count) { asm volatile("rep; outs" "b" : "+S"(addr), "+c"(count) : "d"(port)); } static inline __attribute__((no_instrument_function)) void insb(int port, void *addr, unsigned long count) { asm volatile("rep; ins" "b" : "+D"(addr), "+c"(count) : "d"(port)); }
static inline __attribute__((no_instrument_function)) void outw(unsigned short value, int port) { asm volatile("out" "w" " %" "w" "0, %w1" : : "a"(value), "Nd"(port)); } static inline __attribute__((no_instrument_function)) unsigned short inw(int port) { unsigned short value; asm volatile("in" "w" " %w1, %" "w" "0" : "=a"(value) : "Nd"(port)); return value; } static inline __attribute__((no_instrument_function)) void outw_p(unsigned short value, int port) { outw(value, port); slow_down_io(); } static inline __attribute__((no_instrument_function)) unsigned short inw_p(int port) { unsigned short value = inw(port); slow_down_io(); return value; } static inline __attribute__((no_instrument_function)) void outsw(int port, const void *addr, unsigned long count) { asm volatile("rep; outs" "w" : "+S"(addr), "+c"(count) : "d"(port)); } static inline __attribute__((no_instrument_function)) void insw(int port, void *addr, unsigned long count) { asm volatile("rep; ins" "w" : "+D"(addr), "+c"(count) : "d"(port)); }
static inline __attribute__((no_instrument_function)) void outl(unsigned int value, int port) { asm volatile("out" "l" " %" "" "0, %w1" : : "a"(value), "Nd"(port)); } static inline __attribute__((no_instrument_function)) unsigned int inl(int port) { unsigned int value; asm volatile("in" "l" " %w1, %" "" "0" : "=a"(value) : "Nd"(port)); return value; } static inline __attribute__((no_instrument_function)) void outl_p(unsigned int value, int port) { outl(value, port); slow_down_io(); } static inline __attribute__((no_instrument_function)) unsigned int inl_p(int port) { unsigned int value = inl(port); slow_down_io(); return value; } static inline __attribute__((no_instrument_function)) void outsl(int port, const void *addr, unsigned long count) { asm volatile("rep; outs" "l" : "+S"(addr), "+c"(count) : "d"(port)); } static inline __attribute__((no_instrument_function)) void insl(int port, void *addr, unsigned long count) { asm volatile("rep; ins" "l" : "+D"(addr), "+c"(count) : "d"(port)); }

extern void *xlate_dev_mem_ptr(phys_addr_t phys);
extern void unxlate_dev_mem_ptr(phys_addr_t phys, void *addr);

extern int ioremap_change_attr(unsigned long vaddr, unsigned long size,
    enum page_cache_mode pcm);
extern void *ioremap_wc(resource_size_t offset, unsigned long size);
extern void *ioremap_wt(resource_size_t offset, unsigned long size);

extern bool is_early_ioremap_ptep(pte_t *ptep);
# 369 "./arch/x86/include/asm/io.h"
extern int __attribute__((warn_unused_result)) arch_phys_wc_index(int handle);


extern int __attribute__((warn_unused_result)) arch_phys_wc_add(unsigned long base,
      unsigned long size);
extern void arch_phys_wc_del(int handle);




extern int arch_io_reserve_memtype_wc(resource_size_t start, resource_size_t size);
extern void arch_io_free_memtype_wc(resource_size_t start, resource_size_t size);
# 6 "./arch/x86/include/asm/realmode.h" 2


struct real_mode_header {
 u32 text_start;
 u32 ro_end;

 u32 trampoline_start;
 u32 trampoline_status;
 u32 trampoline_header;

 u32 trampoline_pgd;



 u32 wakeup_start;
 u32 wakeup_header;


 u32 machine_real_restart_asm;

 u32 machine_real_restart_seg;

};


struct trampoline_header {






 u64 start;
 u64 efer;
 u32 cr4;

};

extern struct real_mode_header *real_mode_header;
extern unsigned char real_mode_blob_end[];

extern unsigned long initial_code;
extern unsigned long initial_gs;
extern unsigned long initial_stack;

extern unsigned char real_mode_blob[];
extern unsigned char real_mode_relocs[];





extern unsigned char secondary_startup_64[];


static inline __attribute__((no_instrument_function)) size_t real_mode_size_needed(void)
{
 if (real_mode_header)
  return 0;

 return ((((real_mode_blob_end - real_mode_blob)) + ((typeof((real_mode_blob_end - real_mode_blob)))((((1UL) << 12))) - 1)) & ~((typeof((real_mode_blob_end - real_mode_blob)))((((1UL) << 12))) - 1));
}

void set_real_mode_mem(phys_addr_t mem, size_t size);
void reserve_real_mode(void);
# 34 "./arch/x86/include/asm/acpi.h" 2






extern int acpi_lapic;
extern int acpi_ioapic;
extern int acpi_noirq;
extern int acpi_strict;
extern int acpi_disabled;
extern int acpi_pci_disabled;
extern int acpi_skip_timer_override;
extern int acpi_use_timer_override;
extern int acpi_fix_pin2_polarity;
extern int acpi_disable_cmcff;

extern u8 acpi_sci_flags;
extern int acpi_sci_override_gsi;
void acpi_pic_sci_set_trigger(unsigned int, u16);

extern int (*__acpi_register_gsi)(struct device *dev, u32 gsi,
      int trigger, int polarity);
extern void (*__acpi_unregister_gsi)(u32 gsi);

static inline __attribute__((no_instrument_function)) void disable_acpi(void)
{
 acpi_disabled = 1;
 acpi_pci_disabled = 1;
 acpi_noirq = 1;
}

extern int acpi_gsi_to_irq(u32 gsi, unsigned int *irq);

static inline __attribute__((no_instrument_function)) void acpi_noirq_set(void) { acpi_noirq = 1; }
static inline __attribute__((no_instrument_function)) void acpi_disable_pci(void)
{
 acpi_pci_disabled = 1;
 acpi_noirq_set();
}


extern int (*acpi_suspend_lowlevel)(void);







static inline __attribute__((no_instrument_function)) unsigned int acpi_processor_cstate_check(unsigned int max_cstate)
{






 if (boot_cpu_data.x86 == 0x0F &&
     boot_cpu_data.x86_vendor == 2 &&
     boot_cpu_data.x86_model <= 0x05 &&
     boot_cpu_data.x86_mask < 0x0A)
  return 1;
 else if ((__builtin_constant_p((18*32 + (4))) && ( ((((18*32 + (4)))>>5)==(0) && (1UL<<(((18*32 + (4)))&31) & ((1<<(( 0*32+ 0) & 31))|(1<<(( 0*32+ 3)) & 31)|(1<<(( 0*32+ 5) & 31))|(1<<(( 0*32+ 6) & 31))| (1<<(( 0*32+ 8) & 31))|(1<<(( 0*32+13)) & 31)|(1<<(( 0*32+24) & 31))|(1<<(( 0*32+15) & 31))| (1<<(( 0*32+25) & 31))|(1<<(( 0*32+26) & 31))) )) || ((((18*32 + (4)))>>5)==(1) && (1UL<<(((18*32 + (4)))&31) & ((1<<(( 1*32+29) & 31))|0) )) || ((((18*32 + (4)))>>5)==(2) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(3) && (1UL<<(((18*32 + (4)))&31) & ((1<<(( 3*32+20) & 31))) )) || ((((18*32 + (4)))>>5)==(4) && (1UL<<(((18*32 + (4)))&31) & (0) )) || ((((18*32 + (4)))>>5)==(5) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(6) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(7) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(8) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(9) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(10) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(11) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(12) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(13) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(14) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(15) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(16) && (1UL<<(((18*32 + (4)))&31) & 0 )) || ((((18*32 + (4)))>>5)==(17) && (1UL<<(((18*32 + (4)))&31) & 0 )) || (sizeof(struct { int:-!!(18 != 18); })) || (sizeof(struct { int:-!!(18 != 18); }))) ? 1 : (__builtin_constant_p(((18*32 + (4)))) ? constant_test_bit(((18*32 + (4))), ((unsigned long *)((&boot_cpu_data)->x86_capability))) : variable_test_bit(((18*32 + (4))), ((unsigned long *)((&boot_cpu_data)->x86_capability))))))
  return 1;
 else
  return max_cstate;
}

static inline __attribute__((no_instrument_function)) bool arch_has_acpi_pdc(void)
{
 struct cpuinfo_x86 *c = &(*({ do { const void *__vpp_verify = (typeof((&(cpu_info)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(cpu_info)))) *)((&(cpu_info))))); (typeof((typeof(*((&(cpu_info)))) *)((&(cpu_info))))) (__ptr + (((__per_cpu_offset[(0)])))); }); }));
 return (c->x86_vendor == 0 ||
  c->x86_vendor == 5);
}

static inline __attribute__((no_instrument_function)) void arch_acpi_set_pdc_bits(u32 *buf)
{
 struct cpuinfo_x86 *c = &(*({ do { const void *__vpp_verify = (typeof((&(cpu_info)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(cpu_info)))) *)((&(cpu_info))))); (typeof((typeof(*((&(cpu_info)))) *)((&(cpu_info))))) (__ptr + (((__per_cpu_offset[(0)])))); }); }));

 buf[2] |= ((0x0010) | (0x0008) | (0x0002) | (0x0100) | (0x0200));

 if ((__builtin_constant_p(( 4*32+ 7)) && ( (((( 4*32+ 7))>>5)==(0) && (1UL<<((( 4*32+ 7))&31) & ((1<<(( 0*32+ 0) & 31))|(1<<(( 0*32+ 3)) & 31)|(1<<(( 0*32+ 5) & 31))|(1<<(( 0*32+ 6) & 31))| (1<<(( 0*32+ 8) & 31))|(1<<(( 0*32+13)) & 31)|(1<<(( 0*32+24) & 31))|(1<<(( 0*32+15) & 31))| (1<<(( 0*32+25) & 31))|(1<<(( 0*32+26) & 31))) )) || (((( 4*32+ 7))>>5)==(1) && (1UL<<((( 4*32+ 7))&31) & ((1<<(( 1*32+29) & 31))|0) )) || (((( 4*32+ 7))>>5)==(2) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(3) && (1UL<<((( 4*32+ 7))&31) & ((1<<(( 3*32+20) & 31))) )) || (((( 4*32+ 7))>>5)==(4) && (1UL<<((( 4*32+ 7))&31) & (0) )) || (((( 4*32+ 7))>>5)==(5) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(6) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(7) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(8) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(9) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(10) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(11) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(12) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(13) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(14) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(15) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(16) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (((( 4*32+ 7))>>5)==(17) && (1UL<<((( 4*32+ 7))&31) & 0 )) || (sizeof(struct { int:-!!(18 != 18); })) || (sizeof(struct { int:-!!(18 != 18); }))) ? 1 : (__builtin_constant_p((( 4*32+ 7))) ? constant_test_bit((( 4*32+ 7)), ((unsigned long *)((c)->x86_capability))) : variable_test_bit((( 4*32+ 7)), ((unsigned long *)((c)->x86_capability))))))
  buf[2] |= ((0x0008) | (0x0002) | (0x0020) | (0x0800) | (0x0001));

 if ((__builtin_constant_p(( 0*32+22)) && ( (((( 0*32+22))>>5)==(0) && (1UL<<((( 0*32+22))&31) & ((1<<(( 0*32+ 0) & 31))|(1<<(( 0*32+ 3)) & 31)|(1<<(( 0*32+ 5) & 31))|(1<<(( 0*32+ 6) & 31))| (1<<(( 0*32+ 8) & 31))|(1<<(( 0*32+13)) & 31)|(1<<(( 0*32+24) & 31))|(1<<(( 0*32+15) & 31))| (1<<(( 0*32+25) & 31))|(1<<(( 0*32+26) & 31))) )) || (((( 0*32+22))>>5)==(1) && (1UL<<((( 0*32+22))&31) & ((1<<(( 1*32+29) & 31))|0) )) || (((( 0*32+22))>>5)==(2) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(3) && (1UL<<((( 0*32+22))&31) & ((1<<(( 3*32+20) & 31))) )) || (((( 0*32+22))>>5)==(4) && (1UL<<((( 0*32+22))&31) & (0) )) || (((( 0*32+22))>>5)==(5) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(6) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(7) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(8) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(9) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(10) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(11) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(12) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(13) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(14) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(15) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(16) && (1UL<<((( 0*32+22))&31) & 0 )) || (((( 0*32+22))>>5)==(17) && (1UL<<((( 0*32+22))&31) & 0 )) || (sizeof(struct { int:-!!(18 != 18); })) || (sizeof(struct { int:-!!(18 != 18); }))) ? 1 : (__builtin_constant_p((( 0*32+22))) ? constant_test_bit((( 0*32+22)), ((unsigned long *)((c)->x86_capability))) : variable_test_bit((( 0*32+22)), ((unsigned long *)((c)->x86_capability))))))
  buf[2] |= (0x0004);




 if (!(__builtin_constant_p(( 4*32+ 3)) && ( (((( 4*32+ 3))>>5)==(0) && (1UL<<((( 4*32+ 3))&31) & ((1<<(( 0*32+ 0) & 31))|(1<<(( 0*32+ 3)) & 31)|(1<<(( 0*32+ 5) & 31))|(1<<(( 0*32+ 6) & 31))| (1<<(( 0*32+ 8) & 31))|(1<<(( 0*32+13)) & 31)|(1<<(( 0*32+24) & 31))|(1<<(( 0*32+15) & 31))| (1<<(( 0*32+25) & 31))|(1<<(( 0*32+26) & 31))) )) || (((( 4*32+ 3))>>5)==(1) && (1UL<<((( 4*32+ 3))&31) & ((1<<(( 1*32+29) & 31))|0) )) || (((( 4*32+ 3))>>5)==(2) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(3) && (1UL<<((( 4*32+ 3))&31) & ((1<<(( 3*32+20) & 31))) )) || (((( 4*32+ 3))>>5)==(4) && (1UL<<((( 4*32+ 3))&31) & (0) )) || (((( 4*32+ 3))>>5)==(5) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(6) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(7) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(8) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(9) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(10) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(11) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(12) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(13) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(14) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(15) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(16) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (((( 4*32+ 3))>>5)==(17) && (1UL<<((( 4*32+ 3))&31) & 0 )) || (sizeof(struct { int:-!!(18 != 18); })) || (sizeof(struct { int:-!!(18 != 18); }))) ? 1 : (__builtin_constant_p((( 4*32+ 3))) ? constant_test_bit((( 4*32+ 3)), ((unsigned long *)((c)->x86_capability))) : variable_test_bit((( 4*32+ 3)), ((unsigned long *)((c)->x86_capability))))))
  buf[2] &= ~((0x0200));
}

static inline __attribute__((no_instrument_function)) bool acpi_has_cpu_in_madt(void)
{
 return !!acpi_lapic;
}
# 148 "./arch/x86/include/asm/acpi.h"
extern int x86_acpi_numa_init(void);
# 20 "./arch/x86/include/asm/fixmap.h" 2






# 1 "./arch/x86/include/uapi/asm/vsyscall.h" 1



enum vsyscall_num {
 __NR_vgettimeofday,
 __NR_vtime,
 __NR_vgetcpu,
};
# 27 "./arch/x86/include/asm/fixmap.h" 2
# 67 "./arch/x86/include/asm/fixmap.h"
enum fixed_addresses {




 VSYSCALL_PAGE = (((((((-10UL << 20) + ((1UL) << 12))-1) | ((__typeof__((-10UL << 20) + ((1UL) << 12)))((1<<21)-1)))+1) - ((1UL) << 12)) - (-10UL << 20)) >> 12,


 FIX_DBGP_BASE,
 FIX_EARLYCON_MEM_BASE,

 FIX_OHCI1394_BASE,


 FIX_APIC_BASE,


 FIX_IO_APIC_BASE_0,
 FIX_IO_APIC_BASE_END = FIX_IO_APIC_BASE_0 + 128 - 1,

 FIX_RO_IDT,
# 98 "./arch/x86/include/asm/fixmap.h"
 FIX_TEXT_POKE1,
 FIX_TEXT_POKE0,



 __end_of_permanent_fixed_addresses,
# 115 "./arch/x86/include/asm/fixmap.h"
 FIX_BTMAP_END =
  (__end_of_permanent_fixed_addresses ^
   (__end_of_permanent_fixed_addresses + (64 * 8) - 1)) &
  -512
  ? __end_of_permanent_fixed_addresses + (64 * 8) -
    (__end_of_permanent_fixed_addresses & ((64 * 8) - 1))
  : __end_of_permanent_fixed_addresses,
 FIX_BTMAP_BEGIN = FIX_BTMAP_END + (64 * 8) - 1,






 __end_of_fixed_addresses
};


extern void reserve_top_address(unsigned long reserve);




extern int fixmaps_set;

extern pte_t *kmap_pte;

extern pte_t *pkmap_page_table;

void __native_set_fixmap(enum fixed_addresses idx, pte_t pte);
void native_set_fixmap(enum fixed_addresses idx,
         phys_addr_t phys, pgprot_t flags);


static inline __attribute__((no_instrument_function)) void __set_fixmap(enum fixed_addresses idx,
    phys_addr_t phys, pgprot_t flags)
{
 native_set_fixmap(idx, phys, flags);
}



# 1 "./include/asm-generic/fixmap.h" 1
# 29 "./include/asm-generic/fixmap.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long fix_to_virt(const unsigned int idx)
{
 do { bool __cond = !(!(idx >= __end_of_fixed_addresses)); extern void __compiletime_assert_31(void) ; if (__cond) __compiletime_assert_31(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0);
 return (((((((-10UL << 20) + ((1UL) << 12))-1) | ((__typeof__((-10UL << 20) + ((1UL) << 12)))((1<<21)-1)))+1) - ((1UL) << 12)) - ((idx) << 12));
}

static inline __attribute__((no_instrument_function)) unsigned long virt_to_fix(const unsigned long vaddr)
{
 do { if (__builtin_expect(!!(vaddr >= ((((((-10UL << 20) + ((1UL) << 12))-1) | ((__typeof__((-10UL << 20) + ((1UL) << 12)))((1<<21)-1)))+1) - ((1UL) << 12)) || vaddr < (((((((-10UL << 20) + ((1UL) << 12))-1) | ((__typeof__((-10UL << 20) + ((1UL) << 12)))((1<<21)-1)))+1) - ((1UL) << 12)) - (__end_of_permanent_fixed_addresses << 12))), 0)) do { asm volatile("1:\tud2\n" ".pushsection __bug_table,\"a\"\n" "2:\t.long 1b - 2b, %c0 - 2b\n" "\t.word %c1, 0\n" "\t.org 2b+%c2\n" ".popsection" : : "i" ("./include/asm-generic/fixmap.h"), "i" (37), "i" (sizeof(struct bug_entry))); do { } while (1); } while (0); } while (0);
 return ((((((((-10UL << 20) + ((1UL) << 12))-1) | ((__typeof__((-10UL << 20) + ((1UL) << 12)))((1<<21)-1)))+1) - ((1UL) << 12)) - ((vaddr)&(~(((1UL) << 12)-1)))) >> 12);
}
# 157 "./arch/x86/include/asm/fixmap.h" 2




void __early_set_fixmap(enum fixed_addresses idx,
   phys_addr_t phys, pgprot_t flags);
# 11 "./arch/x86/include/asm/apic.h" 2
# 43 "./arch/x86/include/asm/apic.h"
static inline __attribute__((no_instrument_function)) void generic_apic_probe(void)
{
}




extern unsigned int apic_verbosity;
extern int local_apic_timer_c2_ok;

extern int disable_apic;
extern unsigned int lapic_timer_frequency;


extern void __inquire_remote_apic(int apicid);






static inline __attribute__((no_instrument_function)) void default_inquire_remote_apic(int apicid)
{
 if (apic_verbosity >= 2)
  __inquire_remote_apic(apicid);
}
# 78 "./arch/x86/include/asm/apic.h"
static inline __attribute__((no_instrument_function)) bool apic_from_smp_config(void)
{
 return smp_found_config && !disable_apic;
}
# 90 "./arch/x86/include/asm/apic.h"
extern int setup_profiling_timer(unsigned int);

static inline __attribute__((no_instrument_function)) void native_apic_mem_write(u32 reg, u32 v)
{
 volatile u32 *addr = (volatile u32 *)((fix_to_virt(FIX_APIC_BASE)) + reg);

 asm volatile ("661:\n\t" "movl %0, %P1" "\n662:\n" ".skip -(((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")) > 0) * " "((" "665""1""f-""664""1""f" ")-(" "662b-661b" ")),0x90\n" "663" ":\n" ".pushsection .altinstructions,\"a\"\n" " .long 661b - .\n" " .long " "664""1""f - .\n" " .word " "(18*32 + (5))" "\n" " .byte " "663""b-661b" "\n" " .byte " "665""1""f-""664""1""f" "\n" " .byte " "663""b-662b" "\n" ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" "664""1"":\n\t" "xchgl %0, %P1" "\n" "665""1" ":\n\t" ".popsection" : "=r" (v), "=m" (*addr) : "i" (0), "0" (v), "m" (*addr));


}

static inline __attribute__((no_instrument_function)) u32 native_apic_mem_read(u32 reg)
{
 return *((volatile u32 *)((fix_to_virt(FIX_APIC_BASE)) + reg));
}

extern void native_apic_wait_icr_idle(void);
extern u32 native_safe_apic_wait_icr_idle(void);
extern void native_apic_icr_write(u32 low, u32 id);
extern u64 native_apic_icr_read(void);

static inline __attribute__((no_instrument_function)) bool apic_is_x2apic_enabled(void)
{
 u64 msr;

 if (rdmsrl_safe(0x0000001b, &msr))
  return false;
 return msr & (1UL << 10);
}

extern void enable_IR_x2apic(void);

extern int get_physical_broadcast(void);

extern int lapic_get_maxlvt(void);
extern void clear_local_APIC(void);
extern void disconnect_bsp_APIC(int virt_wire_setup);
extern void disable_local_APIC(void);
extern void lapic_shutdown(void);
extern void sync_Arb_IDs(void);
extern void init_bsp_APIC(void);
extern void setup_local_APIC(void);
extern void init_apic_mappings(void);
void register_lapic_address(unsigned long address);
extern void setup_boot_APIC_clock(void);
extern void setup_secondary_APIC_clock(void);
extern void lapic_update_tsc_freq(void);
extern int APIC_init_uniprocessor(void);


static inline __attribute__((no_instrument_function)) int apic_force_enable(unsigned long addr)
{
 return -1;
}




extern int apic_bsp_setup(bool upmode);
extern void apic_ap_setup(void);





extern int apic_is_clustered_box(void);







extern int setup_APIC_eilvt(u8 lvt_off, u8 vector, u8 msg_type, u8 mask);
# 247 "./arch/x86/include/asm/apic.h"
static inline __attribute__((no_instrument_function)) void check_x2apic(void) { }
static inline __attribute__((no_instrument_function)) void x2apic_setup(void) { }
static inline __attribute__((no_instrument_function)) int x2apic_enabled(void) { return 0; }
# 271 "./arch/x86/include/asm/apic.h"
struct apic {
 char *name;

 int (*probe)(void);
 int (*acpi_madt_oem_check)(char *oem_id, char *oem_table_id);
 int (*apic_id_valid)(int apicid);
 int (*apic_id_registered)(void);

 u32 irq_delivery_mode;
 u32 irq_dest_mode;

 const struct cpumask *(*target_cpus)(void);

 int disable_esr;

 int dest_logical;
 unsigned long (*check_apicid_used)(physid_mask_t *map, int apicid);

 void (*vector_allocation_domain)(int cpu, struct cpumask *retmask,
      const struct cpumask *mask);
 void (*init_apic_ldr)(void);

 void (*ioapic_phys_id_map)(physid_mask_t *phys_map, physid_mask_t *retmap);

 void (*setup_apic_routing)(void);
 int (*cpu_present_to_apicid)(int mps_cpu);
 void (*apicid_to_cpu_present)(int phys_apicid, physid_mask_t *retmap);
 int (*check_phys_apicid_present)(int phys_apicid);
 int (*phys_pkg_id)(int cpuid_apic, int index_msb);

 unsigned int (*get_apic_id)(unsigned long x);
 unsigned long (*set_apic_id)(unsigned int id);

 int (*cpu_mask_to_apicid_and)(const struct cpumask *cpumask,
          const struct cpumask *andmask,
          unsigned int *apicid);


 void (*send_IPI)(int cpu, int vector);
 void (*send_IPI_mask)(const struct cpumask *mask, int vector);
 void (*send_IPI_mask_allbutself)(const struct cpumask *mask,
      int vector);
 void (*send_IPI_allbutself)(int vector);
 void (*send_IPI_all)(int vector);
 void (*send_IPI_self)(int vector);


 int (*wakeup_secondary_cpu)(int apicid, unsigned long start_eip);

 void (*inquire_remote_apic)(int apicid);


 u32 (*read)(u32 reg);
 void (*write)(u32 reg, u32 v);







 void (*eoi_write)(u32 reg, u32 v);
 void (*native_eoi_write)(u32 reg, u32 v);
 u64 (*icr_read)(void);
 void (*icr_write)(u32 low, u32 high);
 void (*wait_icr_idle)(void);
 u32 (*safe_wait_icr_idle)(void);
# 352 "./arch/x86/include/asm/apic.h"
};






extern struct apic *apic;
# 379 "./arch/x86/include/asm/apic.h"
extern struct apic *__apicdrivers[], *__apicdrivers_end[];





extern int wakeup_secondary_cpu_via_nmi(int apicid, unsigned long start_eip);




static inline __attribute__((no_instrument_function)) u32 apic_read(u32 reg)
{
 return apic->read(reg);
}

static inline __attribute__((no_instrument_function)) void apic_write(u32 reg, u32 val)
{
 apic->write(reg, val);
}

static inline __attribute__((no_instrument_function)) void apic_eoi(void)
{
 apic->eoi_write(0xB0, 0x0);
}

static inline __attribute__((no_instrument_function)) u64 apic_icr_read(void)
{
 return apic->icr_read();
}

static inline __attribute__((no_instrument_function)) void apic_icr_write(u32 low, u32 high)
{
 apic->icr_write(low, high);
}

static inline __attribute__((no_instrument_function)) void apic_wait_icr_idle(void)
{
 apic->wait_icr_idle();
}

static inline __attribute__((no_instrument_function)) u32 safe_apic_wait_icr_idle(void)
{
 return apic->safe_wait_icr_idle();
}

extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) apic_set_eoi_write(void (*eoi_write)(u32 reg, u32 v));
# 440 "./arch/x86/include/asm/apic.h"
static inline __attribute__((no_instrument_function)) void ack_APIC_irq(void)
{




 apic_eoi();
}

static inline __attribute__((no_instrument_function)) unsigned default_get_apic_id(unsigned long x)
{
 unsigned int ver = ((apic_read(0x30)) & 0xFFu);

 if (((ver) >= 0x14) || (__builtin_constant_p(( 3*32+26)) && ( (((( 3*32+26))>>5)==(0) && (1UL<<((( 3*32+26))&31) & ((1<<(( 0*32+ 0) & 31))|(1<<(( 0*32+ 3)) & 31)|(1<<(( 0*32+ 5) & 31))|(1<<(( 0*32+ 6) & 31))| (1<<(( 0*32+ 8) & 31))|(1<<(( 0*32+13)) & 31)|(1<<(( 0*32+24) & 31))|(1<<(( 0*32+15) & 31))| (1<<(( 0*32+25) & 31))|(1<<(( 0*32+26) & 31))) )) || (((( 3*32+26))>>5)==(1) && (1UL<<((( 3*32+26))&31) & ((1<<(( 1*32+29) & 31))|0) )) || (((( 3*32+26))>>5)==(2) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(3) && (1UL<<((( 3*32+26))&31) & ((1<<(( 3*32+20) & 31))) )) || (((( 3*32+26))>>5)==(4) && (1UL<<((( 3*32+26))&31) & (0) )) || (((( 3*32+26))>>5)==(5) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(6) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(7) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(8) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(9) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(10) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(11) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(12) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(13) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(14) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(15) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(16) && (1UL<<((( 3*32+26))&31) & 0 )) || (((( 3*32+26))>>5)==(17) && (1UL<<((( 3*32+26))&31) & 0 )) || (sizeof(struct { int:-!!(18 != 18); })) || (sizeof(struct { int:-!!(18 != 18); }))) ? 1 : (__builtin_constant_p((( 3*32+26))) ? constant_test_bit((( 3*32+26)), ((unsigned long *)((&boot_cpu_data)->x86_capability))) : variable_test_bit((( 3*32+26)), ((unsigned long *)((&boot_cpu_data)->x86_capability))))))
  return (x >> 24) & 0xFF;
 else
  return (x >> 24) & 0x0F;
}
# 466 "./arch/x86/include/asm/apic.h"
extern void apic_send_IPI_self(int vector);

extern __attribute__((section(".data..percpu" ""))) __typeof__(int) x2apic_extra_bits;

extern int default_cpu_present_to_apicid(int mps_cpu);
extern int default_check_phys_apicid_present(int phys_apicid);


extern void generic_bigsmp_probe(void);





# 1 "./arch/x86/include/asm/smp.h" 1
# 480 "./arch/x86/include/asm/apic.h" 2



static inline __attribute__((no_instrument_function)) const struct cpumask *default_target_cpus(void)
{

 return ((const struct cpumask *)&__cpu_online_mask);



}

static inline __attribute__((no_instrument_function)) const struct cpumask *online_target_cpus(void)
{
 return ((const struct cpumask *)&__cpu_online_mask);
}

extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(u16) x86_bios_cpu_apicid; extern __typeof__(u16) * x86_bios_cpu_apicid_early_ptr; extern __typeof__(u16) x86_bios_cpu_apicid_early_map[];


static inline __attribute__((no_instrument_function)) unsigned int read_apic_id(void)
{
 unsigned int reg;

 reg = apic_read(0x20);

 return apic->get_apic_id(reg);
}

static inline __attribute__((no_instrument_function)) int default_apic_id_valid(int apicid)
{
 return (apicid < 255);
}

extern int default_acpi_madt_oem_check(char *, char *);

extern void default_setup_apic_routing(void);

extern struct apic apic_noop;
# 548 "./arch/x86/include/asm/apic.h"
static inline __attribute__((no_instrument_function)) int
flat_cpu_mask_to_apicid_and(const struct cpumask *cpumask,
       const struct cpumask *andmask,
       unsigned int *apicid)
{
 unsigned long cpu_mask = ((cpumask)->bits)[0] &
     ((andmask)->bits)[0] &
     ((((const struct cpumask *)&__cpu_online_mask))->bits)[0] &
     0xFFu;

 if (__builtin_expect(!!(cpu_mask), 1)) {
  *apicid = (unsigned int)cpu_mask;
  return 0;
 } else {
  return -22;
 }
}

extern int
default_cpu_mask_to_apicid_and(const struct cpumask *cpumask,
          const struct cpumask *andmask,
          unsigned int *apicid);

static inline __attribute__((no_instrument_function)) void
flat_vector_allocation_domain(int cpu, struct cpumask *retmask,
         const struct cpumask *mask)
{
# 583 "./arch/x86/include/asm/apic.h"
 cpumask_clear(retmask);
 ((retmask)->bits)[0] = 0xFFu;
}

static inline __attribute__((no_instrument_function)) void
default_vector_allocation_domain(int cpu, struct cpumask *retmask,
     const struct cpumask *mask)
{
 cpumask_copy(retmask, (get_cpu_mask(cpu)));
}

static inline __attribute__((no_instrument_function)) unsigned long default_check_apicid_used(physid_mask_t *map, int apicid)
{
 return (__builtin_constant_p((apicid)) ? constant_test_bit((apicid), ((*map).mask)) : variable_test_bit((apicid), ((*map).mask)));
}

static inline __attribute__((no_instrument_function)) void default_ioapic_phys_id_map(physid_mask_t *phys_map, physid_mask_t *retmap)
{
 *retmap = *phys_map;
}

static inline __attribute__((no_instrument_function)) int __default_cpu_present_to_apicid(int mps_cpu)
{
 if (mps_cpu < nr_cpu_ids && cpumask_test_cpu((mps_cpu), ((const struct cpumask *)&__cpu_present_mask)))
  return (int)(*({ do { const void *__vpp_verify = (typeof((&(x86_bios_cpu_apicid)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(x86_bios_cpu_apicid)))) *)((&(x86_bios_cpu_apicid))))); (typeof((typeof(*((&(x86_bios_cpu_apicid)))) *)((&(x86_bios_cpu_apicid))))) (__ptr + (((__per_cpu_offset[(mps_cpu)])))); }); }));
 else
  return 0xFFFFu;
}

static inline __attribute__((no_instrument_function)) int
__default_check_phys_apicid_present(int phys_apicid)
{
 return (__builtin_constant_p((phys_apicid)) ? constant_test_bit((phys_apicid), ((phys_cpu_present_map).mask)) : variable_test_bit((phys_apicid), ((phys_cpu_present_map).mask)));
}
# 630 "./arch/x86/include/asm/apic.h"
extern int default_cpu_present_to_apicid(int mps_cpu);
extern int default_check_phys_apicid_present(int phys_apicid);



extern void irq_enter(void);
extern void irq_exit(void);

static inline __attribute__((no_instrument_function)) void entering_irq(void)
{
 irq_enter();
}

static inline __attribute__((no_instrument_function)) void entering_ack_irq(void)
{
 entering_irq();
 ack_APIC_irq();
}

static inline __attribute__((no_instrument_function)) void ipi_entering_ack_irq(void)
{
 irq_enter();
 ack_APIC_irq();
}

static inline __attribute__((no_instrument_function)) void exiting_irq(void)
{
 irq_exit();
}

static inline __attribute__((no_instrument_function)) void exiting_ack_irq(void)
{
 ack_APIC_irq();
 irq_exit();
}

extern void ioapic_zap_locks(void);
# 13 "./arch/x86/include/asm/smp.h" 2

# 1 "./arch/x86/include/asm/io_apic.h" 1






# 1 "./arch/x86/include/asm/irq_vectors.h" 1
# 8 "./arch/x86/include/asm/io_apic.h" 2
# 27 "./arch/x86/include/asm/io_apic.h"
union IO_APIC_reg_00 {
 u32 raw;
 struct {
  u32 __reserved_2 : 14,
   LTS : 1,
   delivery_type : 1,
   __reserved_1 : 8,
   ID : 8;
 } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_01 {
 u32 raw;
 struct {
  u32 version : 8,
   __reserved_2 : 7,
   PRQ : 1,
   entries : 8,
   __reserved_1 : 8;
 } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_02 {
 u32 raw;
 struct {
  u32 __reserved_2 : 24,
   arbitration : 4,
   __reserved_1 : 4;
 } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_03 {
 u32 raw;
 struct {
  u32 boot_DT : 1,
   __reserved_1 : 31;
 } __attribute__ ((packed)) bits;
};

struct IO_APIC_route_entry {
 __u32 vector : 8,
  delivery_mode : 3,



  dest_mode : 1,
  delivery_status : 1,
  polarity : 1,
  irr : 1,
  trigger : 1,
  mask : 1,
  __reserved_2 : 15;

 __u32 __reserved_3 : 24,
  dest : 8;
} __attribute__ ((packed));

struct IR_IO_APIC_route_entry {
 __u64 vector : 8,
  zero : 3,
  index2 : 1,
  delivery_status : 1,
  polarity : 1,
  irr : 1,
  trigger : 1,
  mask : 1,
  reserved : 31,
  format : 1,
  index : 15;
} __attribute__ ((packed));

struct irq_alloc_info;
struct ioapic_domain_cfg;
# 122 "./arch/x86/include/asm/io_apic.h"
extern int nr_ioapics;

extern int mpc_ioapic_id(int ioapic);
extern unsigned int mpc_ioapic_addr(int ioapic);


extern int mp_irq_entries;


extern struct mpc_intsrc mp_irqs[(256 * 4)];


extern int skip_ioapic_setup;


extern int noioapicquirk;


extern int noioapicreroute;

extern u32 gsi_top;

extern unsigned long io_apic_irqs;
# 155 "./arch/x86/include/asm/io_apic.h"
struct irq_cfg;
extern void ioapic_insert_resources(void);
extern int arch_early_ioapic_init(void);

extern int save_ioapic_entries(void);
extern void mask_ioapic_entries(void);
extern int restore_ioapic_entries(void);

extern void setup_ioapic_ids_from_mpc(void);
extern void setup_ioapic_ids_from_mpc_nocheck(void);

extern int mp_find_ioapic(u32 gsi);
extern int mp_find_ioapic_pin(int ioapic, u32 gsi);
extern int mp_map_gsi_to_irq(u32 gsi, unsigned int flags,
        struct irq_alloc_info *info);
extern void mp_unmap_irq(int irq);
extern int mp_register_ioapic(int id, u32 address, u32 gsi_base,
         struct ioapic_domain_cfg *cfg);
extern int mp_unregister_ioapic(u32 gsi_base);
extern int mp_ioapic_registered(u32 gsi_base);

extern void ioapic_set_alloc_attr(struct irq_alloc_info *info,
      int node, int trigger, int polarity);

extern void mp_save_irq(struct mpc_intsrc *m);

extern void disable_ioapic_support(void);

extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) io_apic_init_mappings(void);
extern unsigned int native_io_apic_read(unsigned int apic, unsigned int reg);
extern void native_disable_io_apic(void);

static inline __attribute__((no_instrument_function)) unsigned int io_apic_read(unsigned int apic, unsigned int reg)
{
 return x86_io_apic_ops.read(apic, reg);
}

extern void setup_IO_APIC(void);
extern void enable_IO_APIC(void);
extern void disable_IO_APIC(void);
extern void setup_ioapic_dest(void);
extern int IO_APIC_get_PCI_irq_vector(int bus, int devfn, int pin);
extern void print_IO_APICs(void);
# 15 "./arch/x86/include/asm/smp.h" 2





extern int smp_num_siblings;
extern unsigned int num_processors;

extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(cpumask_var_t) cpu_sibling_map;
extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(cpumask_var_t) cpu_core_map;

extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(cpumask_var_t) cpu_llc_shared_map;
extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(u16) cpu_llc_id;
extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(int) cpu_number;

static inline __attribute__((no_instrument_function)) struct cpumask *cpu_llc_shared_mask(int cpu)
{
 return (*({ do { const void *__vpp_verify = (typeof((&(cpu_llc_shared_map)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(cpu_llc_shared_map)))) *)((&(cpu_llc_shared_map))))); (typeof((typeof(*((&(cpu_llc_shared_map)))) *)((&(cpu_llc_shared_map))))) (__ptr + (((__per_cpu_offset[(cpu)])))); }); }));
}

extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(u16) x86_cpu_to_apicid; extern __typeof__(u16) * x86_cpu_to_apicid_early_ptr; extern __typeof__(u16) x86_cpu_to_apicid_early_map[];
extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(u32) x86_cpu_to_acpiid; extern __typeof__(u32) * x86_cpu_to_acpiid_early_ptr; extern __typeof__(u32) x86_cpu_to_acpiid_early_map[];
extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(u16) x86_bios_cpu_apicid; extern __typeof__(u16) * x86_bios_cpu_apicid_early_ptr; extern __typeof__(u16) x86_bios_cpu_apicid_early_map[];




struct task_struct;

struct smp_ops {
 void (*smp_prepare_boot_cpu)(void);
 void (*smp_prepare_cpus)(unsigned max_cpus);
 void (*smp_cpus_done)(unsigned max_cpus);

 void (*stop_other_cpus)(int wait);
 void (*crash_stop_other_cpus)(void);
 void (*smp_send_reschedule)(int cpu);

 int (*cpu_up)(unsigned cpu, struct task_struct *tidle);
 int (*cpu_disable)(void);
 void (*cpu_die)(unsigned int cpu);
 void (*play_dead)(void);

 void (*send_call_func_ipi)(const struct cpumask *mask);
 void (*send_call_func_single_ipi)(int cpu);
};


extern void set_cpu_sibling_map(int cpu);


extern struct smp_ops smp_ops;

static inline __attribute__((no_instrument_function)) void smp_send_stop(void)
{
 smp_ops.stop_other_cpus(0);
}

static inline __attribute__((no_instrument_function)) void stop_other_cpus(void)
{
 smp_ops.stop_other_cpus(1);
}

static inline __attribute__((no_instrument_function)) void smp_prepare_boot_cpu(void)
{
 smp_ops.smp_prepare_boot_cpu();
}

static inline __attribute__((no_instrument_function)) void smp_prepare_cpus(unsigned int max_cpus)
{
 smp_ops.smp_prepare_cpus(max_cpus);
}

static inline __attribute__((no_instrument_function)) void smp_cpus_done(unsigned int max_cpus)
{
 smp_ops.smp_cpus_done(max_cpus);
}

static inline __attribute__((no_instrument_function)) int __cpu_up(unsigned int cpu, struct task_struct *tidle)
{
 return smp_ops.cpu_up(cpu, tidle);
}

static inline __attribute__((no_instrument_function)) int __cpu_disable(void)
{
 return smp_ops.cpu_disable();
}

static inline __attribute__((no_instrument_function)) void __cpu_die(unsigned int cpu)
{
 smp_ops.cpu_die(cpu);
}

static inline __attribute__((no_instrument_function)) void play_dead(void)
{
 smp_ops.play_dead();
}

static inline __attribute__((no_instrument_function)) void smp_send_reschedule(int cpu)
{
 smp_ops.smp_send_reschedule(cpu);
}

static inline __attribute__((no_instrument_function)) void arch_send_call_function_single_ipi(int cpu)
{
 smp_ops.send_call_func_single_ipi(cpu);
}

static inline __attribute__((no_instrument_function)) void arch_send_call_function_ipi_mask(const struct cpumask *mask)
{
 smp_ops.send_call_func_ipi(mask);
}

void cpu_disable_common(void);
void native_smp_prepare_boot_cpu(void);
void native_smp_prepare_cpus(unsigned int max_cpus);
void native_smp_cpus_done(unsigned int max_cpus);
void common_cpu_up(unsigned int cpunum, struct task_struct *tidle);
int native_cpu_up(unsigned int cpunum, struct task_struct *tidle);
int native_cpu_disable(void);
int common_cpu_die(unsigned int cpu);
void native_cpu_die(unsigned int cpu);
void hlt_play_dead(void);
void native_play_dead(void);
void play_dead_common(void);
void wbinvd_on_cpu(int cpu);
int wbinvd_on_all_cpus(void);

void native_send_call_func_ipi(const struct cpumask *mask);
void native_send_call_func_single_ipi(int cpu);
void x86_idle_thread_init(unsigned int cpu, struct task_struct *idle);

void smp_store_boot_cpu_info(void);
void smp_store_cpu_info(int id);
# 162 "./arch/x86/include/asm/smp.h"
extern unsigned disabled_cpus;
# 191 "./arch/x86/include/asm/smp.h"
extern int hard_smp_processor_id(void);
# 11 "./arch/x86/include/asm/mmzone_64.h" 2

extern struct pglist_data *node_data[];
# 5 "./arch/x86/include/asm/mmzone.h" 2
# 888 "./include/linux/mmzone.h" 2



extern struct pglist_data *first_online_pgdat(void);
extern struct pglist_data *next_online_pgdat(struct pglist_data *pgdat);
extern struct zone *next_zone(struct zone *zone);
# 923 "./include/linux/mmzone.h"
static inline __attribute__((no_instrument_function)) struct zone *zonelist_zone(struct zoneref *zoneref)
{
 return zoneref->zone;
}

static inline __attribute__((no_instrument_function)) int zonelist_zone_idx(struct zoneref *zoneref)
{
 return zoneref->zone_idx;
}

static inline __attribute__((no_instrument_function)) int zonelist_node_idx(struct zoneref *zoneref)
{


 return zoneref->zone->node;



}

struct zoneref *__next_zones_zonelist(struct zoneref *z,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes);
# 959 "./include/linux/mmzone.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) struct zoneref *next_zones_zonelist(struct zoneref *z,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes)
{
 if (__builtin_expect(!!(!nodes && zonelist_zone_idx(z) <= highest_zoneidx), 1))
  return z;
 return __next_zones_zonelist(z, highest_zoneidx, nodes);
}
# 984 "./include/linux/mmzone.h"
static inline __attribute__((no_instrument_function)) struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes)
{
 return next_zones_zonelist(zonelist->_zonerefs,
       highest_zoneidx, nodes);
}
# 1073 "./include/linux/mmzone.h"
struct page;
struct page_ext;
struct mem_section {
# 1088 "./include/linux/mmzone.h"
 unsigned long section_mem_map;


 unsigned long *pageblock_flags;
# 1104 "./include/linux/mmzone.h"
};
# 1117 "./include/linux/mmzone.h"
extern struct mem_section *mem_section[((((1UL << (46 - 27))) + ((((1UL) << 12) / sizeof (struct mem_section))) - 1) / ((((1UL) << 12) / sizeof (struct mem_section))))];




static inline __attribute__((no_instrument_function)) struct mem_section *__nr_to_section(unsigned long nr)
{
 if (!mem_section[((nr) / (((1UL) << 12) / sizeof (struct mem_section)))])
  return ((void *)0);
 return &mem_section[((nr) / (((1UL) << 12) / sizeof (struct mem_section)))][nr & ((((1UL) << 12) / sizeof (struct mem_section)) - 1)];
}
extern int __section_nr(struct mem_section* ms);
extern unsigned long usemap_size(void);
# 1142 "./include/linux/mmzone.h"
static inline __attribute__((no_instrument_function)) struct page *__section_mem_map_addr(struct mem_section *section)
{
 unsigned long map = section->section_mem_map;
 map &= (~((1UL<<2)-1));
 return (struct page *)map;
}

static inline __attribute__((no_instrument_function)) int present_section(struct mem_section *section)
{
 return (section && (section->section_mem_map & (1UL<<0)));
}

static inline __attribute__((no_instrument_function)) int present_section_nr(unsigned long nr)
{
 return present_section(__nr_to_section(nr));
}

static inline __attribute__((no_instrument_function)) int valid_section(struct mem_section *section)
{
 return (section && (section->section_mem_map & (1UL<<1)));
}

static inline __attribute__((no_instrument_function)) int valid_section_nr(unsigned long nr)
{
 return valid_section(__nr_to_section(nr));
}

static inline __attribute__((no_instrument_function)) struct mem_section *__pfn_to_section(unsigned long pfn)
{
 return __nr_to_section(((pfn) >> (27 - 12)));
}


static inline __attribute__((no_instrument_function)) int pfn_valid(unsigned long pfn)
{
 if (((pfn) >> (27 - 12)) >= (1UL << (46 - 27)))
  return 0;
 return valid_section(__nr_to_section(((pfn) >> (27 - 12))));
}


static inline __attribute__((no_instrument_function)) int pfn_present(unsigned long pfn)
{
 if (((pfn) >> (27 - 12)) >= (1UL << (46 - 27)))
  return 0;
 return present_section(__nr_to_section(((pfn) >> (27 - 12))));
}
# 1206 "./include/linux/mmzone.h"
void sparse_init(void);
# 1217 "./include/linux/mmzone.h"
struct mminit_pfnnid_cache {
 unsigned long last_start;
 unsigned long last_end;
 int last_nid;
};





void memory_present(int nid, unsigned long start, unsigned long end);
unsigned long __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) node_memmap_size_bytes(int, unsigned long, unsigned long);
# 1261 "./include/linux/mmzone.h"
static inline __attribute__((no_instrument_function)) bool memmap_valid_within(unsigned long pfn,
     struct page *page, struct zone *zone)
{
 return true;
}
# 6 "./include/linux/gfp.h" 2


# 1 "./include/linux/topology.h" 1
# 33 "./include/linux/topology.h"
# 1 "./include/linux/smp.h" 1
# 14 "./include/linux/smp.h"
# 1 "./include/linux/llist.h" 1
# 66 "./include/linux/llist.h"
struct llist_head {
 struct llist_node *first;
};

struct llist_node {
 struct llist_node *next;
};
# 81 "./include/linux/llist.h"
static inline __attribute__((no_instrument_function)) void init_llist_head(struct llist_head *list)
{
 list->first = ((void *)0);
}
# 175 "./include/linux/llist.h"
static inline __attribute__((no_instrument_function)) bool llist_empty(const struct llist_head *head)
{
 return (*({ __attribute__((unused)) typeof(head->first) __var = ( typeof(head->first)) 0; (volatile typeof(head->first) *)&(head->first); })) == ((void *)0);
}

static inline __attribute__((no_instrument_function)) struct llist_node *llist_next(struct llist_node *node)
{
 return node->next;
}

extern bool llist_add_batch(struct llist_node *new_first,
       struct llist_node *new_last,
       struct llist_head *head);







static inline __attribute__((no_instrument_function)) bool llist_add(struct llist_node *new, struct llist_head *head)
{
 return llist_add_batch(new, new, head);
}
# 208 "./include/linux/llist.h"
static inline __attribute__((no_instrument_function)) struct llist_node *llist_del_all(struct llist_head *head)
{
 return ({ __typeof__ (*((&head->first))) __ret = ((((void *)0))); switch (sizeof(*((&head->first)))) { case 1: asm volatile ("" "xchg" "b %b0, %1\n" : "+q" (__ret), "+m" (*((&head->first))) : : "memory", "cc"); break; case 2: asm volatile ("" "xchg" "w %w0, %1\n" : "+r" (__ret), "+m" (*((&head->first))) : : "memory", "cc"); break; case 4: asm volatile ("" "xchg" "l %0, %1\n" : "+r" (__ret), "+m" (*((&head->first))) : : "memory", "cc"); break; case 8: asm volatile ("" "xchg" "q %q0, %1\n" : "+r" (__ret), "+m" (*((&head->first))) : : "memory", "cc"); break; default: __xchg_wrong_size(); } __ret; });
}

extern struct llist_node *llist_del_first(struct llist_head *head);

struct llist_node *llist_reverse_order(struct llist_node *head);
# 15 "./include/linux/smp.h" 2

typedef void (*smp_call_func_t)(void *info);
struct call_single_data {
 struct llist_node llist;
 smp_call_func_t func;
 void *info;
 unsigned int flags;
};


extern unsigned int total_cpus;

int smp_call_function_single(int cpuid, smp_call_func_t func, void *info,
        int wait);




int on_each_cpu(smp_call_func_t func, void *info, int wait);





void on_each_cpu_mask(const struct cpumask *mask, smp_call_func_t func,
  void *info, bool wait);






void on_each_cpu_cond(bool (*cond_func)(int cpu, void *info),
  smp_call_func_t func, void *info, bool wait,
  gfp_t gfp_flags);

int smp_call_function_single_async(int cpu, struct call_single_data *csd);
# 69 "./include/linux/smp.h"
extern void smp_send_stop(void);




extern void smp_send_reschedule(int cpu);





extern void smp_prepare_cpus(unsigned int max_cpus);




extern int __cpu_up(unsigned int cpunum, struct task_struct *tidle);




extern void smp_cpus_done(unsigned int max_cpus);




int smp_call_function(smp_call_func_t func, void *info, int wait);
void smp_call_function_many(const struct cpumask *mask,
       smp_call_func_t func, void *info, bool wait);

int smp_call_function_any(const struct cpumask *mask,
     smp_call_func_t func, void *info, int wait);

void kick_all_cpus_sync(void);
void wake_up_all_idle_cpus(void);




void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) call_function_init(void);
void generic_smp_call_function_single_interrupt(void);







void smp_prepare_boot_cpu(void);

extern unsigned int setup_max_cpus;
extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) setup_nr_cpu_ids(void);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) smp_init(void);
# 192 "./include/linux/smp.h"
extern void arch_disable_smp_support(void);

extern void arch_enable_nonboot_cpus_begin(void);
extern void arch_enable_nonboot_cpus_end(void);

void smp_setup_processor_id(void);

int smp_call_on_cpu(unsigned int cpu, int (*func)(void *), void *par,
      bool phys);


int smpcfd_prepare_cpu(unsigned int cpu);
int smpcfd_dead_cpu(unsigned int cpu);
int smpcfd_dying_cpu(unsigned int cpu);
# 34 "./include/linux/topology.h" 2
# 1 "./include/linux/percpu.h" 1
# 51 "./include/linux/percpu.h"
extern void *pcpu_base_addr;
extern const unsigned long *pcpu_unit_offsets;

struct pcpu_group_info {
 int nr_units;
 unsigned long base_offset;
 unsigned int *cpu_map;

};

struct pcpu_alloc_info {
 size_t static_size;
 size_t reserved_size;
 size_t dyn_size;
 size_t unit_size;
 size_t atom_size;
 size_t alloc_size;
 size_t __ai_size;
 int nr_groups;
 struct pcpu_group_info groups[];
};

enum pcpu_fc {
 PCPU_FC_AUTO,
 PCPU_FC_EMBED,
 PCPU_FC_PAGE,

 PCPU_FC_NR,
};
extern const char * const pcpu_fc_names[PCPU_FC_NR];

extern enum pcpu_fc pcpu_chosen_fc;

typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size,
         size_t align);
typedef void (*pcpu_fc_free_fn_t)(void *ptr, size_t size);
typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);

extern struct pcpu_alloc_info * __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) pcpu_alloc_alloc_info(int nr_groups,
            int nr_units);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) pcpu_free_alloc_info(struct pcpu_alloc_info *ai);

extern int __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
      void *base_addr);


extern int __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
    size_t atom_size,
    pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
    pcpu_fc_alloc_fn_t alloc_fn,
    pcpu_fc_free_fn_t free_fn);



extern int __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) pcpu_page_first_chunk(size_t reserved_size,
    pcpu_fc_alloc_fn_t alloc_fn,
    pcpu_fc_free_fn_t free_fn,
    pcpu_fc_populate_pte_fn_t populate_pte_fn);


extern void *__alloc_reserved_percpu(size_t size, size_t align);
extern bool is_kernel_percpu_address(unsigned long addr);




extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) percpu_init_late(void);

extern void *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
extern void *__alloc_percpu(size_t size, size_t align);
extern void free_percpu(void *__pdata);
extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
# 35 "./include/linux/topology.h" 2
# 45 "./include/linux/topology.h"
int arch_update_cpu_topology(void);
# 67 "./include/linux/topology.h"
extern __attribute__((section(".data..percpu" ""))) __typeof__(int) numa_node;



static inline __attribute__((no_instrument_function)) int numa_node_id(void)
{
 return ({ typeof(numa_node) pscr_ret__; do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(numa_node)) { case 1: pscr_ret__ = ({ typeof(numa_node) pfo_ret__; switch (sizeof(numa_node)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (numa_node)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; default: __bad_percpu_size(); } pfo_ret__; }); break; case 2: pscr_ret__ = ({ typeof(numa_node) pfo_ret__; switch (sizeof(numa_node)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (numa_node)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; default: __bad_percpu_size(); } pfo_ret__; }); break; case 4: pscr_ret__ = ({ typeof(numa_node) pfo_ret__; switch (sizeof(numa_node)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (numa_node)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; default: __bad_percpu_size(); } pfo_ret__; }); break; case 8: pscr_ret__ = ({ typeof(numa_node) pfo_ret__; switch (sizeof(numa_node)) { case 1: asm("mov" "b ""%%""gs"":" "%" "1"",%0" : "=q" (pfo_ret__) : "m" (numa_node)); break; case 2: asm("mov" "w ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; case 4: asm("mov" "l ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; case 8: asm("mov" "q ""%%""gs"":" "%" "1"",%0" : "=r" (pfo_ret__) : "m" (numa_node)); break; default: __bad_percpu_size(); } pfo_ret__; }); break; default: __bad_size_call_parameter(); break; } pscr_ret__; });
}



static inline __attribute__((no_instrument_function)) int cpu_to_node(int cpu)
{
 return (*({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(numa_node)))) *)((&(numa_node))))); (typeof((typeof(*((&(numa_node)))) *)((&(numa_node))))) (__ptr + (((__per_cpu_offset[(cpu)])))); }); }));
}



static inline __attribute__((no_instrument_function)) void set_numa_node(int node)
{
 do { do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(numa_node)) { case 1: do { typedef typeof((numa_node)) pto_T__; if (0) { pto_T__ pto_tmp__; pto_tmp__ = (node); (void)pto_tmp__; } switch (sizeof((numa_node))) { case 1: asm("mov" "b %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "qi" ((pto_T__)(node))); break; case 2: asm("mov" "w %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "ri" ((pto_T__)(node))); break; case 4: asm("mov" "l %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "ri" ((pto_T__)(node))); break; case 8: asm("mov" "q %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "re" ((pto_T__)(node))); break; default: __bad_percpu_size(); } } while (0);break; case 2: do { typedef typeof((numa_node)) pto_T__; if (0) { pto_T__ pto_tmp__; pto_tmp__ = (node); (void)pto_tmp__; } switch (sizeof((numa_node))) { case 1: asm("mov" "b %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "qi" ((pto_T__)(node))); break; case 2: asm("mov" "w %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "ri" ((pto_T__)(node))); break; case 4: asm("mov" "l %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "ri" ((pto_T__)(node))); break; case 8: asm("mov" "q %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "re" ((pto_T__)(node))); break; default: __bad_percpu_size(); } } while (0);break; case 4: do { typedef typeof((numa_node)) pto_T__; if (0) { pto_T__ pto_tmp__; pto_tmp__ = (node); (void)pto_tmp__; } switch (sizeof((numa_node))) { case 1: asm("mov" "b %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "qi" ((pto_T__)(node))); break; case 2: asm("mov" "w %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "ri" ((pto_T__)(node))); break; case 4: asm("mov" "l %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "ri" ((pto_T__)(node))); break; case 8: asm("mov" "q %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "re" ((pto_T__)(node))); break; default: __bad_percpu_size(); } } while (0);break; case 8: do { typedef typeof((numa_node)) pto_T__; if (0) { pto_T__ pto_tmp__; pto_tmp__ = (node); (void)pto_tmp__; } switch (sizeof((numa_node))) { case 1: asm("mov" "b %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "qi" ((pto_T__)(node))); break; case 2: asm("mov" "w %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "ri" ((pto_T__)(node))); break; case 4: asm("mov" "l %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "ri" ((pto_T__)(node))); break; case 8: asm("mov" "q %1,""%%""gs"":" "%" "0" : "+m" ((numa_node)) : "re" ((pto_T__)(node))); break; default: __bad_percpu_size(); } } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
}



static inline __attribute__((no_instrument_function)) void set_cpu_numa_node(int cpu, int node)
{
 (*({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(numa_node)))) *)((&(numa_node))))); (typeof((typeof(*((&(numa_node)))) *)((&(numa_node))))) (__ptr + (((__per_cpu_offset[(cpu)])))); }); })) = node;
}
# 162 "./include/linux/topology.h"
static inline __attribute__((no_instrument_function)) int numa_mem_id(void)
{
 return numa_node_id();
}



static inline __attribute__((no_instrument_function)) int node_to_mem_node(int node)
{
 return node;
}



static inline __attribute__((no_instrument_function)) int cpu_to_mem(int cpu)
{
 return cpu_to_node(cpu);
}
# 198 "./include/linux/topology.h"
static inline __attribute__((no_instrument_function)) const struct cpumask *cpu_smt_mask(int cpu)
{
 return ((*({ do { const void *__vpp_verify = (typeof((&(cpu_sibling_map)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(cpu_sibling_map)))) *)((&(cpu_sibling_map))))); (typeof((typeof(*((&(cpu_sibling_map)))) *)((&(cpu_sibling_map))))) (__ptr + (((__per_cpu_offset[(cpu)])))); }); })));
}


static inline __attribute__((no_instrument_function)) const struct cpumask *cpu_cpu_mask(int cpu)
{
 return cpumask_of_node(cpu_to_node(cpu));
}
# 9 "./include/linux/gfp.h" 2

struct vm_area_struct;
# 260 "./include/linux/gfp.h"
static inline __attribute__((no_instrument_function)) int gfpflags_to_migratetype(const gfp_t gfp_flags)
{
 ((void)(sizeof(( long)((gfp_flags & ((( gfp_t)0x10u)|(( gfp_t)0x08u))) == ((( gfp_t)0x10u)|(( gfp_t)0x08u))))));
 do { bool __cond = !(!((1UL << 3) != 0x08u)); extern void __compiletime_assert_263(void) ; if (__cond) __compiletime_assert_263(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0);
 do { bool __cond = !(!((0x08u >> 3) != MIGRATE_MOVABLE)); extern void __compiletime_assert_264(void) ; if (__cond) __compiletime_assert_264(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0);

 if (__builtin_expect(!!(page_group_by_mobility_disabled), 0))
  return MIGRATE_UNMOVABLE;


 return (gfp_flags & ((( gfp_t)0x10u)|(( gfp_t)0x08u))) >> 3;
}



static inline __attribute__((no_instrument_function)) bool gfpflags_allow_blocking(const gfp_t gfp_flags)
{
 return !!(gfp_flags & (( gfp_t)0x400000u));
}
# 370 "./include/linux/gfp.h"
static inline __attribute__((no_instrument_function)) enum zone_type gfp_zone(gfp_t flags)
{
 enum zone_type z;
 int bit = ( int) (flags & ((( gfp_t)0x01u)|(( gfp_t)0x02u)|(( gfp_t)0x04u)|(( gfp_t)0x08u)));

 z = (( (ZONE_NORMAL << 0 * 2) | (ZONE_DMA << 0x01u * 2) | (ZONE_NORMAL << 0x02u * 2) | (ZONE_DMA32 << 0x04u * 2) | (ZONE_NORMAL << 0x08u * 2) | (ZONE_DMA << (0x08u | 0x01u) * 2) | (ZONE_MOVABLE << (0x08u | 0x02u) * 2) | (ZONE_DMA32 << (0x08u | 0x04u) * 2)) >> (bit * 2)) &
      ((1 << 2) - 1);
 ((void)(sizeof(( long)((( 1 << (0x01u | 0x02u) | 1 << (0x01u | 0x04u) | 1 << (0x04u | 0x02u) | 1 << (0x01u | 0x04u | 0x02u) | 1 << (0x08u | 0x02u | 0x01u) | 1 << (0x08u | 0x04u | 0x01u) | 1 << (0x08u | 0x04u | 0x02u) | 1 << (0x08u | 0x04u | 0x01u | 0x02u) ) >> bit) & 1))));
 return z;
}
# 388 "./include/linux/gfp.h"
static inline __attribute__((no_instrument_function)) int gfp_zonelist(gfp_t flags)
{

 if (__builtin_expect(!!(flags & (( gfp_t)0x40000u)), 0))
  return ZONELIST_NOFALLBACK;

 return ZONELIST_FALLBACK;
}
# 406 "./include/linux/gfp.h"
static inline __attribute__((no_instrument_function)) struct zonelist *node_zonelist(int nid, gfp_t flags)
{
 return (node_data[nid])->node_zonelists + gfp_zonelist(flags);
}


static inline __attribute__((no_instrument_function)) void arch_free_page(struct page *page, int order) { }


static inline __attribute__((no_instrument_function)) void arch_alloc_page(struct page *page, int order) { }


struct page *
__alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order,
         struct zonelist *zonelist, nodemask_t *nodemask);

static inline __attribute__((no_instrument_function)) struct page *
__alloc_pages(gfp_t gfp_mask, unsigned int order,
  struct zonelist *zonelist)
{
 return __alloc_pages_nodemask(gfp_mask, order, zonelist, ((void *)0));
}





static inline __attribute__((no_instrument_function)) struct page *
__alloc_pages_node(int nid, gfp_t gfp_mask, unsigned int order)
{
 ((void)(sizeof(( long)(nid < 0 || nid >= (1 << 6)))));
 ((void)(sizeof(( long)(!node_state((nid), N_ONLINE)))));

 return __alloc_pages(gfp_mask, order, node_zonelist(nid, gfp_mask));
}






static inline __attribute__((no_instrument_function)) struct page *alloc_pages_node(int nid, gfp_t gfp_mask,
      unsigned int order)
{
 if (nid == (-1))
  nid = numa_mem_id();

 return __alloc_pages_node(nid, gfp_mask, order);
}


extern struct page *alloc_pages_current(gfp_t gfp_mask, unsigned order);

static inline __attribute__((no_instrument_function)) struct page *
alloc_pages(gfp_t gfp_mask, unsigned int order)
{
 return alloc_pages_current(gfp_mask, order);
}
extern struct page *alloc_pages_vma(gfp_t gfp_mask, int order,
   struct vm_area_struct *vma, unsigned long addr,
   int node, bool hugepage);
# 483 "./include/linux/gfp.h"
extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
extern unsigned long get_zeroed_page(gfp_t gfp_mask);

void *alloc_pages_exact(size_t size, gfp_t gfp_mask);
void free_pages_exact(void *virt, size_t size);
void * __attribute__ ((__section__(".meminit.text"))) __attribute__((no_instrument_function)) alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask);







extern void __free_pages(struct page *page, unsigned int order);
extern void free_pages(unsigned long addr, unsigned int order);
extern void free_hot_cold_page(struct page *page, bool cold);
extern void free_hot_cold_page_list(struct list_head *list, bool cold);

struct page_frag_cache;
extern void __page_frag_cache_drain(struct page *page, unsigned int count);
extern void *page_frag_alloc(struct page_frag_cache *nc,
        unsigned int fragsz, gfp_t gfp_mask);
extern void page_frag_free(void *addr);




void page_alloc_init(void);
void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp);
void drain_all_pages(struct zone *zone);
void drain_local_pages(struct zone *zone);

void page_alloc_init_late(void);
# 524 "./include/linux/gfp.h"
extern gfp_t gfp_allowed_mask;


bool gfp_pfmemalloc_allowed(gfp_t gfp_mask);

extern void pm_restrict_gfp_mask(void);
extern void pm_restore_gfp_mask(void);


extern bool pm_suspended_storage(void);
# 23 "./include/linux/kmod.h" 2




# 1 "./include/linux/sysctl.h" 1
# 27 "./include/linux/sysctl.h"
# 1 "./include/linux/rbtree.h" 1
# 36 "./include/linux/rbtree.h"
struct rb_node {
 unsigned long __rb_parent_color;
 struct rb_node *rb_right;
 struct rb_node *rb_left;
} __attribute__((aligned(sizeof(long))));


struct rb_root {
 struct rb_node *rb_node;
};
# 62 "./include/linux/rbtree.h"
extern void rb_insert_color(struct rb_node *, struct rb_root *);
extern void rb_erase(struct rb_node *, struct rb_root *);



extern struct rb_node *rb_next(const struct rb_node *);
extern struct rb_node *rb_prev(const struct rb_node *);
extern struct rb_node *rb_first(const struct rb_root *);
extern struct rb_node *rb_last(const struct rb_root *);


extern struct rb_node *rb_first_postorder(const struct rb_root *);
extern struct rb_node *rb_next_postorder(const struct rb_node *);


extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
       struct rb_root *root);
extern void rb_replace_node_rcu(struct rb_node *victim, struct rb_node *new,
    struct rb_root *root);

static inline __attribute__((no_instrument_function)) void rb_link_node(struct rb_node *node, struct rb_node *parent,
    struct rb_node **rb_link)
{
 node->__rb_parent_color = (unsigned long)parent;
 node->rb_left = node->rb_right = ((void *)0);

 *rb_link = node;
}

static inline __attribute__((no_instrument_function)) void rb_link_node_rcu(struct rb_node *node, struct rb_node *parent,
        struct rb_node **rb_link)
{
 node->__rb_parent_color = (unsigned long)parent;
 node->rb_left = node->rb_right = ((void *)0);

 ({ uintptr_t _r_a_p__v = (uintptr_t)(node); if (__builtin_constant_p(node) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof((*rb_link)) __val; char __c[1]; } __u = { .__val = ( typeof((*rb_link))) ((typeof(*rb_link))(_r_a_p__v)) }; __write_once_size(&((*rb_link)), __u.__c, sizeof((*rb_link))); __u.__val; }); else do { do { bool __cond = !((sizeof(*&*rb_link) == sizeof(char) || sizeof(*&*rb_link) == sizeof(short) || sizeof(*&*rb_link) == sizeof(int) || sizeof(*&*rb_link) == sizeof(long))); extern void __compiletime_assert_97(void) ; if (__cond) __compiletime_assert_97(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); ({ union { typeof(*&*rb_link) __val; char __c[1]; } __u = { .__val = ( typeof(*&*rb_link)) ((typeof(*((typeof(*rb_link))_r_a_p__v)) *)((typeof(*rb_link))_r_a_p__v)) }; __write_once_size(&(*&*rb_link), __u.__c, sizeof(*&*rb_link)); __u.__val; }); } while (0); _r_a_p__v; });
}
# 28 "./include/linux/sysctl.h" 2

# 1 "./include/uapi/linux/sysctl.h" 1
# 34 "./include/uapi/linux/sysctl.h"
struct __sysctl_args {
 int *name;
 int nlen;
 void *oldval;
 size_t *oldlenp;
 void *newval;
 size_t newlen;
 unsigned long __unused[4];
};





enum
{
 CTL_KERN=1,
 CTL_VM=2,
 CTL_NET=3,
 CTL_PROC=4,
 CTL_FS=5,
 CTL_DEBUG=6,
 CTL_DEV=7,
 CTL_BUS=8,
 CTL_ABI=9,
 CTL_CPU=10,
 CTL_ARLAN=254,
 CTL_S390DBF=5677,
 CTL_SUNRPC=7249,
 CTL_PM=9899,
 CTL_FRV=9898,
};


enum
{
 CTL_BUS_ISA=1
};


enum
{
 INOTIFY_MAX_USER_INSTANCES=1,
 INOTIFY_MAX_USER_WATCHES=2,
 INOTIFY_MAX_QUEUED_EVENTS=3
};


enum
{
 KERN_OSTYPE=1,
 KERN_OSRELEASE=2,
 KERN_OSREV=3,
 KERN_VERSION=4,
 KERN_SECUREMASK=5,
 KERN_PROF=6,
 KERN_NODENAME=7,
 KERN_DOMAINNAME=8,

 KERN_PANIC=15,
 KERN_REALROOTDEV=16,

 KERN_SPARC_REBOOT=21,
 KERN_CTLALTDEL=22,
 KERN_PRINTK=23,
 KERN_NAMETRANS=24,
 KERN_PPC_HTABRECLAIM=25,
 KERN_PPC_ZEROPAGED=26,
 KERN_PPC_POWERSAVE_NAP=27,
 KERN_MODPROBE=28,
 KERN_SG_BIG_BUFF=29,
 KERN_ACCT=30,
 KERN_PPC_L2CR=31,

 KERN_RTSIGNR=32,
 KERN_RTSIGMAX=33,

 KERN_SHMMAX=34,
 KERN_MSGMAX=35,
 KERN_MSGMNB=36,
 KERN_MSGPOOL=37,
 KERN_SYSRQ=38,
 KERN_MAX_THREADS=39,
  KERN_RANDOM=40,
  KERN_SHMALL=41,
  KERN_MSGMNI=42,
  KERN_SEM=43,
  KERN_SPARC_STOP_A=44,
  KERN_SHMMNI=45,
 KERN_OVERFLOWUID=46,
 KERN_OVERFLOWGID=47,
 KERN_SHMPATH=48,
 KERN_HOTPLUG=49,
 KERN_IEEE_EMULATION_WARNINGS=50,
 KERN_S390_USER_DEBUG_LOGGING=51,
 KERN_CORE_USES_PID=52,
 KERN_TAINTED=53,
 KERN_CADPID=54,
 KERN_PIDMAX=55,
   KERN_CORE_PATTERN=56,
 KERN_PANIC_ON_OOPS=57,
 KERN_HPPA_PWRSW=58,
 KERN_HPPA_UNALIGNED=59,
 KERN_PRINTK_RATELIMIT=60,
 KERN_PRINTK_RATELIMIT_BURST=61,
 KERN_PTY=62,
 KERN_NGROUPS_MAX=63,
 KERN_SPARC_SCONS_PWROFF=64,
 KERN_HZ_TIMER=65,
 KERN_UNKNOWN_NMI_PANIC=66,
 KERN_BOOTLOADER_TYPE=67,
 KERN_RANDOMIZE=68,
 KERN_SETUID_DUMPABLE=69,
 KERN_SPIN_RETRY=70,
 KERN_ACPI_VIDEO_FLAGS=71,
 KERN_IA64_UNALIGNED=72,
 KERN_COMPAT_LOG=73,
 KERN_MAX_LOCK_DEPTH=74,
 KERN_NMI_WATCHDOG=75,
 KERN_PANIC_ON_NMI=76,
 KERN_PANIC_ON_WARN=77,
};




enum
{
 VM_UNUSED1=1,
 VM_UNUSED2=2,
 VM_UNUSED3=3,
 VM_UNUSED4=4,
 VM_OVERCOMMIT_MEMORY=5,
 VM_UNUSED5=6,
 VM_UNUSED7=7,
 VM_UNUSED8=8,
 VM_UNUSED9=9,
 VM_PAGE_CLUSTER=10,
 VM_DIRTY_BACKGROUND=11,
 VM_DIRTY_RATIO=12,
 VM_DIRTY_WB_CS=13,
 VM_DIRTY_EXPIRE_CS=14,
 VM_NR_PDFLUSH_THREADS=15,
 VM_OVERCOMMIT_RATIO=16,
 VM_PAGEBUF=17,
 VM_HUGETLB_PAGES=18,
 VM_SWAPPINESS=19,
 VM_LOWMEM_RESERVE_RATIO=20,
 VM_MIN_FREE_KBYTES=21,
 VM_MAX_MAP_COUNT=22,
 VM_LAPTOP_MODE=23,
 VM_BLOCK_DUMP=24,
 VM_HUGETLB_GROUP=25,
 VM_VFS_CACHE_PRESSURE=26,
 VM_LEGACY_VA_LAYOUT=27,
 VM_SWAP_TOKEN_TIMEOUT=28,
 VM_DROP_PAGECACHE=29,
 VM_PERCPU_PAGELIST_FRACTION=30,
 VM_ZONE_RECLAIM_MODE=31,
 VM_MIN_UNMAPPED=32,
 VM_PANIC_ON_OOM=33,
 VM_VDSO_ENABLED=34,
 VM_MIN_SLAB=35,
};



enum
{
 NET_CORE=1,
 NET_ETHER=2,
 NET_802=3,
 NET_UNIX=4,
 NET_IPV4=5,
 NET_IPX=6,
 NET_ATALK=7,
 NET_NETROM=8,
 NET_AX25=9,
 NET_BRIDGE=10,
 NET_ROSE=11,
 NET_IPV6=12,
 NET_X25=13,
 NET_TR=14,
 NET_DECNET=15,
 NET_ECONET=16,
 NET_SCTP=17,
 NET_LLC=18,
 NET_NETFILTER=19,
 NET_DCCP=20,
 NET_IRDA=412,
};


enum
{
 RANDOM_POOLSIZE=1,
 RANDOM_ENTROPY_COUNT=2,
 RANDOM_READ_THRESH=3,
 RANDOM_WRITE_THRESH=4,
 RANDOM_BOOT_ID=5,
 RANDOM_UUID=6
};


enum
{
 PTY_MAX=1,
 PTY_NR=2
};


enum
{
 BUS_ISA_MEM_BASE=1,
 BUS_ISA_PORT_BASE=2,
 BUS_ISA_PORT_SHIFT=3
};


enum
{
 NET_CORE_WMEM_MAX=1,
 NET_CORE_RMEM_MAX=2,
 NET_CORE_WMEM_DEFAULT=3,
 NET_CORE_RMEM_DEFAULT=4,

 NET_CORE_MAX_BACKLOG=6,
 NET_CORE_FASTROUTE=7,
 NET_CORE_MSG_COST=8,
 NET_CORE_MSG_BURST=9,
 NET_CORE_OPTMEM_MAX=10,
 NET_CORE_HOT_LIST_LENGTH=11,
 NET_CORE_DIVERT_VERSION=12,
 NET_CORE_NO_CONG_THRESH=13,
 NET_CORE_NO_CONG=14,
 NET_CORE_LO_CONG=15,
 NET_CORE_MOD_CONG=16,
 NET_CORE_DEV_WEIGHT=17,
 NET_CORE_SOMAXCONN=18,
 NET_CORE_BUDGET=19,
 NET_CORE_AEVENT_ETIME=20,
 NET_CORE_AEVENT_RSEQTH=21,
 NET_CORE_WARNINGS=22,
};







enum
{
 NET_UNIX_DESTROY_DELAY=1,
 NET_UNIX_DELETE_DELAY=2,
 NET_UNIX_MAX_DGRAM_QLEN=3,
};


enum
{
 NET_NF_CONNTRACK_MAX=1,
 NET_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
 NET_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
 NET_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
 NET_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
 NET_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
 NET_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
 NET_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
 NET_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
 NET_NF_CONNTRACK_UDP_TIMEOUT=10,
 NET_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
 NET_NF_CONNTRACK_ICMP_TIMEOUT=12,
 NET_NF_CONNTRACK_GENERIC_TIMEOUT=13,
 NET_NF_CONNTRACK_BUCKETS=14,
 NET_NF_CONNTRACK_LOG_INVALID=15,
 NET_NF_CONNTRACK_TCP_TIMEOUT_MAX_RETRANS=16,
 NET_NF_CONNTRACK_TCP_LOOSE=17,
 NET_NF_CONNTRACK_TCP_BE_LIBERAL=18,
 NET_NF_CONNTRACK_TCP_MAX_RETRANS=19,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_CLOSED=20,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_WAIT=21,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_ECHOED=22,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_ESTABLISHED=23,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_SENT=24,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_RECD=25,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_ACK_SENT=26,
 NET_NF_CONNTRACK_COUNT=27,
 NET_NF_CONNTRACK_ICMPV6_TIMEOUT=28,
 NET_NF_CONNTRACK_FRAG6_TIMEOUT=29,
 NET_NF_CONNTRACK_FRAG6_LOW_THRESH=30,
 NET_NF_CONNTRACK_FRAG6_HIGH_THRESH=31,
 NET_NF_CONNTRACK_CHECKSUM=32,
};


enum
{

 NET_IPV4_FORWARD=8,
 NET_IPV4_DYNADDR=9,

 NET_IPV4_CONF=16,
 NET_IPV4_NEIGH=17,
 NET_IPV4_ROUTE=18,
 NET_IPV4_FIB_HASH=19,
 NET_IPV4_NETFILTER=20,

 NET_IPV4_TCP_TIMESTAMPS=33,
 NET_IPV4_TCP_WINDOW_SCALING=34,
 NET_IPV4_TCP_SACK=35,
 NET_IPV4_TCP_RETRANS_COLLAPSE=36,
 NET_IPV4_DEFAULT_TTL=37,
 NET_IPV4_AUTOCONFIG=38,
 NET_IPV4_NO_PMTU_DISC=39,
 NET_IPV4_TCP_SYN_RETRIES=40,
 NET_IPV4_IPFRAG_HIGH_THRESH=41,
 NET_IPV4_IPFRAG_LOW_THRESH=42,
 NET_IPV4_IPFRAG_TIME=43,
 NET_IPV4_TCP_MAX_KA_PROBES=44,
 NET_IPV4_TCP_KEEPALIVE_TIME=45,
 NET_IPV4_TCP_KEEPALIVE_PROBES=46,
 NET_IPV4_TCP_RETRIES1=47,
 NET_IPV4_TCP_RETRIES2=48,
 NET_IPV4_TCP_FIN_TIMEOUT=49,
 NET_IPV4_IP_MASQ_DEBUG=50,
 NET_TCP_SYNCOOKIES=51,
 NET_TCP_STDURG=52,
 NET_TCP_RFC1337=53,
 NET_TCP_SYN_TAILDROP=54,
 NET_TCP_MAX_SYN_BACKLOG=55,
 NET_IPV4_LOCAL_PORT_RANGE=56,
 NET_IPV4_ICMP_ECHO_IGNORE_ALL=57,
 NET_IPV4_ICMP_ECHO_IGNORE_BROADCASTS=58,
 NET_IPV4_ICMP_SOURCEQUENCH_RATE=59,
 NET_IPV4_ICMP_DESTUNREACH_RATE=60,
 NET_IPV4_ICMP_TIMEEXCEED_RATE=61,
 NET_IPV4_ICMP_PARAMPROB_RATE=62,
 NET_IPV4_ICMP_ECHOREPLY_RATE=63,
 NET_IPV4_ICMP_IGNORE_BOGUS_ERROR_RESPONSES=64,
 NET_IPV4_IGMP_MAX_MEMBERSHIPS=65,
 NET_TCP_TW_RECYCLE=66,
 NET_IPV4_ALWAYS_DEFRAG=67,
 NET_IPV4_TCP_KEEPALIVE_INTVL=68,
 NET_IPV4_INET_PEER_THRESHOLD=69,
 NET_IPV4_INET_PEER_MINTTL=70,
 NET_IPV4_INET_PEER_MAXTTL=71,
 NET_IPV4_INET_PEER_GC_MINTIME=72,
 NET_IPV4_INET_PEER_GC_MAXTIME=73,
 NET_TCP_ORPHAN_RETRIES=74,
 NET_TCP_ABORT_ON_OVERFLOW=75,
 NET_TCP_SYNACK_RETRIES=76,
 NET_TCP_MAX_ORPHANS=77,
 NET_TCP_MAX_TW_BUCKETS=78,
 NET_TCP_FACK=79,
 NET_TCP_REORDERING=80,
 NET_TCP_ECN=81,
 NET_TCP_DSACK=82,
 NET_TCP_MEM=83,
 NET_TCP_WMEM=84,
 NET_TCP_RMEM=85,
 NET_TCP_APP_WIN=86,
 NET_TCP_ADV_WIN_SCALE=87,
 NET_IPV4_NONLOCAL_BIND=88,
 NET_IPV4_ICMP_RATELIMIT=89,
 NET_IPV4_ICMP_RATEMASK=90,
 NET_TCP_TW_REUSE=91,
 NET_TCP_FRTO=92,
 NET_TCP_LOW_LATENCY=93,
 NET_IPV4_IPFRAG_SECRET_INTERVAL=94,
 NET_IPV4_IGMP_MAX_MSF=96,
 NET_TCP_NO_METRICS_SAVE=97,
 NET_TCP_DEFAULT_WIN_SCALE=105,
 NET_TCP_MODERATE_RCVBUF=106,
 NET_TCP_TSO_WIN_DIVISOR=107,
 NET_TCP_BIC_BETA=108,
 NET_IPV4_ICMP_ERRORS_USE_INBOUND_IFADDR=109,
 NET_TCP_CONG_CONTROL=110,
 NET_TCP_ABC=111,
 NET_IPV4_IPFRAG_MAX_DIST=112,
  NET_TCP_MTU_PROBING=113,
 NET_TCP_BASE_MSS=114,
 NET_IPV4_TCP_WORKAROUND_SIGNED_WINDOWS=115,
 NET_TCP_DMA_COPYBREAK=116,
 NET_TCP_SLOW_START_AFTER_IDLE=117,
 NET_CIPSOV4_CACHE_ENABLE=118,
 NET_CIPSOV4_CACHE_BUCKET_SIZE=119,
 NET_CIPSOV4_RBM_OPTFMT=120,
 NET_CIPSOV4_RBM_STRICTVALID=121,
 NET_TCP_AVAIL_CONG_CONTROL=122,
 NET_TCP_ALLOWED_CONG_CONTROL=123,
 NET_TCP_MAX_SSTHRESH=124,
 NET_TCP_FRTO_RESPONSE=125,
};

enum {
 NET_IPV4_ROUTE_FLUSH=1,
 NET_IPV4_ROUTE_MIN_DELAY=2,
 NET_IPV4_ROUTE_MAX_DELAY=3,
 NET_IPV4_ROUTE_GC_THRESH=4,
 NET_IPV4_ROUTE_MAX_SIZE=5,
 NET_IPV4_ROUTE_GC_MIN_INTERVAL=6,
 NET_IPV4_ROUTE_GC_TIMEOUT=7,
 NET_IPV4_ROUTE_GC_INTERVAL=8,
 NET_IPV4_ROUTE_REDIRECT_LOAD=9,
 NET_IPV4_ROUTE_REDIRECT_NUMBER=10,
 NET_IPV4_ROUTE_REDIRECT_SILENCE=11,
 NET_IPV4_ROUTE_ERROR_COST=12,
 NET_IPV4_ROUTE_ERROR_BURST=13,
 NET_IPV4_ROUTE_GC_ELASTICITY=14,
 NET_IPV4_ROUTE_MTU_EXPIRES=15,
 NET_IPV4_ROUTE_MIN_PMTU=16,
 NET_IPV4_ROUTE_MIN_ADVMSS=17,
 NET_IPV4_ROUTE_SECRET_INTERVAL=18,
 NET_IPV4_ROUTE_GC_MIN_INTERVAL_MS=19,
};

enum
{
 NET_PROTO_CONF_ALL=-2,
 NET_PROTO_CONF_DEFAULT=-3


};

enum
{
 NET_IPV4_CONF_FORWARDING=1,
 NET_IPV4_CONF_MC_FORWARDING=2,
 NET_IPV4_CONF_PROXY_ARP=3,
 NET_IPV4_CONF_ACCEPT_REDIRECTS=4,
 NET_IPV4_CONF_SECURE_REDIRECTS=5,
 NET_IPV4_CONF_SEND_REDIRECTS=6,
 NET_IPV4_CONF_SHARED_MEDIA=7,
 NET_IPV4_CONF_RP_FILTER=8,
 NET_IPV4_CONF_ACCEPT_SOURCE_ROUTE=9,
 NET_IPV4_CONF_BOOTP_RELAY=10,
 NET_IPV4_CONF_LOG_MARTIANS=11,
 NET_IPV4_CONF_TAG=12,
 NET_IPV4_CONF_ARPFILTER=13,
 NET_IPV4_CONF_MEDIUM_ID=14,
 NET_IPV4_CONF_NOXFRM=15,
 NET_IPV4_CONF_NOPOLICY=16,
 NET_IPV4_CONF_FORCE_IGMP_VERSION=17,
 NET_IPV4_CONF_ARP_ANNOUNCE=18,
 NET_IPV4_CONF_ARP_IGNORE=19,
 NET_IPV4_CONF_PROMOTE_SECONDARIES=20,
 NET_IPV4_CONF_ARP_ACCEPT=21,
 NET_IPV4_CONF_ARP_NOTIFY=22,
};


enum
{
 NET_IPV4_NF_CONNTRACK_MAX=1,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
 NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT=10,
 NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
 NET_IPV4_NF_CONNTRACK_ICMP_TIMEOUT=12,
 NET_IPV4_NF_CONNTRACK_GENERIC_TIMEOUT=13,
 NET_IPV4_NF_CONNTRACK_BUCKETS=14,
 NET_IPV4_NF_CONNTRACK_LOG_INVALID=15,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_MAX_RETRANS=16,
 NET_IPV4_NF_CONNTRACK_TCP_LOOSE=17,
 NET_IPV4_NF_CONNTRACK_TCP_BE_LIBERAL=18,
 NET_IPV4_NF_CONNTRACK_TCP_MAX_RETRANS=19,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_CLOSED=20,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_WAIT=21,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_ECHOED=22,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_ESTABLISHED=23,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_SENT=24,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_RECD=25,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_ACK_SENT=26,
 NET_IPV4_NF_CONNTRACK_COUNT=27,
 NET_IPV4_NF_CONNTRACK_CHECKSUM=28,
};


enum {
 NET_IPV6_CONF=16,
 NET_IPV6_NEIGH=17,
 NET_IPV6_ROUTE=18,
 NET_IPV6_ICMP=19,
 NET_IPV6_BINDV6ONLY=20,
 NET_IPV6_IP6FRAG_HIGH_THRESH=21,
 NET_IPV6_IP6FRAG_LOW_THRESH=22,
 NET_IPV6_IP6FRAG_TIME=23,
 NET_IPV6_IP6FRAG_SECRET_INTERVAL=24,
 NET_IPV6_MLD_MAX_MSF=25,
};

enum {
 NET_IPV6_ROUTE_FLUSH=1,
 NET_IPV6_ROUTE_GC_THRESH=2,
 NET_IPV6_ROUTE_MAX_SIZE=3,
 NET_IPV6_ROUTE_GC_MIN_INTERVAL=4,
 NET_IPV6_ROUTE_GC_TIMEOUT=5,
 NET_IPV6_ROUTE_GC_INTERVAL=6,
 NET_IPV6_ROUTE_GC_ELASTICITY=7,
 NET_IPV6_ROUTE_MTU_EXPIRES=8,
 NET_IPV6_ROUTE_MIN_ADVMSS=9,
 NET_IPV6_ROUTE_GC_MIN_INTERVAL_MS=10
};

enum {
 NET_IPV6_FORWARDING=1,
 NET_IPV6_HOP_LIMIT=2,
 NET_IPV6_MTU=3,
 NET_IPV6_ACCEPT_RA=4,
 NET_IPV6_ACCEPT_REDIRECTS=5,
 NET_IPV6_AUTOCONF=6,
 NET_IPV6_DAD_TRANSMITS=7,
 NET_IPV6_RTR_SOLICITS=8,
 NET_IPV6_RTR_SOLICIT_INTERVAL=9,
 NET_IPV6_RTR_SOLICIT_DELAY=10,
 NET_IPV6_USE_TEMPADDR=11,
 NET_IPV6_TEMP_VALID_LFT=12,
 NET_IPV6_TEMP_PREFERED_LFT=13,
 NET_IPV6_REGEN_MAX_RETRY=14,
 NET_IPV6_MAX_DESYNC_FACTOR=15,
 NET_IPV6_MAX_ADDRESSES=16,
 NET_IPV6_FORCE_MLD_VERSION=17,
 NET_IPV6_ACCEPT_RA_DEFRTR=18,
 NET_IPV6_ACCEPT_RA_PINFO=19,
 NET_IPV6_ACCEPT_RA_RTR_PREF=20,
 NET_IPV6_RTR_PROBE_INTERVAL=21,
 NET_IPV6_ACCEPT_RA_RT_INFO_MAX_PLEN=22,
 NET_IPV6_PROXY_NDP=23,
 NET_IPV6_ACCEPT_SOURCE_ROUTE=25,
 NET_IPV6_ACCEPT_RA_FROM_LOCAL=26,
 __NET_IPV6_MAX
};


enum {
 NET_IPV6_ICMP_RATELIMIT=1
};


enum {
 NET_NEIGH_MCAST_SOLICIT=1,
 NET_NEIGH_UCAST_SOLICIT=2,
 NET_NEIGH_APP_SOLICIT=3,
 NET_NEIGH_RETRANS_TIME=4,
 NET_NEIGH_REACHABLE_TIME=5,
 NET_NEIGH_DELAY_PROBE_TIME=6,
 NET_NEIGH_GC_STALE_TIME=7,
 NET_NEIGH_UNRES_QLEN=8,
 NET_NEIGH_PROXY_QLEN=9,
 NET_NEIGH_ANYCAST_DELAY=10,
 NET_NEIGH_PROXY_DELAY=11,
 NET_NEIGH_LOCKTIME=12,
 NET_NEIGH_GC_INTERVAL=13,
 NET_NEIGH_GC_THRESH1=14,
 NET_NEIGH_GC_THRESH2=15,
 NET_NEIGH_GC_THRESH3=16,
 NET_NEIGH_RETRANS_TIME_MS=17,
 NET_NEIGH_REACHABLE_TIME_MS=18,
};


enum {
 NET_DCCP_DEFAULT=1,
};


enum {
 NET_IPX_PPROP_BROADCASTING=1,
 NET_IPX_FORWARDING=2
};


enum {
 NET_LLC2=1,
 NET_LLC_STATION=2,
};


enum {
 NET_LLC2_TIMEOUT=1,
};


enum {
 NET_LLC_STATION_ACK_TIMEOUT=1,
};


enum {
 NET_LLC2_ACK_TIMEOUT=1,
 NET_LLC2_P_TIMEOUT=2,
 NET_LLC2_REJ_TIMEOUT=3,
 NET_LLC2_BUSY_TIMEOUT=4,
};


enum {
 NET_ATALK_AARP_EXPIRY_TIME=1,
 NET_ATALK_AARP_TICK_TIME=2,
 NET_ATALK_AARP_RETRANSMIT_LIMIT=3,
 NET_ATALK_AARP_RESOLVE_TIME=4
};



enum {
 NET_NETROM_DEFAULT_PATH_QUALITY=1,
 NET_NETROM_OBSOLESCENCE_COUNT_INITIALISER=2,
 NET_NETROM_NETWORK_TTL_INITIALISER=3,
 NET_NETROM_TRANSPORT_TIMEOUT=4,
 NET_NETROM_TRANSPORT_MAXIMUM_TRIES=5,
 NET_NETROM_TRANSPORT_ACKNOWLEDGE_DELAY=6,
 NET_NETROM_TRANSPORT_BUSY_DELAY=7,
 NET_NETROM_TRANSPORT_REQUESTED_WINDOW_SIZE=8,
 NET_NETROM_TRANSPORT_NO_ACTIVITY_TIMEOUT=9,
 NET_NETROM_ROUTING_CONTROL=10,
 NET_NETROM_LINK_FAILS_COUNT=11,
 NET_NETROM_RESET=12
};


enum {
 NET_AX25_IP_DEFAULT_MODE=1,
 NET_AX25_DEFAULT_MODE=2,
 NET_AX25_BACKOFF_TYPE=3,
 NET_AX25_CONNECT_MODE=4,
 NET_AX25_STANDARD_WINDOW=5,
 NET_AX25_EXTENDED_WINDOW=6,
 NET_AX25_T1_TIMEOUT=7,
 NET_AX25_T2_TIMEOUT=8,
 NET_AX25_T3_TIMEOUT=9,
 NET_AX25_IDLE_TIMEOUT=10,
 NET_AX25_N2=11,
 NET_AX25_PACLEN=12,
 NET_AX25_PROTOCOL=13,
 NET_AX25_DAMA_SLAVE_TIMEOUT=14
};


enum {
 NET_ROSE_RESTART_REQUEST_TIMEOUT=1,
 NET_ROSE_CALL_REQUEST_TIMEOUT=2,
 NET_ROSE_RESET_REQUEST_TIMEOUT=3,
 NET_ROSE_CLEAR_REQUEST_TIMEOUT=4,
 NET_ROSE_ACK_HOLD_BACK_TIMEOUT=5,
 NET_ROSE_ROUTING_CONTROL=6,
 NET_ROSE_LINK_FAIL_TIMEOUT=7,
 NET_ROSE_MAX_VCS=8,
 NET_ROSE_WINDOW_SIZE=9,
 NET_ROSE_NO_ACTIVITY_TIMEOUT=10
};


enum {
 NET_X25_RESTART_REQUEST_TIMEOUT=1,
 NET_X25_CALL_REQUEST_TIMEOUT=2,
 NET_X25_RESET_REQUEST_TIMEOUT=3,
 NET_X25_CLEAR_REQUEST_TIMEOUT=4,
 NET_X25_ACK_HOLD_BACK_TIMEOUT=5,
 NET_X25_FORWARD=6
};


enum
{
 NET_TR_RIF_TIMEOUT=1
};


enum {
 NET_DECNET_NODE_TYPE = 1,
 NET_DECNET_NODE_ADDRESS = 2,
 NET_DECNET_NODE_NAME = 3,
 NET_DECNET_DEFAULT_DEVICE = 4,
 NET_DECNET_TIME_WAIT = 5,
 NET_DECNET_DN_COUNT = 6,
 NET_DECNET_DI_COUNT = 7,
 NET_DECNET_DR_COUNT = 8,
 NET_DECNET_DST_GC_INTERVAL = 9,
 NET_DECNET_CONF = 10,
 NET_DECNET_NO_FC_MAX_CWND = 11,
 NET_DECNET_MEM = 12,
 NET_DECNET_RMEM = 13,
 NET_DECNET_WMEM = 14,
 NET_DECNET_DEBUG_LEVEL = 255
};


enum {
 NET_DECNET_CONF_LOOPBACK = -2,
 NET_DECNET_CONF_DDCMP = -3,
 NET_DECNET_CONF_PPP = -4,
 NET_DECNET_CONF_X25 = -5,
 NET_DECNET_CONF_GRE = -6,
 NET_DECNET_CONF_ETHER = -7


};


enum {
 NET_DECNET_CONF_DEV_PRIORITY = 1,
 NET_DECNET_CONF_DEV_T1 = 2,
 NET_DECNET_CONF_DEV_T2 = 3,
 NET_DECNET_CONF_DEV_T3 = 4,
 NET_DECNET_CONF_DEV_FORWARDING = 5,
 NET_DECNET_CONF_DEV_BLKSIZE = 6,
 NET_DECNET_CONF_DEV_STATE = 7
};


enum {
 NET_SCTP_RTO_INITIAL = 1,
 NET_SCTP_RTO_MIN = 2,
 NET_SCTP_RTO_MAX = 3,
 NET_SCTP_RTO_ALPHA = 4,
 NET_SCTP_RTO_BETA = 5,
 NET_SCTP_VALID_COOKIE_LIFE = 6,
 NET_SCTP_ASSOCIATION_MAX_RETRANS = 7,
 NET_SCTP_PATH_MAX_RETRANS = 8,
 NET_SCTP_MAX_INIT_RETRANSMITS = 9,
 NET_SCTP_HB_INTERVAL = 10,
 NET_SCTP_PRESERVE_ENABLE = 11,
 NET_SCTP_MAX_BURST = 12,
 NET_SCTP_ADDIP_ENABLE = 13,
 NET_SCTP_PRSCTP_ENABLE = 14,
 NET_SCTP_SNDBUF_POLICY = 15,
 NET_SCTP_SACK_TIMEOUT = 16,
 NET_SCTP_RCVBUF_POLICY = 17,
};


enum {
 NET_BRIDGE_NF_CALL_ARPTABLES = 1,
 NET_BRIDGE_NF_CALL_IPTABLES = 2,
 NET_BRIDGE_NF_CALL_IP6TABLES = 3,
 NET_BRIDGE_NF_FILTER_VLAN_TAGGED = 4,
 NET_BRIDGE_NF_FILTER_PPPOE_TAGGED = 5,
};


enum {
 NET_IRDA_DISCOVERY=1,
 NET_IRDA_DEVNAME=2,
 NET_IRDA_DEBUG=3,
 NET_IRDA_FAST_POLL=4,
 NET_IRDA_DISCOVERY_SLOTS=5,
 NET_IRDA_DISCOVERY_TIMEOUT=6,
 NET_IRDA_SLOT_TIMEOUT=7,
 NET_IRDA_MAX_BAUD_RATE=8,
 NET_IRDA_MIN_TX_TURN_TIME=9,
 NET_IRDA_MAX_TX_DATA_SIZE=10,
 NET_IRDA_MAX_TX_WINDOW=11,
 NET_IRDA_MAX_NOREPLY_TIME=12,
 NET_IRDA_WARN_NOREPLY_TIME=13,
 NET_IRDA_LAP_KEEPALIVE_TIME=14,
};



enum
{
 FS_NRINODE=1,
 FS_STATINODE=2,
 FS_MAXINODE=3,
 FS_NRDQUOT=4,
 FS_MAXDQUOT=5,
 FS_NRFILE=6,
 FS_MAXFILE=7,
 FS_DENTRY=8,
 FS_NRSUPER=9,
 FS_MAXSUPER=10,
 FS_OVERFLOWUID=11,
 FS_OVERFLOWGID=12,
 FS_LEASES=13,
 FS_DIR_NOTIFY=14,
 FS_LEASE_TIME=15,
 FS_DQSTATS=16,
 FS_XFS=17,
 FS_AIO_NR=18,
 FS_AIO_MAX_NR=19,
 FS_INOTIFY=20,
 FS_OCFS2=988,
};


enum {
 FS_DQ_LOOKUPS = 1,
 FS_DQ_DROPS = 2,
 FS_DQ_READS = 3,
 FS_DQ_WRITES = 4,
 FS_DQ_CACHE_HITS = 5,
 FS_DQ_ALLOCATED = 6,
 FS_DQ_FREE = 7,
 FS_DQ_SYNCS = 8,
 FS_DQ_WARNINGS = 9,
};




enum {
 DEV_CDROM=1,
 DEV_HWMON=2,
 DEV_PARPORT=3,
 DEV_RAID=4,
 DEV_MAC_HID=5,
 DEV_SCSI=6,
 DEV_IPMI=7,
};


enum {
 DEV_CDROM_INFO=1,
 DEV_CDROM_AUTOCLOSE=2,
 DEV_CDROM_AUTOEJECT=3,
 DEV_CDROM_DEBUG=4,
 DEV_CDROM_LOCK=5,
 DEV_CDROM_CHECK_MEDIA=6
};


enum {
 DEV_PARPORT_DEFAULT=-3
};


enum {
 DEV_RAID_SPEED_LIMIT_MIN=1,
 DEV_RAID_SPEED_LIMIT_MAX=2
};


enum {
 DEV_PARPORT_DEFAULT_TIMESLICE=1,
 DEV_PARPORT_DEFAULT_SPINTIME=2
};


enum {
 DEV_PARPORT_SPINTIME=1,
 DEV_PARPORT_BASE_ADDR=2,
 DEV_PARPORT_IRQ=3,
 DEV_PARPORT_DMA=4,
 DEV_PARPORT_MODES=5,
 DEV_PARPORT_DEVICES=6,
 DEV_PARPORT_AUTOPROBE=16
};


enum {
 DEV_PARPORT_DEVICES_ACTIVE=-3,
};


enum {
 DEV_PARPORT_DEVICE_TIMESLICE=1,
};


enum {
 DEV_MAC_HID_KEYBOARD_SENDS_LINUX_KEYCODES=1,
 DEV_MAC_HID_KEYBOARD_LOCK_KEYCODES=2,
 DEV_MAC_HID_MOUSE_BUTTON_EMULATION=3,
 DEV_MAC_HID_MOUSE_BUTTON2_KEYCODE=4,
 DEV_MAC_HID_MOUSE_BUTTON3_KEYCODE=5,
 DEV_MAC_HID_ADB_MOUSE_SENDS_KEYCODES=6
};


enum {
 DEV_SCSI_LOGGING_LEVEL=1,
};


enum {
 DEV_IPMI_POWEROFF_POWERCYCLE=1,
};


enum
{
 ABI_DEFHANDLER_COFF=1,
 ABI_DEFHANDLER_ELF=2,
 ABI_DEFHANDLER_LCALL7=3,
 ABI_DEFHANDLER_LIBCSO=4,
 ABI_TRACE=5,
 ABI_FAKE_UTSNAME=6,
};
# 30 "./include/linux/sysctl.h" 2


struct completion;
struct ctl_table;
struct nsproxy;
struct ctl_table_root;
struct ctl_table_header;
struct ctl_dir;

typedef int proc_handler (struct ctl_table *ctl, int write,
     void *buffer, size_t *lenp, loff_t *ppos);

extern int proc_dostring(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_dointvec(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_douintvec(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_dointvec_minmax(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_dointvec_jiffies(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int proc_dointvec_userhz_jiffies(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int proc_dointvec_ms_jiffies(struct ctl_table *, int,
        void *, size_t *, loff_t *);
extern int proc_doulongvec_minmax(struct ctl_table *, int,
      void *, size_t *, loff_t *);
extern int proc_doulongvec_ms_jiffies_minmax(struct ctl_table *table, int,
          void *, size_t *, loff_t *);
extern int proc_do_large_bitmap(struct ctl_table *, int,
    void *, size_t *, loff_t *);
# 91 "./include/linux/sysctl.h"
struct ctl_table_poll {
 atomic_t event;
 wait_queue_head_t wait;
};

static inline __attribute__((no_instrument_function)) void *proc_sys_poll_event(struct ctl_table_poll *poll)
{
 return (void *)(unsigned long)atomic_read(&poll->event);
}
# 109 "./include/linux/sysctl.h"
struct ctl_table
{
 const char *procname;
 void *data;
 int maxlen;
 umode_t mode;
 struct ctl_table *child;
 proc_handler *proc_handler;
 struct ctl_table_poll *poll;
 void *extra1;
 void *extra2;
};

struct ctl_node {
 struct rb_node node;
 struct ctl_table_header *header;
};



struct ctl_table_header
{
 union {
  struct {
   struct ctl_table *ctl_table;
   int used;
   int count;
   int nreg;
  };
  struct callback_head rcu;
 };
 struct completion *unregistering;
 struct ctl_table *ctl_table_arg;
 struct ctl_table_root *root;
 struct ctl_table_set *set;
 struct ctl_dir *parent;
 struct ctl_node *node;
 struct list_head inodes;
};

struct ctl_dir {

 struct ctl_table_header header;
 struct rb_root root;
};

struct ctl_table_set {
 int (*is_seen)(struct ctl_table_set *);
 struct ctl_dir dir;
};

struct ctl_table_root {
 struct ctl_table_set default_set;
 struct ctl_table_set *(*lookup)(struct ctl_table_root *root);
 void (*set_ownership)(struct ctl_table_header *head,
         struct ctl_table *table,
         kuid_t *uid, kgid_t *gid);
 int (*permissions)(struct ctl_table_header *head, struct ctl_table *table);
};


struct ctl_path {
 const char *procname;
};



void proc_sys_poll_notify(struct ctl_table_poll *poll);

extern void setup_sysctl_set(struct ctl_table_set *p,
 struct ctl_table_root *root,
 int (*is_seen)(struct ctl_table_set *));
extern void retire_sysctl_set(struct ctl_table_set *set);

void register_sysctl_root(struct ctl_table_root *root);
struct ctl_table_header *__register_sysctl_table(
 struct ctl_table_set *set,
 const char *path, struct ctl_table *table);
struct ctl_table_header *__register_sysctl_paths(
 struct ctl_table_set *set,
 const struct ctl_path *path, struct ctl_table *table);
struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table);
struct ctl_table_header *register_sysctl_table(struct ctl_table * table);
struct ctl_table_header *register_sysctl_paths(const struct ctl_path *path,
      struct ctl_table *table);

void unregister_sysctl_table(struct ctl_table_header * table);

extern int sysctl_init(void);

extern struct ctl_table sysctl_mount_point[];
# 225 "./include/linux/sysctl.h"
int sysctl_max_threads(struct ctl_table *table, int write,
         void *buffer, size_t *lenp, loff_t *ppos);
# 28 "./include/linux/kmod.h" 2




extern char modprobe_path[];


extern __attribute__((format(printf, 2, 3)))
int __request_module(bool wait, const char *name, ...);
# 48 "./include/linux/kmod.h"
struct cred;
struct file;






struct subprocess_info {
 struct work_struct work;
 struct completion *complete;
 const char *path;
 char **argv;
 char **envp;
 int wait;
 int retval;
 int (*init)(struct subprocess_info *info, struct cred *new);
 void (*cleanup)(struct subprocess_info *info);
 void *data;
};

extern int
call_usermodehelper(const char *path, char **argv, char **envp, int wait);

extern struct subprocess_info *
call_usermodehelper_setup(const char *path, char **argv, char **envp,
     gfp_t gfp_mask,
     int (*init)(struct subprocess_info *info, struct cred *new),
     void (*cleanup)(struct subprocess_info *), void *data);

extern int
call_usermodehelper_exec(struct subprocess_info *info, int wait);

extern struct ctl_table usermodehelper_table[];

enum umh_disable_depth {
 UMH_ENABLED = 0,
 UMH_FREEZING,
 UMH_DISABLED,
};

extern int __usermodehelper_disable(enum umh_disable_depth depth);
extern void __usermodehelper_set_disable_depth(enum umh_disable_depth depth);

static inline __attribute__((no_instrument_function)) int usermodehelper_disable(void)
{
 return __usermodehelper_disable(UMH_DISABLED);
}

static inline __attribute__((no_instrument_function)) void usermodehelper_enable(void)
{
 __usermodehelper_set_disable_depth(UMH_ENABLED);
}

extern int usermodehelper_read_trylock(void);
extern long usermodehelper_read_lock_wait(long timeout);
extern void usermodehelper_read_unlock(void);
# 14 "./include/linux/module.h" 2

# 1 "./include/linux/elf.h" 1



# 1 "./arch/x86/include/asm/elf.h" 1
# 10 "./arch/x86/include/asm/elf.h"
# 1 "./arch/x86/include/asm/user.h" 1






# 1 "./arch/x86/include/asm/user_64.h" 1
# 50 "./arch/x86/include/asm/user_64.h"
struct user_i387_struct {
 unsigned short cwd;
 unsigned short swd;
 unsigned short twd;

 unsigned short fop;
 __u64 rip;
 __u64 rdp;
 __u32 mxcsr;
 __u32 mxcsr_mask;
 __u32 st_space[32];
 __u32 xmm_space[64];
 __u32 padding[24];
};




struct user_regs_struct {
 unsigned long r15;
 unsigned long r14;
 unsigned long r13;
 unsigned long r12;
 unsigned long bp;
 unsigned long bx;
 unsigned long r11;
 unsigned long r10;
 unsigned long r9;
 unsigned long r8;
 unsigned long ax;
 unsigned long cx;
 unsigned long dx;
 unsigned long si;
 unsigned long di;
 unsigned long orig_ax;
 unsigned long ip;
 unsigned long cs;
 unsigned long flags;
 unsigned long sp;
 unsigned long ss;
 unsigned long fs_base;
 unsigned long gs_base;
 unsigned long ds;
 unsigned long es;
 unsigned long fs;
 unsigned long gs;
};





struct user {


  struct user_regs_struct regs;

  int u_fpvalid;

  int pad0;
  struct user_i387_struct i387;

  unsigned long int u_tsize;
  unsigned long int u_dsize;
  unsigned long int u_ssize;
  unsigned long start_code;
  unsigned long start_stack;



  long int signal;
  int reserved;
  int pad1;
  unsigned long u_ar0;

  struct user_i387_struct *u_fpstate;
  unsigned long magic;
  char u_comm[32];
  unsigned long u_debugreg[8];
  unsigned long error_code;
  unsigned long fault_address;
};
# 8 "./arch/x86/include/asm/user.h" 2




struct user_ymmh_regs {

 __u32 ymmh_space[64];
};

struct user_xstate_header {
 __u64 xfeatures;
 __u64 reserved1[2];
 __u64 reserved2[5];
};
# 53 "./arch/x86/include/asm/user.h"
struct user_xstateregs {
 struct {
  __u64 fpx_space[58];
  __u64 xstate_fx_sw[6];
 } i387;
 struct user_xstate_header header;
 struct user_ymmh_regs ymmh;

};
# 11 "./arch/x86/include/asm/elf.h" 2
# 1 "./arch/x86/include/uapi/asm/auxvec.h" 1
# 12 "./arch/x86/include/asm/elf.h" 2

typedef unsigned long elf_greg_t;


typedef elf_greg_t elf_gregset_t[(sizeof(struct user_regs_struct) / sizeof(elf_greg_t))];

typedef struct user_i387_struct elf_fpregset_t;
# 76 "./arch/x86/include/asm/elf.h"
# 1 "./arch/x86/include/asm/vdso.h" 1
# 10 "./arch/x86/include/asm/vdso.h"
# 1 "./include/linux/mm_types.h" 1



# 1 "./include/linux/mm_types_task.h" 1
# 29 "./include/linux/mm_types_task.h"
struct vmacache {
 u32 seqnum;
 struct vm_area_struct *vmas[(1U << 2)];
};

enum {
 MM_FILEPAGES,
 MM_ANONPAGES,
 MM_SWAPENTS,
 MM_SHMEMPAGES,
 NR_MM_COUNTERS
};




struct task_rss_stat {
 int events;
 int count[NR_MM_COUNTERS];
};


struct mm_rss_stat {
 atomic_long_t count[NR_MM_COUNTERS];
};

struct page_frag {
 struct page *page;

 __u32 offset;
 __u32 size;




};


struct tlbflush_unmap_batch {





 struct cpumask cpumask;


 bool flush_required;






 bool writable;

};
# 5 "./include/linux/mm_types.h" 2

# 1 "./include/linux/auxvec.h" 1



# 1 "./include/uapi/linux/auxvec.h" 1
# 5 "./include/linux/auxvec.h" 2
# 7 "./include/linux/mm_types.h" 2




# 1 "./include/linux/completion.h" 1
# 25 "./include/linux/completion.h"
struct completion {
 unsigned int done;
 wait_queue_head_t wait;
};
# 73 "./include/linux/completion.h"
static inline __attribute__((no_instrument_function)) void init_completion(struct completion *x)
{
 x->done = 0;
 do { static struct lock_class_key __key; __init_waitqueue_head((&x->wait), "&x->wait", &__key); } while (0);
}
# 86 "./include/linux/completion.h"
static inline __attribute__((no_instrument_function)) void reinit_completion(struct completion *x)
{
 x->done = 0;
}

extern void wait_for_completion(struct completion *);
extern void wait_for_completion_io(struct completion *);
extern int wait_for_completion_interruptible(struct completion *x);
extern int wait_for_completion_killable(struct completion *x);
extern unsigned long wait_for_completion_timeout(struct completion *x,
         unsigned long timeout);
extern unsigned long wait_for_completion_io_timeout(struct completion *x,
          unsigned long timeout);
extern long wait_for_completion_interruptible_timeout(
 struct completion *x, unsigned long timeout);
extern long wait_for_completion_killable_timeout(
 struct completion *x, unsigned long timeout);
extern bool try_wait_for_completion(struct completion *x);
extern bool completion_done(struct completion *x);

extern void complete(struct completion *);
extern void complete_all(struct completion *);
# 12 "./include/linux/mm_types.h" 2

# 1 "./include/linux/uprobes.h" 1
# 32 "./include/linux/uprobes.h"
struct vm_area_struct;
struct mm_struct;
struct inode;
struct notifier_block;
struct page;






enum uprobe_filter_ctx {
 UPROBE_FILTER_REGISTER,
 UPROBE_FILTER_UNREGISTER,
 UPROBE_FILTER_MMAP,
};

struct uprobe_consumer {
 int (*handler)(struct uprobe_consumer *self, struct pt_regs *regs);
 int (*ret_handler)(struct uprobe_consumer *self,
    unsigned long func,
    struct pt_regs *regs);
 bool (*filter)(struct uprobe_consumer *self,
    enum uprobe_filter_ctx ctx,
    struct mm_struct *mm);

 struct uprobe_consumer *next;
};
# 153 "./include/linux/uprobes.h"
struct uprobes_state {
};



static inline __attribute__((no_instrument_function)) int
uprobe_register(struct inode *inode, loff_t offset, struct uprobe_consumer *uc)
{
 return -38;
}
static inline __attribute__((no_instrument_function)) int
uprobe_apply(struct inode *inode, loff_t offset, struct uprobe_consumer *uc, bool add)
{
 return -38;
}
static inline __attribute__((no_instrument_function)) void
uprobe_unregister(struct inode *inode, loff_t offset, struct uprobe_consumer *uc)
{
}
static inline __attribute__((no_instrument_function)) int uprobe_mmap(struct vm_area_struct *vma)
{
 return 0;
}
static inline __attribute__((no_instrument_function)) void
uprobe_munmap(struct vm_area_struct *vma, unsigned long start, unsigned long end)
{
}
static inline __attribute__((no_instrument_function)) void uprobe_start_dup_mmap(void)
{
}
static inline __attribute__((no_instrument_function)) void uprobe_end_dup_mmap(void)
{
}
static inline __attribute__((no_instrument_function)) void
uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm)
{
}
static inline __attribute__((no_instrument_function)) void uprobe_notify_resume(struct pt_regs *regs)
{
}
static inline __attribute__((no_instrument_function)) bool uprobe_deny_signal(void)
{
 return false;
}
static inline __attribute__((no_instrument_function)) void uprobe_free_utask(struct task_struct *t)
{
}
static inline __attribute__((no_instrument_function)) void uprobe_copy_process(struct task_struct *t, unsigned long flags)
{
}
static inline __attribute__((no_instrument_function)) void uprobe_clear_state(struct mm_struct *mm)
{
}
# 14 "./include/linux/mm_types.h" 2
# 24 "./include/linux/mm_types.h"
struct address_space;
struct mem_cgroup;
# 40 "./include/linux/mm_types.h"
struct page {

 unsigned long flags;

 union {
  struct address_space *mapping;






  void *s_mem;
  atomic_t compound_mapcount;

 };


 union {
  unsigned long index;
  void *freelist;

 };

 union {



  unsigned long counters;
# 77 "./include/linux/mm_types.h"
  struct {

   union {
# 89 "./include/linux/mm_types.h"
    atomic_t _mapcount;

    unsigned int active;
    struct {
     unsigned inuse:16;
     unsigned objects:15;
     unsigned frozen:1;
    };
    int units;
   };




   atomic_t _refcount;
  };
 };
# 114 "./include/linux/mm_types.h"
 union {
  struct list_head lru;




  struct dev_pagemap *pgmap;




  struct {
   struct page *next;

   int pages;
   int pobjects;




  };

  struct callback_head callback_head;



  struct {
   unsigned long compound_head;
# 151 "./include/linux/mm_types.h"
   unsigned int compound_dtor;
   unsigned int compound_order;




  };
# 168 "./include/linux/mm_types.h"
 };


 union {
  unsigned long private;
# 183 "./include/linux/mm_types.h"
  spinlock_t ptl;


  struct kmem_cache *slab_cache;
 };
# 219 "./include/linux/mm_types.h"
}





 __attribute__((aligned(2 * sizeof(unsigned long))))

;




struct page_frag_cache {
 void * va;

 __u16 offset;
 __u16 size;






 unsigned int pagecnt_bias;
 bool pfmemalloc;
};

typedef unsigned long vm_flags_t;






struct vm_region {
 struct rb_node vm_rb;
 vm_flags_t vm_flags;
 unsigned long vm_start;
 unsigned long vm_end;
 unsigned long vm_top;
 unsigned long vm_pgoff;
 struct file *vm_file;

 int vm_usage;
 bool vm_icache_flushed : 1;

};
# 275 "./include/linux/mm_types.h"
struct vm_userfaultfd_ctx {};
# 284 "./include/linux/mm_types.h"
struct vm_area_struct {


 unsigned long vm_start;
 unsigned long vm_end;



 struct vm_area_struct *vm_next, *vm_prev;

 struct rb_node vm_rb;







 unsigned long rb_subtree_gap;



 struct mm_struct *vm_mm;
 pgprot_t vm_page_prot;
 unsigned long vm_flags;





 struct {
  struct rb_node rb;
  unsigned long rb_subtree_last;
 } shared;







 struct list_head anon_vma_chain;

 struct anon_vma *anon_vma;


 const struct vm_operations_struct *vm_ops;


 unsigned long vm_pgoff;

 struct file * vm_file;
 void * vm_private_data;





 struct mempolicy *vm_policy;

 struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
};

struct core_thread {
 struct task_struct *task;
 struct core_thread *next;
};

struct core_state {
 atomic_t nr_threads;
 struct core_thread dumper;
 struct completion startup;
};

struct kioctx_table;
struct mm_struct {
 struct vm_area_struct *mmap;
 struct rb_root mm_rb;
 u32 vmacache_seqnum;

 unsigned long (*get_unmapped_area) (struct file *filp,
    unsigned long addr, unsigned long len,
    unsigned long pgoff, unsigned long flags);

 unsigned long mmap_base;
 unsigned long mmap_legacy_base;
 unsigned long task_size;
 unsigned long highest_vm_end;
 pgd_t * pgd;
# 383 "./include/linux/mm_types.h"
 atomic_t mm_users;
# 392 "./include/linux/mm_types.h"
 atomic_t mm_count;

 atomic_long_t nr_ptes;

 atomic_long_t nr_pmds;

 int map_count;

 spinlock_t page_table_lock;
 struct rw_semaphore mmap_sem;

 struct list_head mmlist;





 unsigned long hiwater_rss;
 unsigned long hiwater_vm;

 unsigned long total_vm;
 unsigned long locked_vm;
 unsigned long pinned_vm;
 unsigned long data_vm;
 unsigned long exec_vm;
 unsigned long stack_vm;
 unsigned long def_flags;
 unsigned long start_code, end_code, start_data, end_data;
 unsigned long start_brk, brk, start_stack;
 unsigned long arg_start, arg_end, env_start, env_end;

 unsigned long saved_auxv[(2*(2 + 20 + 1))];





 struct mm_rss_stat rss_stat;

 struct linux_binfmt *binfmt;

 cpumask_var_t cpu_vm_mask_var;


 mm_context_t context;

 unsigned long flags;

 struct core_state *core_state;

 spinlock_t ioctx_lock;
 struct kioctx_table *ioctx_table;
# 458 "./include/linux/mm_types.h"
 struct user_namespace *user_ns;


 struct file *exe_file;

 struct mmu_notifier_mm *mmu_notifier_mm;
# 491 "./include/linux/mm_types.h"
 bool tlb_flush_pending;

 struct uprobes_state uprobes_state;

 atomic_long_t hugetlb_usage;

 struct work_struct async_put_work;
};

extern struct mm_struct init_mm;

static inline __attribute__((no_instrument_function)) void mm_init_cpumask(struct mm_struct *mm)
{



 cpumask_clear(mm->cpu_vm_mask_var);
}


static inline __attribute__((no_instrument_function)) cpumask_t *mm_cpumask(struct mm_struct *mm)
{
 return mm->cpu_vm_mask_var;
}
# 523 "./include/linux/mm_types.h"
static inline __attribute__((no_instrument_function)) bool mm_tlb_flush_pending(struct mm_struct *mm)
{
 __asm__ __volatile__("": : :"memory");
 return mm->tlb_flush_pending;
}
static inline __attribute__((no_instrument_function)) void set_tlb_flush_pending(struct mm_struct *mm)
{
 mm->tlb_flush_pending = true;





 __asm__ __volatile__("": : :"memory");
}

static inline __attribute__((no_instrument_function)) void clear_tlb_flush_pending(struct mm_struct *mm)
{
 __asm__ __volatile__("": : :"memory");
 mm->tlb_flush_pending = false;
}
# 557 "./include/linux/mm_types.h"
struct vm_fault;

struct vm_special_mapping {
 const char *name;







 struct page **pages;





 int (*fault)(const struct vm_special_mapping *sm,
       struct vm_area_struct *vma,
       struct vm_fault *vmf);

 int (*mremap)(const struct vm_special_mapping *sm,
       struct vm_area_struct *new_vma);
};

enum tlb_flush_reason {
 TLB_FLUSH_ON_TASK_SWITCH,
 TLB_REMOTE_SHOOTDOWN,
 TLB_LOCAL_SHOOTDOWN,
 TLB_LOCAL_MM_SHOOTDOWN,
 TLB_REMOTE_SEND_IPI,
 NR_TLB_FLUSH_REASONS,
};





typedef struct {
 unsigned long val;
} swp_entry_t;
# 11 "./arch/x86/include/asm/vdso.h" 2

struct vdso_image {
 void *data;
 unsigned long size;

 unsigned long alt, alt_len;

 long sym_vvar_start;

 long sym_vvar_page;
 long sym_hpet_page;
 long sym_pvclock_page;
 long sym_VDSO32_NOTE_MASK;
 long sym___kernel_sigreturn;
 long sym___kernel_rt_sigreturn;
 long sym___kernel_vsyscall;
 long sym_int80_landing_pad;
};


extern const struct vdso_image vdso_image_64;







extern const struct vdso_image vdso_image_32;


extern void __attribute__ ((__section__(".init.text"))) __attribute__((no_instrument_function)) init_vdso_image(const struct vdso_image *image);

extern int map_vdso_once(const struct vdso_image *image, unsigned long addr);
# 77 "./arch/x86/include/asm/elf.h" 2


extern unsigned int vdso64_enabled;


extern unsigned int vdso32_enabled;
# 171 "./arch/x86/include/asm/elf.h"
static inline __attribute__((no_instrument_function)) void elf_common_init(struct thread_struct *t,
       struct pt_regs *regs, const u16 ds)
{

                 regs->bx = regs->cx = regs->dx = 0;
 regs->si = regs->di = regs->bp = 0;
 regs->r8 = regs->r9 = regs->r10 = regs->r11 = 0;
 regs->r12 = regs->r13 = regs->r14 = regs->r15 = 0;
 t->fsbase = t->gsbase = 0;
 t->fsindex = t->gsindex = 0;
 t->ds = t->es = ds;
}







void compat_start_thread(struct pt_regs *regs, u32 new_ip, u32 new_sp);


void set_personality_ia32(bool);
# 239 "./arch/x86/include/asm/elf.h"
extern void set_personality_64bit(void);
extern unsigned int sysctl_vsyscall32;
extern int force_personality32;
# 261 "./arch/x86/include/asm/elf.h"
extern u32 elf_hwcap2;
# 286 "./arch/x86/include/asm/elf.h"
struct task_struct;
# 342 "./arch/x86/include/asm/elf.h"
struct linux_binprm;


extern int arch_setup_additional_pages(struct linux_binprm *bprm,
           int uses_interp);
extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
           int uses_interp);





static inline __attribute__((no_instrument_function)) int mmap_is_ia32(void)
{
 return 0 ||
        (1 &&
  test_ti_thread_flag(((struct thread_info *)get_current()), 29));
}


enum align_flags {
 ALIGN_VA_32 = (1UL << (0)),
 ALIGN_VA_64 = (1UL << (1)),
};

struct va_alignment {
 int flags;
 unsigned long mask;
 unsigned long bits;
} __attribute__((__aligned__((1 << (6)))));

extern struct va_alignment va_align;
extern unsigned long align_vdso_addr(unsigned long);
# 5 "./include/linux/elf.h" 2
# 1 "./include/uapi/linux/elf.h" 1




# 1 "./include/uapi/linux/elf-em.h" 1
# 6 "./include/uapi/linux/elf.h" 2


typedef __u32 Elf32_Addr;
typedef __u16 Elf32_Half;
typedef __u32 Elf32_Off;
typedef __s32 Elf32_Sword;
typedef __u32 Elf32_Word;


typedef __u64 Elf64_Addr;
typedef __u16 Elf64_Half;
typedef __s16 Elf64_SHalf;
typedef __u64 Elf64_Off;
typedef __s32 Elf64_Sword;
typedef __u32 Elf64_Word;
typedef __u64 Elf64_Xword;
typedef __s64 Elf64_Sxword;
# 137 "./include/uapi/linux/elf.h"
typedef struct dynamic{
  Elf32_Sword d_tag;
  union{
    Elf32_Sword d_val;
    Elf32_Addr d_ptr;
  } d_un;
} Elf32_Dyn;

typedef struct {
  Elf64_Sxword d_tag;
  union {
    Elf64_Xword d_val;
    Elf64_Addr d_ptr;
  } d_un;
} Elf64_Dyn;
# 160 "./include/uapi/linux/elf.h"
typedef struct elf32_rel {
  Elf32_Addr r_offset;
  Elf32_Word r_info;
} Elf32_Rel;

typedef struct elf64_rel {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
} Elf64_Rel;

typedef struct elf32_rela{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
  Elf32_Sword r_addend;
} Elf32_Rela;

typedef struct elf64_rela {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
  Elf64_Sxword r_addend;
} Elf64_Rela;

typedef struct elf32_sym{
  Elf32_Word st_name;
  Elf32_Addr st_value;
  Elf32_Word st_size;
  unsigned char st_info;
  unsigned char st_other;
  Elf32_Half st_shndx;
} Elf32_Sym;

typedef struct elf64_sym {
  Elf64_Word st_name;
  unsigned char st_info;
  unsigned char st_other;
  Elf64_Half st_shndx;
  Elf64_Addr st_value;
  Elf64_Xword st_size;
} Elf64_Sym;




typedef struct elf32_hdr{
  unsigned char e_ident[16];
  Elf32_Half e_type;
  Elf32_Half e_machine;
  Elf32_Word e_version;
  Elf32_Addr e_entry;
  Elf32_Off e_phoff;
  Elf32_Off e_shoff;
  Elf32_Word e_flags;
  Elf32_Half e_ehsize;
  Elf32_Half e_phentsize;
  Elf32_Half e_phnum;
  Elf32_Half e_shentsize;
  Elf32_Half e_shnum;
  Elf32_Half e_shstrndx;
} Elf32_Ehdr;

typedef struct elf64_hdr {
  unsigned char e_ident[16];
  Elf64_Half e_type;
  Elf64_Half e_machine;
  Elf64_Word e_version;
  Elf64_Addr e_entry;
  Elf64_Off e_phoff;
  Elf64_Off e_shoff;
  Elf64_Word e_flags;
  Elf64_Half e_ehsize;
  Elf64_Half e_phentsize;
  Elf64_Half e_phnum;
  Elf64_Half e_shentsize;
  Elf64_Half e_shnum;
  Elf64_Half e_shstrndx;
} Elf64_Ehdr;







typedef struct elf32_phdr{
  Elf32_Word p_type;
  Elf32_Off p_offset;
  Elf32_Addr p_vaddr;
  Elf32_Addr p_paddr;
  Elf32_Word p_filesz;
  Elf32_Word p_memsz;
  Elf32_Word p_flags;
  Elf32_Word p_align;
} Elf32_Phdr;

typedef struct elf64_phdr {
  Elf64_Word p_type;
  Elf64_Word p_flags;
  Elf64_Off p_offset;
  Elf64_Addr p_vaddr;
  Elf64_Addr p_paddr;
  Elf64_Xword p_filesz;
  Elf64_Xword p_memsz;
  Elf64_Xword p_align;
} Elf64_Phdr;
# 302 "./include/uapi/linux/elf.h"
typedef struct elf32_shdr {
  Elf32_Word sh_name;
  Elf32_Word sh_type;
  Elf32_Word sh_flags;
  Elf32_Addr sh_addr;
  Elf32_Off sh_offset;
  Elf32_Word sh_size;
  Elf32_Word sh_link;
  Elf32_Word sh_info;
  Elf32_Word sh_addralign;
  Elf32_Word sh_entsize;
} Elf32_Shdr;

typedef struct elf64_shdr {
  Elf64_Word sh_name;
  Elf64_Word sh_type;
  Elf64_Xword sh_flags;
  Elf64_Addr sh_addr;
  Elf64_Off sh_offset;
  Elf64_Xword sh_size;
  Elf64_Word sh_link;
  Elf64_Word sh_info;
  Elf64_Xword sh_addralign;
  Elf64_Xword sh_entsize;
} Elf64_Shdr;
# 423 "./include/uapi/linux/elf.h"
typedef struct elf32_note {
  Elf32_Word n_namesz;
  Elf32_Word n_descsz;
  Elf32_Word n_type;
} Elf32_Nhdr;


typedef struct elf64_note {
  Elf64_Word n_namesz;
  Elf64_Word n_descsz;
  Elf64_Word n_type;
} Elf64_Nhdr;
# 6 "./include/linux/elf.h" 2
# 35 "./include/linux/elf.h"
extern Elf64_Dyn _DYNAMIC [];
# 46 "./include/linux/elf.h"
struct file;
struct coredump_params;


static inline __attribute__((no_instrument_function)) int elf_coredump_extra_notes_size(void) { return 0; }
static inline __attribute__((no_instrument_function)) int elf_coredump_extra_notes_write(struct coredump_params *cprm) { return 0; }
# 16 "./include/linux/module.h" 2

# 1 "./include/linux/kobject.h" 1
# 21 "./include/linux/kobject.h"
# 1 "./include/linux/sysfs.h" 1
# 15 "./include/linux/sysfs.h"
# 1 "./include/linux/kernfs.h" 1
# 14 "./include/linux/kernfs.h"
# 1 "./include/linux/idr.h" 1
# 15 "./include/linux/idr.h"
# 1 "./include/linux/radix-tree.h" 1
# 61 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) bool radix_tree_is_internal_node(void *ptr)
{
 return ((unsigned long)ptr & 3UL) ==
    1UL;
}
# 93 "./include/linux/radix-tree.h"
struct radix_tree_node {
 unsigned char shift;
 unsigned char offset;
 unsigned char count;
 unsigned char exceptional;
 struct radix_tree_node *parent;
 struct radix_tree_root *root;
 union {
  struct list_head private_list;
  struct callback_head callback_head;
 };
 void *slots[(1UL << (0 ? 4 : 6))];
 unsigned long tags[3][(((1UL << (0 ? 4 : 6)) + 64 - 1) / 64)];
};





struct radix_tree_root {
 gfp_t gfp_mask;
 struct radix_tree_node *rnode;
};
# 131 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) bool radix_tree_empty(const struct radix_tree_root *root)
{
 return root->rnode == ((void *)0);
}
# 152 "./include/linux/radix-tree.h"
struct radix_tree_iter {
 unsigned long index;
 unsigned long next_index;
 unsigned long tags;
 struct radix_tree_node *node;



};

static inline __attribute__((no_instrument_function)) unsigned int iter_shift(const struct radix_tree_iter *iter)
{



 return 0;

}
# 236 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) void *radix_tree_deref_slot(void **slot)
{
 return ({ typeof(*(*slot)) *________p1 = (typeof(*(*slot)) *)({ typeof((*slot)) _________p1 = ({ union { typeof((*slot)) __val; char __c[1]; } __u; if (1) __read_once_size(&((*slot)), __u.__c, sizeof((*slot))); else __read_once_size_nocheck(&((*slot)), __u.__c, sizeof((*slot))); __u.__val; }); typeof(*((*slot))) *___typecheck_p __attribute__((unused)); do { } while (0); (_________p1); }); do { } while (0); ; ((typeof(*(*slot)) *)(________p1)); });
}
# 250 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) void *radix_tree_deref_slot_protected(void **slot,
       spinlock_t *treelock)
{
 return ({ do { } while (0); ; ((typeof(*(*slot)) *)((*slot))); });
}
# 263 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) int radix_tree_deref_retry(void *arg)
{
 return __builtin_expect(!!(radix_tree_is_internal_node(arg)), 0);
}






static inline __attribute__((no_instrument_function)) int radix_tree_exceptional_entry(void *arg)
{

 return (unsigned long)arg & 2;
}






static inline __attribute__((no_instrument_function)) int radix_tree_exception(void *arg)
{
 return __builtin_expect(!!((unsigned long)arg & 3UL), 0);
}

int __radix_tree_create(struct radix_tree_root *, unsigned long index,
   unsigned order, struct radix_tree_node **nodep,
   void ***slotp);
int __radix_tree_insert(struct radix_tree_root *, unsigned long index,
   unsigned order, void *);
static inline __attribute__((no_instrument_function)) int radix_tree_insert(struct radix_tree_root *root,
   unsigned long index, void *entry)
{
 return __radix_tree_insert(root, index, 0, entry);
}
void *__radix_tree_lookup(const struct radix_tree_root *, unsigned long index,
     struct radix_tree_node **nodep, void ***slotp);
void *radix_tree_lookup(const struct radix_tree_root *, unsigned long);
void **radix_tree_lookup_slot(const struct radix_tree_root *,
     unsigned long index);
typedef void (*radix_tree_update_node_t)(struct radix_tree_node *, void *);
void __radix_tree_replace(struct radix_tree_root *, struct radix_tree_node *,
     void **slot, void *entry,
     radix_tree_update_node_t update_node, void *private);
void radix_tree_iter_replace(struct radix_tree_root *,
  const struct radix_tree_iter *, void **slot, void *entry);
void radix_tree_replace_slot(struct radix_tree_root *,
        void **slot, void *entry);
void __radix_tree_delete_node(struct radix_tree_root *,
         struct radix_tree_node *,
         radix_tree_update_node_t update_node,
         void *private);
void radix_tree_iter_delete(struct radix_tree_root *,
   struct radix_tree_iter *iter, void **slot);
void *radix_tree_delete_item(struct radix_tree_root *, unsigned long, void *);
void *radix_tree_delete(struct radix_tree_root *, unsigned long);
void radix_tree_clear_tags(struct radix_tree_root *, struct radix_tree_node *,
      void **slot);
unsigned int radix_tree_gang_lookup(const struct radix_tree_root *,
   void **results, unsigned long first_index,
   unsigned int max_items);
unsigned int radix_tree_gang_lookup_slot(const struct radix_tree_root *,
   void ***results, unsigned long *indices,
   unsigned long first_index, unsigned int max_items);
int radix_tree_preload(gfp_t gfp_mask);
int radix_tree_maybe_preload(gfp_t gfp_mask);
int radix_tree_maybe_preload_order(gfp_t gfp_mask, int order);
void radix_tree_init(void);
void *radix_tree_tag_set(struct radix_tree_root *,
   unsigned long index, unsigned int tag);
void *radix_tree_tag_clear(struct radix_tree_root *,
   unsigned long index, unsigned int tag);
int radix_tree_tag_get(const struct radix_tree_root *,
   unsigned long index, unsigned int tag);
void radix_tree_iter_tag_set(struct radix_tree_root *,
  const struct radix_tree_iter *iter, unsigned int tag);
void radix_tree_iter_tag_clear(struct radix_tree_root *,
  const struct radix_tree_iter *iter, unsigned int tag);
unsigned int radix_tree_gang_lookup_tag(const struct radix_tree_root *,
  void **results, unsigned long first_index,
  unsigned int max_items, unsigned int tag);
unsigned int radix_tree_gang_lookup_tag_slot(const struct radix_tree_root *,
  void ***results, unsigned long first_index,
  unsigned int max_items, unsigned int tag);
int radix_tree_tagged(const struct radix_tree_root *, unsigned int tag);

static inline __attribute__((no_instrument_function)) void radix_tree_preload_end(void)
{
 __asm__ __volatile__("": : :"memory");
}

int radix_tree_split_preload(unsigned old_order, unsigned new_order, gfp_t);
int radix_tree_split(struct radix_tree_root *, unsigned long index,
   unsigned new_order);
int radix_tree_join(struct radix_tree_root *, unsigned long index,
   unsigned new_order, void *);
void **idr_get_free(struct radix_tree_root *, struct radix_tree_iter *,
   gfp_t, int end);

enum {
 RADIX_TREE_ITER_TAG_MASK = 0x0f,
 RADIX_TREE_ITER_TAGGED = 0x10,
 RADIX_TREE_ITER_CONTIG = 0x20,
};
# 376 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void **
radix_tree_iter_init(struct radix_tree_iter *iter, unsigned long start)
{
# 387 "./include/linux/radix-tree.h"
 iter->index = 0;
 iter->next_index = start;
 return ((void *)0);
}
# 405 "./include/linux/radix-tree.h"
void **radix_tree_next_chunk(const struct radix_tree_root *,
        struct radix_tree_iter *iter, unsigned flags);
# 418 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) void **
radix_tree_iter_lookup(const struct radix_tree_root *root,
   struct radix_tree_iter *iter, unsigned long index)
{
 radix_tree_iter_init(iter, index);
 return radix_tree_next_chunk(root, iter, RADIX_TREE_ITER_CONTIG);
}
# 436 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) void **
radix_tree_iter_find(const struct radix_tree_root *root,
   struct radix_tree_iter *iter, unsigned long index)
{
 radix_tree_iter_init(iter, index);
 return radix_tree_next_chunk(root, iter, 0);
}
# 453 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) __attribute__((warn_unused_result))
void **radix_tree_iter_retry(struct radix_tree_iter *iter)
{
 iter->next_index = iter->index;
 iter->tags = 0;
 return ((void *)0);
}

static inline __attribute__((no_instrument_function)) unsigned long
__radix_tree_iter_add(struct radix_tree_iter *iter, unsigned long slots)
{
 return iter->index + (slots << iter_shift(iter));
}
# 477 "./include/linux/radix-tree.h"
void **__attribute__((warn_unused_result)) radix_tree_iter_resume(void **slot,
     struct radix_tree_iter *iter);







static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) long
radix_tree_chunk_size(struct radix_tree_iter *iter)
{
 return (iter->next_index - iter->index) >> iter_shift(iter);
}






static inline __attribute__((no_instrument_function)) void **__radix_tree_next_slot(void **slot,
    struct radix_tree_iter *iter, unsigned flags)
{
 return slot;
}
# 523 "./include/linux/radix-tree.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void **radix_tree_next_slot(void **slot,
    struct radix_tree_iter *iter, unsigned flags)
{
 if (flags & RADIX_TREE_ITER_TAGGED) {
  iter->tags >>= 1;
  if (__builtin_expect(!!(!iter->tags), 0))
   return ((void *)0);
  if (__builtin_expect(!!(iter->tags & 1ul), 1)) {
   iter->index = __radix_tree_iter_add(iter, 1);
   slot++;
   goto found;
  }
  if (!(flags & RADIX_TREE_ITER_CONTIG)) {
   unsigned offset = __ffs(iter->tags);

   iter->tags >>= offset++;
   iter->index = __radix_tree_iter_add(iter, offset);
   slot += offset;
   goto found;
  }
 } else {
  long count = radix_tree_chunk_size(iter);

  while (--count > 0) {
   slot++;
   iter->index = __radix_tree_iter_add(iter, 1);

   if (__builtin_expect(!!(*slot), 1))
    goto found;
   if (flags & RADIX_TREE_ITER_CONTIG) {

    iter->next_index = 0;
    break;
   }
  }
 }
 return ((void *)0);

 found:
 if (__builtin_expect(!!(radix_tree_is_internal_node(({ typeof(*slot) ________p1 = ({ typeof(*slot) _________p1 = ({ union { typeof(*slot) __val; char __c[1]; } __u; if (1) __read_once_size(&(*slot), __u.__c, sizeof(*slot)); else __read_once_size_nocheck(&(*slot), __u.__c, sizeof(*slot)); __u.__val; }); typeof(*(*slot)) *___typecheck_p __attribute__((unused)); do { } while (0); (_________p1); }); ((typeof(**slot) *)(________p1)); }))), 0))
  return __radix_tree_next_slot(slot, iter, flags);
 return slot;
}
# 16 "./include/linux/idr.h" 2



struct idr {
 struct radix_tree_root idr_rt;
 unsigned int idr_next;
};
# 47 "./include/linux/idr.h"
static inline __attribute__((no_instrument_function)) unsigned int idr_get_cursor(const struct idr *idr)
{
 return ({ union { typeof(idr->idr_next) __val; char __c[1]; } __u; if (1) __read_once_size(&(idr->idr_next), __u.__c, sizeof(idr->idr_next)); else __read_once_size_nocheck(&(idr->idr_next), __u.__c, sizeof(idr->idr_next)); __u.__val; });
}
# 60 "./include/linux/idr.h"
static inline __attribute__((no_instrument_function)) void idr_set_cursor(struct idr *idr, unsigned int val)
{
 ({ union { typeof(idr->idr_next) __val; char __c[1]; } __u = { .__val = ( typeof(idr->idr_next)) (val) }; __write_once_size(&(idr->idr_next), __u.__c, sizeof(idr->idr_next)); __u.__val; });
}
# 82 "./include/linux/idr.h"
void idr_preload(gfp_t gfp_mask);
int idr_alloc(struct idr *, void *entry, int start, int end, gfp_t);
int idr_alloc_cyclic(struct idr *, void *entry, int start, int end, gfp_t);
int idr_for_each(const struct idr *,
   int (*fn)(int id, void *p, void *data), void *data);
void *idr_get_next(struct idr *, int *nextid);
void *idr_replace(struct idr *, void *, int id);
void idr_destroy(struct idr *);

static inline __attribute__((no_instrument_function)) void *idr_remove(struct idr *idr, int id)
{
 return radix_tree_delete_item(&idr->idr_rt, id, ((void *)0));
}

static inline __attribute__((no_instrument_function)) void idr_init(struct idr *idr)
{
 do { (&idr->idr_rt)->gfp_mask = ((( gfp_t)(3 << 25))); (&idr->idr_rt)->rnode = ((void *)0); } while (0);
 idr->idr_next = 0;
}

static inline __attribute__((no_instrument_function)) bool idr_is_empty(const struct idr *idr)
{
 return radix_tree_empty(&idr->idr_rt) &&
  radix_tree_tagged(&idr->idr_rt, 0);
}







static inline __attribute__((no_instrument_function)) void idr_preload_end(void)
{
 __asm__ __volatile__("": : :"memory");
}
# 131 "./include/linux/idr.h"
static inline __attribute__((no_instrument_function)) void *idr_find(const struct idr *idr, int id)
{
 return radix_tree_lookup(&idr->idr_rt, id);
}
# 171 "./include/linux/idr.h"
struct ida_bitmap {
 unsigned long bitmap[(128 / sizeof(long))];
};

extern __attribute__((section(".data..percpu" ""))) __typeof__(struct ida_bitmap *) ida_bitmap;

struct ida {
 struct radix_tree_root ida_rt;
};






int ida_pre_get(struct ida *ida, gfp_t gfp_mask);
int ida_get_new_above(struct ida *ida, int starting_id, int *p_id);
void ida_remove(struct ida *ida, int id);
void ida_destroy(struct ida *ida);

int ida_simple_get(struct ida *ida, unsigned int start, unsigned int end,
     gfp_t gfp_mask);
void ida_simple_remove(struct ida *ida, unsigned int id);

static inline __attribute__((no_instrument_function)) void ida_init(struct ida *ida)
{
 do { (&ida->ida_rt)->gfp_mask = ((( gfp_t)(3 << 25)) | ((( gfp_t)0x1000000u))); (&ida->ida_rt)->rnode = ((void *)0); } while (0);
}
# 207 "./include/linux/idr.h"
static inline __attribute__((no_instrument_function)) int ida_get_new(struct ida *ida, int *p_id)
{
 return ida_get_new_above(ida, 0, p_id);
}

static inline __attribute__((no_instrument_function)) bool ida_is_empty(const struct ida *ida)
{
 return radix_tree_empty(&ida->ida_rt);
}
# 15 "./include/linux/kernfs.h" 2





struct file;
struct dentry;
struct iattr;
struct seq_file;
struct vm_area_struct;
struct super_block;
struct file_system_type;

struct kernfs_open_node;
struct kernfs_iattrs;

enum kernfs_node_type {
 KERNFS_DIR = 0x0001,
 KERNFS_FILE = 0x0002,
 KERNFS_LINK = 0x0004,
};




enum kernfs_node_flag {
 KERNFS_ACTIVATED = 0x0010,
 KERNFS_NS = 0x0020,
 KERNFS_HAS_SEQ_SHOW = 0x0040,
 KERNFS_HAS_MMAP = 0x0080,
 KERNFS_LOCKDEP = 0x0100,
 KERNFS_SUICIDAL = 0x0400,
 KERNFS_SUICIDED = 0x0800,
 KERNFS_EMPTY_DIR = 0x1000,
 KERNFS_HAS_RELEASE = 0x2000,
};


enum kernfs_root_flag {






 KERNFS_ROOT_CREATE_DEACTIVATED = 0x0001,
# 71 "./include/linux/kernfs.h"
 KERNFS_ROOT_EXTRA_OPEN_PERM_CHECK = 0x0002,
};


struct kernfs_elem_dir {
 unsigned long subdirs;

 struct rb_root children;





 struct kernfs_root *root;
};

struct kernfs_elem_symlink {
 struct kernfs_node *target_kn;
};

struct kernfs_elem_attr {
 const struct kernfs_ops *ops;
 struct kernfs_open_node *open;
 loff_t size;
 struct kernfs_node *notify_next;
};
# 107 "./include/linux/kernfs.h"
struct kernfs_node {
 atomic_t count;
 atomic_t active;
# 119 "./include/linux/kernfs.h"
 struct kernfs_node *parent;
 const char *name;

 struct rb_node rb;

 const void *ns;
 unsigned int hash;
 union {
  struct kernfs_elem_dir dir;
  struct kernfs_elem_symlink symlink;
  struct kernfs_elem_attr attr;
 };

 void *priv;

 unsigned short flags;
 umode_t mode;
 unsigned int ino;
 struct kernfs_iattrs *iattr;
};
# 147 "./include/linux/kernfs.h"
struct kernfs_syscall_ops {
 int (*remount_fs)(struct kernfs_root *root, int *flags, char *data);
 int (*show_options)(struct seq_file *sf, struct kernfs_root *root);

 int (*mkdir)(struct kernfs_node *parent, const char *name,
       umode_t mode);
 int (*rmdir)(struct kernfs_node *kn);
 int (*rename)(struct kernfs_node *kn, struct kernfs_node *new_parent,
        const char *new_name);
 int (*show_path)(struct seq_file *sf, struct kernfs_node *kn,
    struct kernfs_root *root);
};

struct kernfs_root {

 struct kernfs_node *kn;
 unsigned int flags;


 struct ida ino_ida;
 struct kernfs_syscall_ops *syscall_ops;


 struct list_head supers;

 wait_queue_head_t deactivate_waitq;
};

struct kernfs_open_file {

 struct kernfs_node *kn;
 struct file *file;
 struct seq_file *seq_file;
 void *priv;


 struct mutex mutex;
 struct mutex prealloc_mutex;
 int event;
 struct list_head list;
 char *prealloc_buf;

 size_t atomic_write_len;
 bool mmapped:1;
 bool released:1;
 const struct vm_operations_struct *vm_ops;
};

struct kernfs_ops {




 int (*open)(struct kernfs_open_file *of);
 void (*release)(struct kernfs_open_file *of);
# 214 "./include/linux/kernfs.h"
 int (*seq_show)(struct seq_file *sf, void *v);

 void *(*seq_start)(struct seq_file *sf, loff_t *ppos);
 void *(*seq_next)(struct seq_file *sf, void *v, loff_t *ppos);
 void (*seq_stop)(struct seq_file *sf, void *v);

 ssize_t (*read)(struct kernfs_open_file *of, char *buf, size_t bytes,
   loff_t off);
# 230 "./include/linux/kernfs.h"
 size_t atomic_write_len;






 bool prealloc;
 ssize_t (*write)(struct kernfs_open_file *of, char *buf, size_t bytes,
    loff_t off);

 int (*mmap)(struct kernfs_open_file *of, struct vm_area_struct *vma);




};



static inline __attribute__((no_instrument_function)) enum kernfs_node_type kernfs_type(struct kernfs_node *kn)
{
 return kn->flags & 0x000f;
}
# 263 "./include/linux/kernfs.h"
static inline __attribute__((no_instrument_function)) void kernfs_enable_ns(struct kernfs_node *kn)
{
 ({ static bool __attribute__ ((__section__(".data.unlikely"))) __warned; int __ret_warn_once = !!(kernfs_type(kn) != KERNFS_DIR); if (__builtin_expect(!!(__ret_warn_once && !__warned), 0)) { __warned = true; ({ int __ret_warn_on = !!(1); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("./include/linux/kernfs.h", 265); __builtin_expect(!!(__ret_warn_on), 0); }); } __builtin_expect(!!(__ret_warn_once), 0); });
 ({ static bool __attribute__ ((__section__(".data.unlikely"))) __warned; int __ret_warn_once = !!(!(({ union { typeof((&kn->dir.children)->rb_node) __val; char __c[1]; } __u; if (1) __read_once_size(&((&kn->dir.children)->rb_node), __u.__c, sizeof((&kn->dir.children)->rb_node)); else __read_once_size_nocheck(&((&kn->dir.children)->rb_node), __u.__c, sizeof((&kn->dir.children)->rb_node)); __u.__val; }) == ((void *)0))); if (__builtin_expect(!!(__ret_warn_once && !__warned), 0)) { __warned = true; ({ int __ret_warn_on = !!(1); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("./include/linux/kernfs.h", 266); __builtin_expect(!!(__ret_warn_on), 0); }); } __builtin_expect(!!(__ret_warn_once), 0); });
 kn->flags |= KERNFS_NS;
}







static inline __attribute__((no_instrument_function)) bool kernfs_ns_enabled(struct kernfs_node *kn)
{
 return kn->flags & KERNFS_NS;
}

int kernfs_name(struct kernfs_node *kn, char *buf, size_t buflen);
int kernfs_path_from_node(struct kernfs_node *root_kn, struct kernfs_node *kn,
     char *buf, size_t buflen);
void pr_cont_kernfs_name(struct kernfs_node *kn);
void pr_cont_kernfs_path(struct kernfs_node *kn);
struct kernfs_node *kernfs_get_parent(struct kernfs_node *kn);
struct kernfs_node *kernfs_find_and_get_ns(struct kernfs_node *parent,
        const char *name, const void *ns);
struct kernfs_node *kernfs_walk_and_get_ns(struct kernfs_node *parent,
        const char *path, const void *ns);
void kernfs_get(struct kernfs_node *kn);
void kernfs_put(struct kernfs_node *kn);

struct kernfs_node *kernfs_node_from_dentry(struct dentry *dentry);
struct kernfs_root *kernfs_root_from_sb(struct super_block *sb);
struct inode *kernfs_get_inode(struct super_block *sb, struct kernfs_node *kn);

struct dentry *kernfs_node_dentry(struct kernfs_node *kn,
      struct super_block *sb);
struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
           unsigned int flags, void *priv);
void kernfs_destroy_root(struct kernfs_root *root);

struct kernfs_node *kernfs_create_dir_ns(struct kernfs_node *parent,
      const char *name, umode_t mode,
      void *priv, const void *ns);
struct kernfs_node *kernfs_create_empty_dir(struct kernfs_node *parent,
         const char *name);
struct kernfs_node *__kernfs_create_file(struct kernfs_node *parent,
      const char *name,
      umode_t mode, loff_t size,
      const struct kernfs_ops *ops,
      void *priv, const void *ns,
      struct lock_class_key *key);
struct kernfs_node *kernfs_create_link(struct kernfs_node *parent,
           const char *name,
           struct kernfs_node *target);
void kernfs_activate(struct kernfs_node *kn);
void kernfs_remove(struct kernfs_node *kn);
void kernfs_break_active_protection(struct kernfs_node *kn);
void kernfs_unbreak_active_protection(struct kernfs_node *kn);
bool kernfs_remove_self(struct kernfs_node *kn);
int kernfs_remove_by_name_ns(struct kernfs_node *parent, const char *name,
        const void *ns);
int kernfs_rename_ns(struct kernfs_node *kn, struct kernfs_node *new_parent,
       const char *new_name, const void *new_ns);
int kernfs_setattr(struct kernfs_node *kn, const struct iattr *iattr);
void kernfs_notify(struct kernfs_node *kn);

const void *kernfs_super_ns(struct super_block *sb);
struct dentry *kernfs_mount_ns(struct file_system_type *fs_type, int flags,
          struct kernfs_root *root, unsigned long magic,
          bool *new_sb_created, const void *ns);
void kernfs_kill_sb(struct super_block *sb);
struct super_block *kernfs_pin_sb(struct kernfs_root *root, const void *ns);

void kernfs_init(void);
# 456 "./include/linux/kernfs.h"
static inline __attribute__((no_instrument_function)) int kernfs_path(struct kernfs_node *kn, char *buf, size_t buflen)
{
 return kernfs_path_from_node(kn, ((void *)0), buf, buflen);
}

static inline __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_find_and_get(struct kernfs_node *kn, const char *name)
{
 return kernfs_find_and_get_ns(kn, name, ((void *)0));
}

static inline __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_walk_and_get(struct kernfs_node *kn, const char *path)
{
 return kernfs_walk_and_get_ns(kn, path, ((void *)0));
}

static inline __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_create_dir(struct kernfs_node *parent, const char *name, umode_t mode,
    void *priv)
{
 return kernfs_create_dir_ns(parent, name, mode, priv, ((void *)0));
}

static inline __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_create_file_ns(struct kernfs_node *parent, const char *name,
        umode_t mode, loff_t size, const struct kernfs_ops *ops,
        void *priv, const void *ns)
{
 struct lock_class_key *key = ((void *)0);




 return __kernfs_create_file(parent, name, mode, size, ops, priv, ns,
        key);
}

static inline __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_create_file(struct kernfs_node *parent, const char *name, umode_t mode,
     loff_t size, const struct kernfs_ops *ops, void *priv)
{
 return kernfs_create_file_ns(parent, name, mode, size, ops, priv, ((void *)0));
}

static inline __attribute__((no_instrument_function)) int kernfs_remove_by_name(struct kernfs_node *parent,
     const char *name)
{
 return kernfs_remove_by_name_ns(parent, name, ((void *)0));
}

static inline __attribute__((no_instrument_function)) int kernfs_rename(struct kernfs_node *kn,
    struct kernfs_node *new_parent,
    const char *new_name)
{
 return kernfs_rename_ns(kn, new_parent, new_name, ((void *)0));
}

static inline __attribute__((no_instrument_function)) struct dentry *
kernfs_mount(struct file_system_type *fs_type, int flags,
  struct kernfs_root *root, unsigned long magic,
  bool *new_sb_created)
{
 return kernfs_mount_ns(fs_type, flags, root,
    magic, new_sb_created, ((void *)0));
}
# 16 "./include/linux/sysfs.h" 2




# 1 "./include/linux/kobject_ns.h" 1
# 20 "./include/linux/kobject_ns.h"
struct sock;
struct kobject;





enum kobj_ns_type {
 KOBJ_NS_TYPE_NONE = 0,
 KOBJ_NS_TYPE_NET,
 KOBJ_NS_TYPES
};
# 40 "./include/linux/kobject_ns.h"
struct kobj_ns_type_operations {
 enum kobj_ns_type type;
 bool (*current_may_mount)(void);
 void *(*grab_current_ns)(void);
 const void *(*netlink_ns)(struct sock *sk);
 const void *(*initial_ns)(void);
 void (*drop_ns)(void *);
};

int kobj_ns_type_register(const struct kobj_ns_type_operations *ops);
int kobj_ns_type_registered(enum kobj_ns_type type);
const struct kobj_ns_type_operations *kobj_child_ns_ops(struct kobject *parent);
const struct kobj_ns_type_operations *kobj_ns_ops(struct kobject *kobj);

bool kobj_ns_current_may_mount(enum kobj_ns_type type);
void *kobj_ns_grab_current(enum kobj_ns_type type);
const void *kobj_ns_netlink(enum kobj_ns_type type, struct sock *sk);
const void *kobj_ns_initial(enum kobj_ns_type type);
void kobj_ns_drop(enum kobj_ns_type type, void *ns);
# 21 "./include/linux/sysfs.h" 2



struct kobject;
struct module;
struct bin_attribute;
enum kobj_ns_type;

struct attribute {
 const char *name;
 umode_t mode;





};
# 83 "./include/linux/sysfs.h"
struct attribute_group {
 const char *name;
 umode_t (*is_visible)(struct kobject *,
           struct attribute *, int);
 umode_t (*is_bin_visible)(struct kobject *,
        struct bin_attribute *, int);
 struct attribute **attrs;
 struct bin_attribute **bin_attrs;
};
# 152 "./include/linux/sysfs.h"
struct file;
struct vm_area_struct;

struct bin_attribute {
 struct attribute attr;
 size_t size;
 void *private;
 ssize_t (*read)(struct file *, struct kobject *, struct bin_attribute *,
   char *, loff_t, size_t);
 ssize_t (*write)(struct file *, struct kobject *, struct bin_attribute *,
    char *, loff_t, size_t);
 int (*mmap)(struct file *, struct kobject *, struct bin_attribute *attr,
      struct vm_area_struct *vma);
};
# 209 "./include/linux/sysfs.h"
struct sysfs_ops {
 ssize_t (*show)(struct kobject *, struct attribute *, char *);
 ssize_t (*store)(struct kobject *, struct attribute *, const char *, size_t);
};



int __attribute__((warn_unused_result)) sysfs_create_dir_ns(struct kobject *kobj, const void *ns);
void sysfs_remove_dir(struct kobject *kobj);
int __attribute__((warn_unused_result)) sysfs_rename_dir_ns(struct kobject *kobj, const char *new_name,
         const void *new_ns);
int __attribute__((warn_unused_result)) sysfs_move_dir_ns(struct kobject *kobj,
       struct kobject *new_parent_kobj,
       const void *new_ns);
int __attribute__((warn_unused_result)) sysfs_create_mount_point(struct kobject *parent_kobj,
       const char *name);
void sysfs_remove_mount_point(struct kobject *parent_kobj,
         const char *name);

int __attribute__((warn_unused_result)) sysfs_create_file_ns(struct kobject *kobj,
          const struct attribute *attr,
          const void *ns);
int __attribute__((warn_unused_result)) sysfs_create_files(struct kobject *kobj,
       const struct attribute **attr);
int __attribute__((warn_unused_result)) sysfs_chmod_file(struct kobject *kobj,
      const struct attribute *attr, umode_t mode);
void sysfs_remove_file_ns(struct kobject *kobj, const struct attribute *attr,
     const void *ns);
bool sysfs_remove_file_self(struct kobject *kobj, const struct attribute *attr);
void sysfs_remove_files(struct kobject *kobj, const struct attribute **attr);

int __attribute__((warn_unused_result)) sysfs_create_bin_file(struct kobject *kobj,
           const struct bin_attribute *attr);
void sysfs_remove_bin_file(struct kobject *kobj,
      const struct bin_attribute *attr);

int __attribute__((warn_unused_result)) sysfs_create_link(struct kobject *kobj, struct kobject *target,
       const char *name);
int __attribute__((warn_unused_result)) sysfs_create_link_nowarn(struct kobject *kobj,
       struct kobject *target,
       const char *name);
void sysfs_remove_link(struct kobject *kobj, const char *name);

int sysfs_rename_link_ns(struct kobject *kobj, struct kobject *target,
    const char *old_name, const char *new_name,
    const void *new_ns);

void sysfs_delete_link(struct kobject *dir, struct kobject *targ,
   const char *name);

int __attribute__((warn_unused_result)) sysfs_create_group(struct kobject *kobj,
        const struct attribute_group *grp);
int __attribute__((warn_unused_result)) sysfs_create_groups(struct kobject *kobj,
         const struct attribute_group **groups);
int sysfs_update_group(struct kobject *kobj,
         const struct attribute_group *grp);
void sysfs_remove_group(struct kobject *kobj,
   const struct attribute_group *grp);
void sysfs_remove_groups(struct kobject *kobj,
    const struct attribute_group **groups);
int sysfs_add_file_to_group(struct kobject *kobj,
   const struct attribute *attr, const char *group);
void sysfs_remove_file_from_group(struct kobject *kobj,
   const struct attribute *attr, const char *group);
int sysfs_merge_group(struct kobject *kobj,
         const struct attribute_group *grp);
void sysfs_unmerge_group(struct kobject *kobj,
         const struct attribute_group *grp);
int sysfs_add_link_to_group(struct kobject *kobj, const char *group_name,
       struct kobject *target, const char *link_name);
void sysfs_remove_link_from_group(struct kobject *kobj, const char *group_name,
      const char *link_name);
int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
          struct kobject *target_kobj,
          const char *target_name);

void sysfs_notify(struct kobject *kobj, const char *dir, const char *attr);

int __attribute__((warn_unused_result)) sysfs_init(void);

static inline __attribute__((no_instrument_function)) void sysfs_enable_ns(struct kernfs_node *kn)
{
 return kernfs_enable_ns(kn);
}
# 491 "./include/linux/sysfs.h"
static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) sysfs_create_file(struct kobject *kobj,
       const struct attribute *attr)
{
 return sysfs_create_file_ns(kobj, attr, ((void *)0));
}

static inline __attribute__((no_instrument_function)) void sysfs_remove_file(struct kobject *kobj,
         const struct attribute *attr)
{
 sysfs_remove_file_ns(kobj, attr, ((void *)0));
}

static inline __attribute__((no_instrument_function)) int sysfs_rename_link(struct kobject *kobj, struct kobject *target,
        const char *old_name, const char *new_name)
{
 return sysfs_rename_link_ns(kobj, target, old_name, new_name, ((void *)0));
}

static inline __attribute__((no_instrument_function)) void sysfs_notify_dirent(struct kernfs_node *kn)
{
 kernfs_notify(kn);
}

static inline __attribute__((no_instrument_function)) struct kernfs_node *sysfs_get_dirent(struct kernfs_node *parent,
         const unsigned char *name)
{
 return kernfs_find_and_get(parent, name);
}

static inline __attribute__((no_instrument_function)) struct kernfs_node *sysfs_get(struct kernfs_node *kn)
{
 kernfs_get(kn);
 return kn;
}

static inline __attribute__((no_instrument_function)) void sysfs_put(struct kernfs_node *kn)
{
 kernfs_put(kn);
}
# 22 "./include/linux/kobject.h" 2


# 1 "./include/linux/kref.h" 1
# 19 "./include/linux/kref.h"
# 1 "./include/linux/refcount.h" 1








typedef struct refcount_struct {
 atomic_t refs;
} refcount_t;



static inline __attribute__((no_instrument_function)) void refcount_set(refcount_t *r, unsigned int n)
{
 atomic_set(&r->refs, n);
}

static inline __attribute__((no_instrument_function)) unsigned int refcount_read(const refcount_t *r)
{
 return atomic_read(&r->refs);
}

extern __attribute__((warn_unused_result)) bool refcount_add_not_zero(unsigned int i, refcount_t *r);
extern void refcount_add(unsigned int i, refcount_t *r);

extern __attribute__((warn_unused_result)) bool refcount_inc_not_zero(refcount_t *r);
extern void refcount_inc(refcount_t *r);

extern __attribute__((warn_unused_result)) bool refcount_sub_and_test(unsigned int i, refcount_t *r);
extern void refcount_sub(unsigned int i, refcount_t *r);

extern __attribute__((warn_unused_result)) bool refcount_dec_and_test(refcount_t *r);
extern void refcount_dec(refcount_t *r);

extern __attribute__((warn_unused_result)) bool refcount_dec_if_one(refcount_t *r);
extern __attribute__((warn_unused_result)) bool refcount_dec_not_one(refcount_t *r);
extern __attribute__((warn_unused_result)) bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock);
extern __attribute__((warn_unused_result)) bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock);
# 20 "./include/linux/kref.h" 2

struct kref {
 refcount_t refcount;
};







static inline __attribute__((no_instrument_function)) void kref_init(struct kref *kref)
{
 refcount_set(&kref->refcount, 1);
}

static inline __attribute__((no_instrument_function)) unsigned int kref_read(const struct kref *kref)
{
 return refcount_read(&kref->refcount);
}





static inline __attribute__((no_instrument_function)) void kref_get(struct kref *kref)
{
 refcount_inc(&kref->refcount);
}
# 67 "./include/linux/kref.h"
static inline __attribute__((no_instrument_function)) int kref_put(struct kref *kref, void (*release)(struct kref *kref))
{
 ({ int __ret_warn_on = !!(release == ((void *)0)); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("./include/linux/kref.h", 69); __builtin_expect(!!(__ret_warn_on), 0); });

 if (refcount_dec_and_test(&kref->refcount)) {
  release(kref);
  return 1;
 }
 return 0;
}

static inline __attribute__((no_instrument_function)) int kref_put_mutex(struct kref *kref,
     void (*release)(struct kref *kref),
     struct mutex *lock)
{
 ({ int __ret_warn_on = !!(release == ((void *)0)); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("./include/linux/kref.h", 82); __builtin_expect(!!(__ret_warn_on), 0); });

 if (refcount_dec_and_mutex_lock(&kref->refcount, lock)) {
  release(kref);
  return 1;
 }
 return 0;
}

static inline __attribute__((no_instrument_function)) int kref_put_lock(struct kref *kref,
    void (*release)(struct kref *kref),
    spinlock_t *lock)
{
 ({ int __ret_warn_on = !!(release == ((void *)0)); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("./include/linux/kref.h", 95); __builtin_expect(!!(__ret_warn_on), 0); });

 if (refcount_dec_and_lock(&kref->refcount, lock)) {
  release(kref);
  return 1;
 }
 return 0;
}
# 120 "./include/linux/kref.h"
static inline __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kref_get_unless_zero(struct kref *kref)
{
 return refcount_inc_not_zero(&kref->refcount);
}
# 25 "./include/linux/kobject.h" 2
# 37 "./include/linux/kobject.h"
extern char uevent_helper[];



extern u64 uevent_seqnum;
# 53 "./include/linux/kobject.h"
enum kobject_action {
 KOBJ_ADD,
 KOBJ_REMOVE,
 KOBJ_CHANGE,
 KOBJ_MOVE,
 KOBJ_ONLINE,
 KOBJ_OFFLINE,
 KOBJ_MAX
};

struct kobject {
 const char *name;
 struct list_head entry;
 struct kobject *parent;
 struct kset *kset;
 struct kobj_type *ktype;
 struct kernfs_node *sd;
 struct kref kref;



 unsigned int state_initialized:1;
 unsigned int state_in_sysfs:1;
 unsigned int state_add_uevent_sent:1;
 unsigned int state_remove_uevent_sent:1;
 unsigned int uevent_suppress:1;
};

extern __attribute__((format(printf, 2, 3)))
int kobject_set_name(struct kobject *kobj, const char *name, ...);
extern __attribute__((format(printf, 2, 0)))
int kobject_set_name_vargs(struct kobject *kobj, const char *fmt,
      va_list vargs);

static inline __attribute__((no_instrument_function)) const char *kobject_name(const struct kobject *kobj)
{
 return kobj->name;
}

extern void kobject_init(struct kobject *kobj, struct kobj_type *ktype);
extern __attribute__((format(printf, 3, 4))) __attribute__((warn_unused_result))
int kobject_add(struct kobject *kobj, struct kobject *parent,
  const char *fmt, ...);
extern __attribute__((format(printf, 4, 5))) __attribute__((warn_unused_result))
int kobject_init_and_add(struct kobject *kobj,
    struct kobj_type *ktype, struct kobject *parent,
    const char *fmt, ...);

extern void kobject_del(struct kobject *kobj);

extern struct kobject * __attribute__((warn_unused_result)) kobject_create(void);
extern struct kobject * __attribute__((warn_unused_result)) kobject_create_and_add(const char *name,
      struct kobject *parent);

extern int __attribute__((warn_unused_result)) kobject_rename(struct kobject *, const char *new_name);
extern int __attribute__((warn_unused_result)) kobject_move(struct kobject *, struct kobject *);

extern struct kobject *kobject_get(struct kobject *kobj);
extern void kobject_put(struct kobject *kobj);

extern const void *kobject_namespace(struct kobject *kobj);
extern char *kobject_get_path(struct kobject *kobj, gfp_t flag);

struct kobj_type {
 void (*release)(struct kobject *kobj);
 const struct sysfs_ops *sysfs_ops;
 struct attribute **default_attrs;
 const struct kobj_ns_type_operations *(*child_ns_type)(struct kobject *kobj);
 const void *(*namespace)(struct kobject *kobj);
};

struct kobj_uevent_env {
 char *argv[3];
 char *envp[32];
 int envp_idx;
 char buf[2048];
 int buflen;
};

struct kset_uevent_ops {
 int (* const filter)(struct kset *kset, struct kobject *kobj);
 const char *(* const name)(struct kset *kset, struct kobject *kobj);
 int (* const uevent)(struct kset *kset, struct kobject *kobj,
        struct kobj_uevent_env *env);
};

struct kobj_attribute {
 struct attribute attr;
 ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
   char *buf);
 ssize_t (*store)(struct kobject *kobj, struct kobj_attribute *attr,
    const char *buf, size_t count);
};

extern const struct sysfs_ops kobj_sysfs_ops;

struct sock;
# 168 "./include/linux/kobject.h"
struct kset {
 struct list_head list;
 spinlock_t list_lock;
 struct kobject kobj;
 const struct kset_uevent_ops *uevent_ops;
};

extern void kset_init(struct kset *kset);
extern int __attribute__((warn_unused_result)) kset_register(struct kset *kset);
extern void kset_unregister(struct kset *kset);
extern struct kset * __attribute__((warn_unused_result)) kset_create_and_add(const char *name,
      const struct kset_uevent_ops *u,
      struct kobject *parent_kobj);

static inline __attribute__((no_instrument_function)) struct kset *to_kset(struct kobject *kobj)
{
 return kobj ? ({ const typeof( ((struct kset *)0)->kobj ) *__mptr = (kobj); (struct kset *)( (char *)__mptr - __builtin_offsetof(struct kset, kobj) );}) : ((void *)0);
}

static inline __attribute__((no_instrument_function)) struct kset *kset_get(struct kset *k)
{
 return k ? to_kset(kobject_get(&k->kobj)) : ((void *)0);
}

static inline __attribute__((no_instrument_function)) void kset_put(struct kset *k)
{
 kobject_put(&k->kobj);
}

static inline __attribute__((no_instrument_function)) struct kobj_type *get_ktype(struct kobject *kobj)
{
 return kobj->ktype;
}

extern struct kobject *kset_find_obj(struct kset *, const char *);


extern struct kobject *kernel_kobj;

extern struct kobject *mm_kobj;

extern struct kobject *hypervisor_kobj;

extern struct kobject *power_kobj;

extern struct kobject *firmware_kobj;

int kobject_uevent(struct kobject *kobj, enum kobject_action action);
int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
   char *envp[]);

__attribute__((format(printf, 2, 3)))
int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...);

int kobject_action_type(const char *buf, size_t count,
   enum kobject_action *type);
# 18 "./include/linux/module.h" 2
# 1 "./include/linux/moduleparam.h" 1
# 37 "./include/linux/moduleparam.h"
struct kernel_param;






enum {
 KERNEL_PARAM_OPS_FL_NOARG = (1 << 0)
};

struct kernel_param_ops {

 unsigned int flags;

 int (*set)(const char *val, const struct kernel_param *kp);

 int (*get)(char *buffer, const struct kernel_param *kp);

 void (*free)(void *arg);
};






enum {
 KERNEL_PARAM_FL_UNSAFE = (1 << 0)
};

struct kernel_param {
 const char *name;
 struct module *mod;
 const struct kernel_param_ops *ops;
 const u16 perm;
 s8 level;
 u8 flags;
 union {
  void *arg;
  const struct kparam_string *str;
  const struct kparam_array *arr;
 };
};

extern const struct kernel_param __start___param[], __stop___param[];


struct kparam_string {
 unsigned int maxlen;
 char *string;
};


struct kparam_array
{
 unsigned int max;
 unsigned int elemsize;
 unsigned int *num;
 const struct kernel_param_ops *ops;
 void *elem;
};
# 236 "./include/linux/moduleparam.h"
static inline __attribute__((no_instrument_function)) int
__check_old_set_param(int (*oldset)(const char *, struct kernel_param *))
{
 return 0;
}


extern void kernel_param_lock(struct module *mod);
extern void kernel_param_unlock(struct module *mod);
# 307 "./include/linux/moduleparam.h"
extern bool parameq(const char *name1, const char *name2);
# 317 "./include/linux/moduleparam.h"
extern bool parameqn(const char *name1, const char *name2, size_t n);


extern char *parse_args(const char *name,
        char *args,
        const struct kernel_param *params,
        unsigned num,
        s16 level_min,
        s16 level_max,
        void *arg,
        int (*unknown)(char *param, char *val,
         const char *doing, void *arg));



extern void destroy_params(const struct kernel_param *params, unsigned num);
# 346 "./include/linux/moduleparam.h"
extern const struct kernel_param_ops param_ops_byte;
extern int param_set_byte(const char *val, const struct kernel_param *kp);
extern int param_get_byte(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_short;
extern int param_set_short(const char *val, const struct kernel_param *kp);
extern int param_get_short(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_ushort;
extern int param_set_ushort(const char *val, const struct kernel_param *kp);
extern int param_get_ushort(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_int;
extern int param_set_int(const char *val, const struct kernel_param *kp);
extern int param_get_int(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_uint;
extern int param_set_uint(const char *val, const struct kernel_param *kp);
extern int param_get_uint(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_long;
extern int param_set_long(const char *val, const struct kernel_param *kp);
extern int param_get_long(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_ulong;
extern int param_set_ulong(const char *val, const struct kernel_param *kp);
extern int param_get_ulong(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_ullong;
extern int param_set_ullong(const char *val, const struct kernel_param *kp);
extern int param_get_ullong(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_charp;
extern int param_set_charp(const char *val, const struct kernel_param *kp);
extern int param_get_charp(char *buffer, const struct kernel_param *kp);
extern void param_free_charp(void *arg);



extern const struct kernel_param_ops param_ops_bool;
extern int param_set_bool(const char *val, const struct kernel_param *kp);
extern int param_get_bool(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_bool_enable_only;
extern int param_set_bool_enable_only(const char *val,
          const struct kernel_param *kp);



extern const struct kernel_param_ops param_ops_invbool;
extern int param_set_invbool(const char *val, const struct kernel_param *kp);
extern int param_get_invbool(char *buffer, const struct kernel_param *kp);



extern const struct kernel_param_ops param_ops_bint;
extern int param_set_bint(const char *val, const struct kernel_param *kp);
# 454 "./include/linux/moduleparam.h"
extern const struct kernel_param_ops param_array_ops;

extern const struct kernel_param_ops param_ops_string;
extern int param_set_copystring(const char *val, const struct kernel_param *);
extern int param_get_string(char *buffer, const struct kernel_param *kp);



struct module;


extern int module_param_sysfs_setup(struct module *mod,
        const struct kernel_param *kparam,
        unsigned int num_params);

extern void module_param_sysfs_remove(struct module *mod);
# 19 "./include/linux/module.h" 2


# 1 "./include/linux/rbtree_latch.h" 1
# 38 "./include/linux/rbtree_latch.h"
struct latch_tree_node {
 struct rb_node node[2];
};

struct latch_tree_root {
 seqcount_t seq;
 struct rb_root tree[2];
};
# 62 "./include/linux/rbtree_latch.h"
struct latch_tree_ops {
 bool (*less)(struct latch_tree_node *a, struct latch_tree_node *b);
 int (*comp)(void *key, struct latch_tree_node *b);
};

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) struct latch_tree_node *
__lt_from_rb(struct rb_node *node, int idx)
{
 return ({ const typeof( ((struct latch_tree_node *)0)->node[idx] ) *__mptr = (node); (struct latch_tree_node *)( (char *)__mptr - __builtin_offsetof(struct latch_tree_node, node[idx]) );});
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void
__lt_insert(struct latch_tree_node *ltn, struct latch_tree_root *ltr, int idx,
     bool (*less)(struct latch_tree_node *a, struct latch_tree_node *b))
{
 struct rb_root *root = &ltr->tree[idx];
 struct rb_node **link = &root->rb_node;
 struct rb_node *node = &ltn->node[idx];
 struct rb_node *parent = ((void *)0);
 struct latch_tree_node *ltp;

 while (*link) {
  parent = *link;
  ltp = __lt_from_rb(parent, idx);

  if (less(ltn, ltp))
   link = &parent->rb_left;
  else
   link = &parent->rb_right;
 }

 rb_link_node_rcu(node, parent, link);
 rb_insert_color(node, root);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void
__lt_erase(struct latch_tree_node *ltn, struct latch_tree_root *ltr, int idx)
{
 rb_erase(&ltn->node[idx], &ltr->tree[idx]);
}

static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) struct latch_tree_node *
__lt_find(void *key, struct latch_tree_root *ltr, int idx,
   int (*comp)(void *key, struct latch_tree_node *node))
{
 struct rb_node *node = ({ typeof(ltr->tree[idx].rb_node) ________p1 = ({ typeof(ltr->tree[idx].rb_node) _________p1 = ({ union { typeof(ltr->tree[idx].rb_node) __val; char __c[1]; } __u; if (1) __read_once_size(&(ltr->tree[idx].rb_node), __u.__c, sizeof(ltr->tree[idx].rb_node)); else __read_once_size_nocheck(&(ltr->tree[idx].rb_node), __u.__c, sizeof(ltr->tree[idx].rb_node)); __u.__val; }); typeof(*(ltr->tree[idx].rb_node)) *___typecheck_p __attribute__((unused)); do { } while (0); (_________p1); }); ((typeof(*ltr->tree[idx].rb_node) *)(________p1)); });
 struct latch_tree_node *ltn;
 int c;

 while (node) {
  ltn = __lt_from_rb(node, idx);
  c = comp(key, ltn);

  if (c < 0)
   node = ({ typeof(node->rb_left) ________p1 = ({ typeof(node->rb_left) _________p1 = ({ union { typeof(node->rb_left) __val; char __c[1]; } __u; if (1) __read_once_size(&(node->rb_left), __u.__c, sizeof(node->rb_left)); else __read_once_size_nocheck(&(node->rb_left), __u.__c, sizeof(node->rb_left)); __u.__val; }); typeof(*(node->rb_left)) *___typecheck_p __attribute__((unused)); do { } while (0); (_________p1); }); ((typeof(*node->rb_left) *)(________p1)); });
  else if (c > 0)
   node = ({ typeof(node->rb_right) ________p1 = ({ typeof(node->rb_right) _________p1 = ({ union { typeof(node->rb_right) __val; char __c[1]; } __u; if (1) __read_once_size(&(node->rb_right), __u.__c, sizeof(node->rb_right)); else __read_once_size_nocheck(&(node->rb_right), __u.__c, sizeof(node->rb_right)); __u.__val; }); typeof(*(node->rb_right)) *___typecheck_p __attribute__((unused)); do { } while (0); (_________p1); }); ((typeof(*node->rb_right) *)(________p1)); });
  else
   return ltn;
 }

 return ((void *)0);
}
# 141 "./include/linux/rbtree_latch.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void
latch_tree_insert(struct latch_tree_node *node,
    struct latch_tree_root *root,
    const struct latch_tree_ops *ops)
{
 raw_write_seqcount_latch(&root->seq);
 __lt_insert(node, root, 0, ops->less);
 raw_write_seqcount_latch(&root->seq);
 __lt_insert(node, root, 1, ops->less);
}
# 168 "./include/linux/rbtree_latch.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) void
latch_tree_erase(struct latch_tree_node *node,
   struct latch_tree_root *root,
   const struct latch_tree_ops *ops)
{
 raw_write_seqcount_latch(&root->seq);
 __lt_erase(node, root, 0);
 raw_write_seqcount_latch(&root->seq);
 __lt_erase(node, root, 1);
}
# 197 "./include/linux/rbtree_latch.h"
static inline __attribute__((no_instrument_function)) __attribute__((always_inline)) struct latch_tree_node *
latch_tree_find(void *key, struct latch_tree_root *root,
  const struct latch_tree_ops *ops)
{
 struct latch_tree_node *node;
 unsigned int seq;

 do {
  seq = raw_read_seqcount_latch(&root->seq);
  node = __lt_find(key, root, seq & 1, ops->comp);
 } while (read_seqcount_retry(&root->seq, seq));

 return node;
}
# 22 "./include/linux/module.h" 2


# 1 "./arch/x86/include/asm/module.h" 1



# 1 "./include/asm-generic/module.h" 1








struct mod_arch_specific
{
};
# 5 "./arch/x86/include/asm/module.h" 2
# 25 "./include/linux/module.h" 2
# 34 "./include/linux/module.h"
struct modversion_info {
 unsigned long crc;
 char name[(64 - sizeof(unsigned long))];
};

struct module;
struct exception_table_entry;

struct module_kobject {
 struct kobject kobj;
 struct module *mod;
 struct kobject *drivers_dir;
 struct module_param_attrs *mp;
 struct completion *kobj_completion;
};

struct module_attribute {
 struct attribute attr;
 ssize_t (*show)(struct module_attribute *, struct module_kobject *,
   char *);
 ssize_t (*store)(struct module_attribute *, struct module_kobject *,
    const char *, size_t count);
 void (*setup)(struct module *, const char *);
 int (*test)(struct module *);
 void (*free)(struct module *);
};

struct module_version_attribute {
 struct module_attribute mattr;
 const char *module_name;
 const char *version;
} __attribute__ ((__aligned__(sizeof(void *))));

extern ssize_t __modver_version_show(struct module_attribute *,
         struct module_kobject *, char *);

extern struct module_attribute module_uevent;


extern int init_module(void);
extern void cleanup_module(void);
# 260 "./include/linux/module.h"
struct notifier_block;



extern int modules_disabled;

void *__symbol_get(const char *symbol);
void *__symbol_get_gpl(const char *symbol);



struct module_use {
 struct list_head source_list;
 struct list_head target_list;
 struct module *source, *target;
};

enum module_state {
 MODULE_STATE_LIVE,
 MODULE_STATE_COMING,
 MODULE_STATE_GOING,
 MODULE_STATE_UNFORMED,
};

struct mod_tree_node {
 struct module *mod;
 struct latch_tree_node node;
};

struct module_layout {

 void *base;

 unsigned int size;

 unsigned int text_size;

 unsigned int ro_size;

 unsigned int ro_after_init_size;


 struct mod_tree_node mtn;

};
# 313 "./include/linux/module.h"
struct mod_kallsyms {
 Elf64_Sym *symtab;
 unsigned int num_symtab;
 char *strtab;
};
# 328 "./include/linux/module.h"
struct module {
 enum module_state state;


 struct list_head list;


 char name[(64 - sizeof(unsigned long))];


 struct module_kobject mkobj;
 struct module_attribute *modinfo_attrs;
 const char *version;
 const char *srcversion;
 struct kobject *holders_dir;


 const struct kernel_symbol *syms;
 const s32 *crcs;
 unsigned int num_syms;



 struct mutex param_lock;

 struct kernel_param *kp;
 unsigned int num_kp;


 unsigned int num_gpl_syms;
 const struct kernel_symbol *gpl_syms;
 const s32 *gpl_crcs;
# 378 "./include/linux/module.h"
 bool async_probe_requested;


 const struct kernel_symbol *gpl_future_syms;
 const s32 *gpl_future_crcs;
 unsigned int num_gpl_future_syms;


 unsigned int num_exentries;
 struct exception_table_entry *extable;


 int (*init)(void);


 struct module_layout core_layout __attribute__((__aligned__((1 << (6)))));
 struct module_layout init_layout;


 struct mod_arch_specific arch;

 unsigned long taints;



 unsigned num_bugs;
 struct list_head bug_list;
 struct bug_entry *bug_table;




 struct mod_kallsyms *kallsyms;
 struct mod_kallsyms core_kallsyms;


 struct module_sect_attrs *sect_attrs;


 struct module_notes_attrs *notes_attrs;




 char *args;



 void *percpu;
 unsigned int percpu_size;



 unsigned int num_tracepoints;
 struct tracepoint * const *tracepoints_ptrs;






 unsigned int num_trace_bprintk_fmt;
 const char **trace_bprintk_fmt_start;


 struct trace_event_call **trace_events;
 unsigned int num_trace_events;
 struct trace_enum_map **trace_enums;
 unsigned int num_trace_enums;
# 463 "./include/linux/module.h"
 struct list_head source_list;

 struct list_head target_list;


 void (*exit)(void);

 atomic_t refcnt;







} __attribute__((__aligned__((1 << (6)))));




extern struct mutex module_mutex;




static inline __attribute__((no_instrument_function)) int module_is_live(struct module *mod)
{
 return mod->state != MODULE_STATE_GOING;
}

struct module *__module_text_address(unsigned long addr);
struct module *__module_address(unsigned long addr);
bool is_module_address(unsigned long addr);
bool is_module_percpu_address(unsigned long addr);
bool is_module_text_address(unsigned long addr);

static inline __attribute__((no_instrument_function)) bool within_module_core(unsigned long addr,
          const struct module *mod)
{
 return (unsigned long)mod->core_layout.base <= addr &&
        addr < (unsigned long)mod->core_layout.base + mod->core_layout.size;
}

static inline __attribute__((no_instrument_function)) bool within_module_init(unsigned long addr,
          const struct module *mod)
{
 return (unsigned long)mod->init_layout.base <= addr &&
        addr < (unsigned long)mod->init_layout.base + mod->init_layout.size;
}

static inline __attribute__((no_instrument_function)) bool within_module(unsigned long addr, const struct module *mod)
{
 return within_module_init(addr, mod) || within_module_core(addr, mod);
}


struct module *find_module(const char *name);

struct symsearch {
 const struct kernel_symbol *start, *stop;
 const s32 *crcs;
 enum {
  NOT_GPL_ONLY,
  GPL_ONLY,
  WILL_BE_GPL_ONLY,
 } licence;
 bool unused;
};






const struct kernel_symbol *find_symbol(const char *name,
     struct module **owner,
     const s32 **crc,
     bool gplok,
     bool warn);






bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
        struct module *owner,
        void *data), void *data);



int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
   char *name, char *module_name, int *exported);


unsigned long module_kallsyms_lookup_name(const char *name);

int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
          struct module *, unsigned long),
       void *data);

extern void __attribute__((noreturn)) __module_put_and_exit(struct module *mod,
   long code);



int module_refcount(struct module *mod);
void __symbol_put(const char *symbol);

void symbol_put_addr(void *addr);



extern void __module_get(struct module *module);



extern bool try_module_get(struct module *module);

extern void module_put(struct module *module);
# 599 "./include/linux/module.h"
int ref_module(struct module *a, struct module *b);
# 611 "./include/linux/module.h"
const char *module_address_lookup(unsigned long addr,
       unsigned long *symbolsize,
       unsigned long *offset,
       char **modname,
       char *namebuf);
int lookup_module_symbol_name(unsigned long addr, char *symname);
int lookup_module_symbol_attrs(unsigned long addr, unsigned long *size, unsigned long *offset, char *modname, char *name);

int register_module_notifier(struct notifier_block *nb);
int unregister_module_notifier(struct notifier_block *nb);

extern void print_modules(void);

static inline __attribute__((no_instrument_function)) bool module_requested_async_probing(struct module *module)
{
 return module && module->async_probe_requested;
}







static inline __attribute__((no_instrument_function)) bool is_livepatch_module(struct module *mod)
{
 return false;
}
# 753 "./include/linux/module.h"
extern struct kset *module_kset;
extern struct kobj_type module_ktype;
extern int module_sysfs_initialized;
# 765 "./include/linux/module.h"
extern void set_all_modules_text_rw(void);
extern void set_all_modules_text_ro(void);
extern void module_enable_ro(const struct module *mod, bool after_init);
extern void module_disable_ro(const struct module *mod);
# 777 "./include/linux/module.h"
void module_bug_finalize(const Elf64_Ehdr *, const Elf64_Shdr *,
    struct module *);
void module_bug_cleanup(struct module *);
# 797 "./include/linux/module.h"
static inline __attribute__((no_instrument_function)) bool module_sig_ok(struct module *module)
{
 return true;
}
# 2 "/home/tuba/Documents/experiments/driverVerification/PMGuided/models/sound/sound_model.mod.c" 2
# 1 "./include/linux/vermagic.h" 1
# 1 "./include/generated/utsrelease.h" 1
# 2 "./include/linux/vermagic.h" 2
# 3 "/home/tuba/Documents/experiments/driverVerification/PMGuided/models/sound/sound_model.mod.c" 2


static const char __UNIQUE_ID_vermagic8[] __attribute__((__used__)) __attribute__((section(".modinfo"), unused, aligned(1))) = "vermagic" "=" "4.11.0-rc2+" " " "SMP " "" "mod_unload " "" "";

          struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = "sound_model",
 .arch = {},
};

static const char __module_depends[]
__attribute__((__used__))
__attribute__((section(".modinfo"))) =
"depends=";
