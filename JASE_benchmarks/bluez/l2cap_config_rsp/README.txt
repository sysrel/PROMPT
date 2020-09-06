Blueborne vulnerability, CVE-2017-1000251.


Error path produced by PROMPT:

Error: memory error: out of bound pointer
File: /home/tuba/Documents/tools/clang-kernel-build/linux-stable/net/bluetooth/l2cap_core.c
Line: 2996
assembly.ll line: 43986
Stack: 
	#000043986 in l2cap_add_conf_opt (ptr=142165200, type=1, len=2, val=43947) at /home/
tuba/Documents/tools/clang-kernel-build/linux-stable/net/bluetooth/l2cap_core.c:2996
	#100048020 in l2cap_parse_conf_rsp (chan=92475136, rsp=141640710, len, data=14184776
0, result=141548608) at /home/tuba/Documents/tools/clang-kernel-build/linux-stable/net/bluet
ooth/l2cap_core.c:3551
	#200047685 in l2cap_config_rsp (conn=141657120, cmd=141631360, cmd_len, data=1416407
04) at /home/tuba/Documents/tools/clang-kernel-build/linux-stable/net/bluetooth/l2cap_core.c
:4186
Info: 
	address: 141847824
	next: object at 141865136 of size 8
		MO626[8] allocated at l2cap_config_rsp():  call void asm sideeffect ".pushse
ction .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; bts $1
,$0", "=*m,Ir,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %23, i64 10, i64* %23) #11, !db
g !149659, !srcloc !149663
	prev: object at 141847760 of size 64
		MO615[64] allocated at l2cap_config_rsp():  %buf = alloca [64 x i8], align 1
6

