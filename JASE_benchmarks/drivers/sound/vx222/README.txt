

Error: invalid function pointer
Stack: 
	#000003723 in __snd_device_disconnect_PROSE (dev=49007416)
	#100003792 in snd_device_disconnect_all_PROSE (card=48112576)
	#200003844 in snd_card_disconnect_PROSE (card=48112576)
	#300004088 in snd_card_free_when_closed_PROSE (card=48112576)
	#400004164 in snd_card_free_PROSE (card=48112576)
	#500000550 in snd_vx222_probe (pci=48026672, pci_id=44338368)

static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
			    struct snd_vx_hardware *hw,
			    struct snd_vx222 **rchip)
{
	struct vx_core *chip;
	struct snd_vx222 *vx;
	int i, err;
	static struct snd_device_ops ops = {
		.dev_free =	snd_vx222_dev_free,
	};


LLVM does not interpret unassigned fields (dev_disconnect in this case) as initialized to zero and 
the NULL check fails leading to calling an invalid function pointer.

