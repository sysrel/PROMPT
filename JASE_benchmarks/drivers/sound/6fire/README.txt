False positive: it returns a zero when the probe function peformes a firmware update and does 
not set chip->regidx leading to an out of bound array access inside the disconnect function

Error: memory error: out of bound pointer
Stack: 
	#000001030 in usb6fire_chip_disconnect (intf=50865296)
Info: 
	address: 49091380
	next: object at 49754848 of size 50
		MO25[50] allocated at usb6fire_chip_probe():  %1 = alloca i32, align 4
	prev: object at 49091360 of size 20
		MO550[20] allocated at dev_get_drvdata():  %4 = load i8*, i8** %3, align 8
