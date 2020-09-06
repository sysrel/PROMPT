	.text
	.file	"/home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.bc"
	.globl	l2cap_get_conf_opt_PROSE
	.align	16, 0x90
	.type	l2cap_get_conf_opt_PROSE,@function
l2cap_get_conf_opt_PROSE:               # @l2cap_get_conf_opt_PROSE
.Lfunc_begin0:
	.file	1 "/home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c"
	.loc	1 13 0                  # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:13:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: l2cap_get_conf_opt_PROSE:ptr <- %RDI
	#DEBUG_VALUE: l2cap_get_conf_opt_PROSE:type <- %RSI
	#DEBUG_VALUE: l2cap_get_conf_opt_PROSE:olen <- %RDX
	#DEBUG_VALUE: l2cap_get_conf_opt_PROSE:val <- %RCX
	.loc	1 14 33 prologue_end    # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:14:33
	movq	(%rdi), %rax
.Ltmp0:
	#DEBUG_VALUE: l2cap_get_conf_opt_PROSE:opt <- %RAX
	.loc	1 17 14                 # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:17:14
	movb	$1, (%rax)
	.loc	1 18 13                 # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:18:13
	movb	$4, 1(%rax)
.Ltmp1:
	#DEBUG_VALUE: l2cap_get_conf_opt_PROSE:len <- 6
	.loc	1 21 9                  # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:21:9
	addq	$6, (%rdi)
	.loc	1 23 12                 # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:23:12
	movzbl	(%rax), %ecx
.Ltmp2:
	.loc	1 23 10 is_stmt 0       # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:23:10
	movl	%ecx, (%rsi)
	.loc	1 24 12 is_stmt 1       # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:24:12
	movzbl	1(%rax), %eax
.Ltmp3:
	.loc	1 24 10 is_stmt 0       # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:24:10
	movl	%eax, (%rdx)
	.loc	1 25 4 is_stmt 1        # /home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c:25:4
	movl	$6, %eax
	retq
.Ltmp4:
.Lfunc_end0:
	.size	l2cap_get_conf_opt_PROSE, .Lfunc_end0-l2cap_get_conf_opt_PROSE
	.cfi_endproc

	.file	2 "./include/uapi/asm-generic/int-ll64.h"
	.file	3 "./include/net/bluetooth/l2cap.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)" # string offset=0
.Linfo_string1:
	.asciz	"/home/tuba/Documents/experiments/ASTransferrability/bluetooth/noinlining/blueborne/model/model.c" # string offset=54
.Linfo_string2:
	.asciz	"/home/tuba/Documents/tools/clang-kernel-build/linux-stable" # string offset=151
.Linfo_string3:
	.asciz	"l2cap_get_conf_opt_PROSE" # string offset=210
.Linfo_string4:
	.asciz	"int"                   # string offset=235
.Linfo_string5:
	.asciz	"ptr"                   # string offset=239
.Linfo_string6:
	.asciz	"type"                  # string offset=243
.Linfo_string7:
	.asciz	"olen"                  # string offset=248
.Linfo_string8:
	.asciz	"val"                   # string offset=253
.Linfo_string9:
	.asciz	"long unsigned int"     # string offset=257
.Linfo_string10:
	.asciz	"opt"                   # string offset=275
.Linfo_string11:
	.asciz	"unsigned char"         # string offset=279
.Linfo_string12:
	.asciz	"__u8"                  # string offset=293
.Linfo_string13:
	.asciz	"len"                   # string offset=298
.Linfo_string14:
	.asciz	"sizetype"              # string offset=302
.Linfo_string15:
	.asciz	"l2cap_conf_opt"        # string offset=311
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp0-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	267                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x104 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	1                       # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x6b DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	149                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	3                       # Abbrev [3] 0x43:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	156                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x50:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	84
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	162                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x5d:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	81
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	162                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6a:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	167                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x79:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	179                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x88:0xc DW_TAG_variable
	.byte	6                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	149                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x95:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	8                       # Abbrev [8] 0x9c:0x5 DW_TAG_pointer_type
	.long	161                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xa1:0x1 DW_TAG_pointer_type
	.byte	8                       # Abbrev [8] 0xa2:0x5 DW_TAG_pointer_type
	.long	149                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xa7:0x5 DW_TAG_pointer_type
	.long	172                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xac:0x7 DW_TAG_base_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	8                       # Abbrev [8] 0xb3:0x5 DW_TAG_pointer_type
	.long	184                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xb8:0x31 DW_TAG_structure_type
	.long	.Linfo_string15         # DW_AT_name
	.byte	2                       # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	315                     # DW_AT_decl_line
	.byte	11                      # Abbrev [11] 0xc1:0xd DW_TAG_member
	.long	.Linfo_string6          # DW_AT_name
	.long	233                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	11                      # Abbrev [11] 0xce:0xd DW_TAG_member
	.long	.Linfo_string13         # DW_AT_name
	.long	233                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.byte	1                       # DW_AT_data_member_location
	.byte	11                      # Abbrev [11] 0xdb:0xd DW_TAG_member
	.long	.Linfo_string8          # DW_AT_name
	.long	251                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.byte	2                       # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xe9:0xb DW_TAG_typedef
	.long	244                     # DW_AT_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.byte	7                       # Abbrev [7] 0xf4:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0xfb:0xc DW_TAG_array_type
	.long	233                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x100:0x6 DW_TAG_subrange_type
	.long	263                     # DW_AT_type
	.byte	0                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x107:0x7 DW_TAG_base_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.section	.debug_macinfo,"",@progbits
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	271                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"l2cap_get_conf_opt_PROSE" # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	271                     # Compilation Unit Length
	.long	172                     # DIE offset
	.asciz	"long unsigned int"     # External Name
	.long	184                     # DIE offset
	.asciz	"l2cap_conf_opt"        # External Name
	.long	149                     # DIE offset
	.asciz	"int"                   # External Name
	.long	233                     # DIE offset
	.asciz	"__u8"                  # External Name
	.long	244                     # DIE offset
	.asciz	"unsigned char"         # External Name
	.long	0                       # End Mark
.LpubTypes_end0:
	.cfi_sections .debug_frame

	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
