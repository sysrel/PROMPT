; ModuleID = 'model.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.l2cap_conf_opt = type { i8, i8, [0 x i8] }

; Function Attrs: noredzone nounwind
define i32 @l2cap_get_conf_opt_PROSE(i8** %ptr, i32* %type, i32* %olen, i64* %val) #0 !dbg !4 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i64*, align 8
  %opt = alloca %struct.l2cap_conf_opt*, align 8
  %len = alloca i32, align 4
  store i8** %ptr, i8*** %1, align 8
  call void @llvm.dbg.declare(metadata i8*** %1, metadata !14, metadata !36), !dbg !37
  store i32* %type, i32** %2, align 8
  call void @llvm.dbg.declare(metadata i32** %2, metadata !15, metadata !36), !dbg !38
  store i32* %olen, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !16, metadata !36), !dbg !39
  store i64* %val, i64** %4, align 8
  call void @llvm.dbg.declare(metadata i64** %4, metadata !17, metadata !36), !dbg !40
  %5 = bitcast %struct.l2cap_conf_opt** %opt to i8*, !dbg !41
  call void @llvm.lifetime.start(i64 8, i8* %5) #3, !dbg !41
  call void @llvm.dbg.declare(metadata %struct.l2cap_conf_opt** %opt, metadata !18, metadata !36), !dbg !42
  %6 = load i8**, i8*** %1, align 8, !dbg !43
  %7 = load i8*, i8** %6, align 8, !dbg !44
  %8 = bitcast i8* %7 to %struct.l2cap_conf_opt*, !dbg !44
  store %struct.l2cap_conf_opt* %8, %struct.l2cap_conf_opt** %opt, align 8, !dbg !42
  %9 = bitcast i32* %len to i8*, !dbg !45
  call void @llvm.lifetime.start(i64 4, i8* %9) #3, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %len, metadata !32, metadata !36), !dbg !46
  %10 = load %struct.l2cap_conf_opt*, %struct.l2cap_conf_opt** %opt, align 8, !dbg !47
  %11 = getelementptr inbounds %struct.l2cap_conf_opt, %struct.l2cap_conf_opt* %10, i32 0, i32 0, !dbg !48
  store i8 1, i8* %11, align 1, !dbg !49
  %12 = load %struct.l2cap_conf_opt*, %struct.l2cap_conf_opt** %opt, align 8, !dbg !50
  %13 = getelementptr inbounds %struct.l2cap_conf_opt, %struct.l2cap_conf_opt* %12, i32 0, i32 1, !dbg !51
  store i8 4, i8* %13, align 1, !dbg !52
  %14 = load %struct.l2cap_conf_opt*, %struct.l2cap_conf_opt** %opt, align 8, !dbg !53
  %15 = getelementptr inbounds %struct.l2cap_conf_opt, %struct.l2cap_conf_opt* %14, i32 0, i32 1, !dbg !54
  %16 = load i8, i8* %15, align 1, !dbg !54
  %17 = zext i8 %16 to i32, !dbg !53
  %18 = add i32 2, %17, !dbg !55
  store i32 %18, i32* %len, align 4, !dbg !56
  %19 = load i32, i32* %len, align 4, !dbg !57
  %20 = load i8**, i8*** %1, align 8, !dbg !58
  %21 = load i8*, i8** %20, align 8, !dbg !59
  %22 = sext i32 %19 to i64, !dbg !59
  %23 = getelementptr i8, i8* %21, i64 %22, !dbg !59
  store i8* %23, i8** %20, align 8, !dbg !59
  %24 = load %struct.l2cap_conf_opt*, %struct.l2cap_conf_opt** %opt, align 8, !dbg !60
  %25 = getelementptr inbounds %struct.l2cap_conf_opt, %struct.l2cap_conf_opt* %24, i32 0, i32 0, !dbg !61
  %26 = load i8, i8* %25, align 1, !dbg !61
  %27 = zext i8 %26 to i32, !dbg !60
  %28 = load i32*, i32** %2, align 8, !dbg !62
  store i32 %27, i32* %28, align 4, !dbg !63
  %29 = load %struct.l2cap_conf_opt*, %struct.l2cap_conf_opt** %opt, align 8, !dbg !64
  %30 = getelementptr inbounds %struct.l2cap_conf_opt, %struct.l2cap_conf_opt* %29, i32 0, i32 1, !dbg !65
  %31 = load i8, i8* %30, align 1, !dbg !65
  %32 = zext i8 %31 to i32, !dbg !64
  %33 = load i32*, i32** %3, align 8, !dbg !66
  store i32 %32, i32* %33, align 4, !dbg !67
  %34 = load i32, i32* %len, align 4, !dbg !68
  %35 = bitcast i32* %len to i8*, !dbg !69
  call void @llvm.lifetime.end(i64 4, i8* %35) #3, !dbg !69
  %36 = bitcast %struct.l2cap_conf_opt** %opt to i8*, !dbg !69
  call void @llvm.lifetime.end(i64 8, i8* %36) #3, !dbg !69
  ret i32 %34, !dbg !70
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

attributes #0 = { noredzone nounwind "disable-tail-calls"="true" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512pf,-avx512vl,-f16c,-fma,-fma4,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = distinct !DICompileUnit(language: DW_LANG_C89, file: !1, producer: "clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3)
!1 = !DIFile(filename: "/home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c", directory: "/home/tuba/Documents/tools/clang-kernel-build/linux-stable")
!2 = !{}
!3 = !{!4}
!4 = distinct !DISubprogram(name: "l2cap_get_conf_opt_PROSE", scope: !1, file: !1, line: 11, type: !5, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: true, variables: !13)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !10, !10, !11}
!7 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!13 = !{!14, !15, !16, !17, !18, !32}
!14 = !DILocalVariable(name: "ptr", arg: 1, scope: !4, file: !1, line: 11, type: !8)
!15 = !DILocalVariable(name: "type", arg: 2, scope: !4, file: !1, line: 11, type: !10)
!16 = !DILocalVariable(name: "olen", arg: 3, scope: !4, file: !1, line: 11, type: !10)
!17 = !DILocalVariable(name: "val", arg: 4, scope: !4, file: !1, line: 12, type: !11)
!18 = !DILocalVariable(name: "opt", scope: !4, file: !1, line: 14, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64, align: 64)
!20 = !DICompositeType(tag: DW_TAG_structure_type, name: "l2cap_conf_opt", file: !21, line: 315, size: 16, align: 8, elements: !22)
!21 = !DIFile(filename: "./include/net/bluetooth/l2cap.h", directory: "/home/tuba/Documents/tools/clang-kernel-build/linux-stable")
!22 = !{!23, !27, !28}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !20, file: !21, line: 316, baseType: !24, size: 8, align: 8)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !25, line: 20, baseType: !26)
!25 = !DIFile(filename: "./include/uapi/asm-generic/int-ll64.h", directory: "/home/tuba/Documents/tools/clang-kernel-build/linux-stable")
!26 = !DIBasicType(name: "unsigned char", size: 8, align: 8, encoding: DW_ATE_unsigned_char)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !20, file: !21, line: 317, baseType: !24, size: 8, align: 8, offset: 8)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !20, file: !21, line: 318, baseType: !29, align: 8, offset: 16)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, align: 8, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 0)
!32 = !DILocalVariable(name: "len", scope: !4, file: !1, line: 15, type: !7)
!33 = !{i32 2, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!36 = !DIExpression()
!37 = !DILocation(line: 11, column: 37, scope: !4)
!38 = !DILocation(line: 11, column: 47, scope: !4)
!39 = !DILocation(line: 11, column: 58, scope: !4)
!40 = !DILocation(line: 12, column: 25, scope: !4)
!41 = !DILocation(line: 14, column: 4, scope: !4)
!42 = !DILocation(line: 14, column: 27, scope: !4)
!43 = !DILocation(line: 14, column: 34, scope: !4)
!44 = !DILocation(line: 14, column: 33, scope: !4)
!45 = !DILocation(line: 15, column: 4, scope: !4)
!46 = !DILocation(line: 15, column: 8, scope: !4)
!47 = !DILocation(line: 17, column: 4, scope: !4)
!48 = !DILocation(line: 17, column: 9, scope: !4)
!49 = !DILocation(line: 17, column: 14, scope: !4)
!50 = !DILocation(line: 18, column: 4, scope: !4)
!51 = !DILocation(line: 18, column: 9, scope: !4)
!52 = !DILocation(line: 18, column: 13, scope: !4)
!53 = !DILocation(line: 20, column: 14, scope: !4)
!54 = !DILocation(line: 20, column: 19, scope: !4)
!55 = !DILocation(line: 20, column: 12, scope: !4)
!56 = !DILocation(line: 20, column: 8, scope: !4)
!57 = !DILocation(line: 21, column: 12, scope: !4)
!58 = !DILocation(line: 21, column: 5, scope: !4)
!59 = !DILocation(line: 21, column: 9, scope: !4)
!60 = !DILocation(line: 23, column: 12, scope: !4)
!61 = !DILocation(line: 23, column: 17, scope: !4)
!62 = !DILocation(line: 23, column: 5, scope: !4)
!63 = !DILocation(line: 23, column: 10, scope: !4)
!64 = !DILocation(line: 24, column: 12, scope: !4)
!65 = !DILocation(line: 24, column: 17, scope: !4)
!66 = !DILocation(line: 24, column: 5, scope: !4)
!67 = !DILocation(line: 24, column: 10, scope: !4)
!68 = !DILocation(line: 25, column: 11, scope: !4)
!69 = !DILocation(line: 26, column: 1, scope: !4)
!70 = !DILocation(line: 25, column: 4, scope: !4)
