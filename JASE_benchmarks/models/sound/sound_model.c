#include <linux/kernel.h>
#include <linux/types.h>
#include <linux/bitops.h>
#include <linux/interrupt.h>
#include <linux/spinlock.h>
#include <linux/string.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/timer.h>
#include <linux/usb.h>
#include <linux/wait.h>
#include <linux/usb/audio.h>
#include <linux/module.h>

#include <sound/core.h>
#include <sound/control.h>
#include <sound/rawmidi.h>
#include <sound/asequencer.h>
#include <sound/pcm.h>
#include <sound/hwdep.h>

extern void klee_set_metadata(void *, int);
extern int klee_get_metadata(void *);
extern void klee_make_symbolic(void *array, size_t nbytes, const char *name);
extern void klee_assume(uintptr_t x);

int snd_card_new_PROSE(struct device *parent, int idx, const char *xid,
		    struct module *module, int extra_size,
		    struct snd_card **card_ret)
{
   struct snd_card *card;
   int return_value, card_refcount;
   klee_make_symbolic(&return_value, sizeof(return_value), "snd_card_new_return_value");
   if (extra_size < 0)
      extra_size = 0;
     card = kzalloc(sizeof(*card) + extra_size, GFP_KERNEL);
     if (!card)
	return -ENOMEM;
   if (return_value >=0 ) {
     if (extra_size > 0)
        card->private_data = (char *)card + sizeof(struct snd_card);
     INIT_LIST_HEAD(&card->devices);
     card->dev = parent;
     *card_ret = card;
     // device_initialize(&card->card_dev);
     klee_set_metadata(&card->card_dev, 1);
  }
  return return_value;
}

int __snd_device_register_PROSE(struct snd_device *dev)
{
    int return_value;
    
    
    if (dev->state == SNDRV_DEV_BUILD) {
	if (dev->ops->dev_register) {
	   int err = dev->ops->dev_register(dev);
	   if (err < 0)
	      return err;
	}
	dev->state = SNDRV_DEV_REGISTERED;
    }
    klee_make_symbolic(&return_value, sizeof(return_value),"__snd_device_register_return_value");
    klee_assume(return_value >= 0);
    return return_value;
}

int snd_device_register_all_PROSE(struct snd_card *card)
{
    struct snd_device *dev;
    int err;
	
    if (!card)
       return -ENXIO;
    list_for_each_entry(dev, &card->devices, list) {
       err = __snd_device_register_PROSE(dev);
       if (err < 0)
	  return err;
    }
    return 0;
}

int snd_card_register_PROSE(struct snd_card *card)
{
    int return_value;
    int err;
  

    if (!card)
       return -EINVAL;

    if (!card->registered) {
       card->registered = true;
    }

    if ((err = snd_device_register_all_PROSE(card)) < 0)
       return err;
    return err;
}

void __snd_device_disconnect_PROSE(struct snd_device *dev)
{
	if (dev->state == SNDRV_DEV_REGISTERED) {
		if (dev->ops->dev_disconnect &&
		    dev->ops->dev_disconnect(dev))
			dev_err(dev->card->dev, "device disconnect failure\n");
		dev->state = SNDRV_DEV_DISCONNECTED;
	}
}

void snd_device_disconnect_all_PROSE(struct snd_card *card)
{
	struct snd_device *dev;

	if (!card)
	    return;
	list_for_each_entry_reverse(dev, &card->devices, list) 
	   __snd_device_disconnect_PROSE(dev);
}



int snd_card_disconnect_PROSE(struct snd_card *card)
{
   int return_value;
   if (!card)
      return -EINVAL;

   klee_make_symbolic(&return_value, sizeof(return_value),"snd_card_disconnect_return_value");
   if (return_value >= 0) {    
      snd_device_disconnect_all_PROSE(card);
      if (card->registered) {
          card->registered = false;
      }
   }
   return return_value;
}

void snd_device_free_all_PROSE(struct snd_card *card)
{
	struct snd_device *dev, *next;

	if (!card)
		return;
	list_for_each_entry_safe_reverse(dev, next, &card->devices, list) {
		//__snd_device_free(dev);
  	    /* unlink */
	    list_del(&dev->list);

   	    __snd_device_disconnect_PROSE(dev);
	    if (dev->ops->dev_free) {
		if (dev->ops->dev_free(dev))
			dev_err(dev->card->dev, "device free failure\n");
	    }
	    kfree(dev);
        }
}

int snd_card_free_when_closed_PROSE(struct snd_card *card)
{
   struct snd_device *dev;
   int return_value, card_refcount;
   int ret = snd_card_disconnect_PROSE(card);
   if (ret < 0)
      return ret;
   // put_device(&card->card_dev);
   card_refcount = klee_get_metadata(&card->card_dev);
   card_refcount--;
   klee_set_metadata(&card->card_dev, card_refcount);
   if (card_refcount == 0) {
      // card_device_release => snd_card_do_free
      snd_device_free_all_PROSE(card);
      if (card->private_free)
         card->private_free(card);
      kfree(card);         
   }
   return ret;
}

int snd_card_free_PROSE(struct snd_card *card)
{
    return snd_card_free_when_closed_PROSE(card);
}

int snd_device_new_PROSE(struct snd_card *card, enum snd_device_type type,
		   void *device_data, struct snd_device_ops *ops)
{
  int return_value;
  struct snd_device *dev;
  struct list_head *p;
    

  if (!card || !device_data || !ops)
       return -ENXIO;
  dev = kzalloc(sizeof(*dev), GFP_KERNEL);
  if (!dev)
       return -ENOMEM;
  klee_make_symbolic(&return_value, sizeof(return_value),"snd_device_new_return_value"); 
  if (return_value >= 0) {
    INIT_LIST_HEAD(&dev->list);
    dev->card = card;
    dev->type = type;
    dev->state = SNDRV_DEV_BUILD;
    dev->device_data = device_data;
    dev->ops = ops;

    /* insert the entry in an incrementally sorted list */
    list_for_each_prev(p, &card->devices) {
	struct snd_device *pdev = list_entry(p, struct snd_device, list);
	if ((unsigned int)pdev->type <= (unsigned int)type)
			break;
    }

    list_add(&dev->list, p);
  }
  return return_value;
}


int snd_rawmidi_new_PROSE(struct snd_card *card, char *id, int device,
		    int output_count, int input_count,
		    struct snd_rawmidi **rrawmidi)
{
    int return_value;
    struct snd_rawmidi *rmidi;

    if (!card)
       return -ENXIO;

    if (rrawmidi)
       *rrawmidi = NULL;
    rmidi = kzalloc(sizeof(*rmidi), GFP_KERNEL);
    if (!rmidi)
       return -ENOMEM;
    klee_make_symbolic(&return_value, sizeof(return_value),"snd_rawmidi_new_return_value");
    if (return_value >= 0) {
       rmidi->card = card;
       rmidi->device = device;
       // snd_device_initialize(&rmidi->dev, card);
       klee_set_metadata(&rmidi->dev, 1);
       if (rrawmidi)
	  *rrawmidi = rmidi;
    }
    return return_value;
    
}

int snd_rawmidi_free_PROSE(struct snd_rawmidi *rmidi)
{
   int rmidi_refcount, return_value;

   klee_make_symbolic(&return_value, sizeof(return_value),"snd_rawmidi_free_return_value");
   if (return_value >=0 ) {
      if (!rmidi)
         return return_value;

     if (rmidi->private_free)
        rmidi->private_free(rmidi);
     //put_device(&rmidi->dev) 
     rmidi_refcount = klee_get_metadata(&rmidi->dev);
     rmidi_refcount--;
     klee_set_metadata(&rmidi->dev, rmidi_refcount);
     if (rmidi_refcount == 0) {
        // release_rawmidi_device
        kfree(rmidi); 
     }
  }
  return 0;
}

int snd_pcm_new_PROSE(struct snd_card *card, const char *id, int device,
		int playback_count, int capture_count, struct snd_pcm **rpcm)
{
    int return_value;
    struct snd_pcm *pcm;

    if (!card)
       return -ENXIO;
    if (rpcm)
       *rpcm = NULL;
    pcm = kzalloc(sizeof(*pcm), GFP_KERNEL);
    if (!pcm)
       return -ENOMEM;
    klee_make_symbolic(&return_value, sizeof(return_value),"snd_pcm_new_return_value");
    if (return_value >= 0) {
       pcm->card = card;
       pcm->device = device;
       if (rpcm)
          *rpcm = pcm;
    }
    return return_value;
}


int dev_free_PROSE(struct snd_device *dev) 
{
}

int dev_register_PROSE(struct snd_device *dev) 
{
}

int dev_disconnect_PROSE(struct snd_device *dev) 
{
}

int snd_hwdep_new(struct snd_card *card, char *id, int device,
		  struct snd_hwdep **rhwdep)
{
	struct snd_hwdep *hwdep;
	int err, dev_refcount;
	static struct snd_device_ops ops = {
		.dev_free = dev_free_PROSE,
		.dev_register = dev_register_PROSE,
		.dev_disconnect = dev_disconnect_PROSE,
	};

	if (!card)
	   return -ENXIO;
	if (rhwdep)
	   *rhwdep = NULL;
	hwdep = kzalloc(sizeof(*hwdep), GFP_KERNEL);
	if (!hwdep)
	   return -ENOMEM;

	hwdep->card = card;
	hwdep->device = device;

	//snd_device_initialize(&hwdep->dev, card);
        klee_set_metadata(&hwdep->dev, 1);

	err = snd_device_new_PROSE(card, SNDRV_DEV_HWDEP, hwdep, &ops);
	if (err < 0) {
           klee_set_metadata(&hwdep->dev, 0);
	   return err;
	}

	if (rhwdep)
	   *rhwdep = hwdep;
	return err;
}
