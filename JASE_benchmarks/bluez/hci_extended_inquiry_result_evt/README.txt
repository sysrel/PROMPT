Bluetooth: Fix slab-out-of-bounds read in hci extended inquiry result evt().
"https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.
git/commit/net/bluetooth?id=51c19bf3d5cfaa66571e4b88ba2a6f6295311101".

Error: memory error: out of bound pointer
File: /home/tuba/Documents/releases/PROMPT/runtime/Intrinsic/memcpy.c
Line: 17
assembly.ll line: 78075
Stack: 
	#000078075 in memcpy (destaddr=98727760, srcaddr=49437599, len=6) at /home/t
uba/Documents/releases/PROMPT/runtime/Intrinsic/memcpy.c:17
	#100055638 in bacpy.4 (dst=98727760, src=49437599)
	#200063750 in hci_extended_inquiry_result_evt (hdev=99049248, skb=99249296)
Info: 
	address: 49437600
	next: object at 95258672 of size 24
		MO140[24] allocated at global:.str.14
	prev: object at 49437344 of size 256
		MO614[256] allocated at hci_extended_inquiry_result_evt():  %3 = loa
d i8*, i8** %2, align 8
