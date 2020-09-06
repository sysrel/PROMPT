Error: invalid function pointer
Stack: 
	#000005814 in __snd_device_disconnect_PROSE (dev=95566280)
	#100005883 in snd_device_disconnect_all_PROSE (card=61143376)
	#200005935 in snd_card_disconnect_PROSE (card=61143376)
	#300006179 in snd_card_free_when_closed_PROSE (card=61143376)
	#400006255 in snd_card_free_PROSE (card=61143376)
	#500000771 in snd_nm256_probe (pci=64487840, pci_id=64481888)


static int
snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
		 struct nm256 **chip_ret)
{
	struct nm256 *chip;
	int err, pval;
	static struct snd_device_ops ops = {
		.dev_free =	snd_nm256_dev_free,
	};

LLVM does not interpret the unassigned field (dev_disconnect) as NULL and this leads to a problem.
