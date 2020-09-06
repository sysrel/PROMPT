

#include "network_model.h"
extern void klee_set_metadata(void *, int);
extern int klee_get_metadata(void *);
extern void klee_make_symbolic(void *array, size_t nbytes, const char *name);
extern void klee_assume(uintptr_t x);

static LIST_HEAD(net_todo_list);

char *p;

struct net_device *alloc_netdev_mqs_PROSE(int sizeof_priv, const char *name,
		unsigned char name_assign_type,
		void (*setup)(struct net_device *),
		unsigned int txqs, unsigned int rxqs)
{
        struct net_device *dev, *return_value;
	size_t alloc_size;

        klee_make_symbolic(&return_value, sizeof(return_value), "alloc_netdev_mqs_return_value");
        if (return_value != NULL) {
	   if (txqs < 1) {
	      pr_err("alloc_netdev: Unable to allocate device with zero queues\n");
	      return NULL;
	   }

   	   alloc_size = sizeof(struct net_device);
	   if (sizeof_priv) {
	 	/* ensure 32-byte alignment of private area */
	        // alloc_size = ALIGN(alloc_size, NETDEV_ALIGN);
   	        p = kzalloc(sizeof_priv, GFP_KERNEL | __GFP_NOWARN | __GFP_REPEAT);
	        if (!p)
		   return NULL;
	   }
	   /* ensure 32-byte alignment of whole construct */
	   //alloc_size += NETDEV_ALIGN - 1;


   	   //dev = PTR_ALIGN(p, NETDEV_ALIGN);
           dev =  kzalloc(alloc_size, GFP_KERNEL | __GFP_NOWARN | __GFP_REPEAT);
	   dev->padded = 0;
           dev->destructor = NULL;
	   dev->priv_flags = IFF_XMIT_DST_RELEASE | IFF_XMIT_DST_RELEASE_PERM;
           dev->dev_addr = kmalloc(128, GFP_KERNEL);
	   setup(dev);

	   dev->num_tx_queues = txqs;
	   dev->real_num_tx_queues = txqs;
	   return_value = dev;
	}
	return return_value;


}

struct net_device *alloc_etherdev_mqs_PROSE(int sizeof_priv, unsigned int txqs,
				      unsigned int rxqs)
{
	return alloc_netdev_mqs_PROSE(sizeof_priv, "eth%d", NET_NAME_UNKNOWN,
				ether_setup, txqs, rxqs);
}


void *netdev_priv_PROSE(const struct net_device *dev)
{
	//return (char *)dev + ALIGN(sizeof(struct net_device), NETDEV_ALIGN);
	return p;
}

int register_netdevice_PROSE(struct net_device *dev)
{
	int return_value;
	struct net *net = dev_net(dev);

        klee_make_symbolic(&return_value, sizeof(return_value), "register_netdevice_return_value");
	/* Init, if this function is available */
	if (dev->netdev_ops->ndo_init) {
		return_value = dev->netdev_ops->ndo_init(dev);
		if (return_value) {
		   return_value = -EIO;
		}
	}
        if (return_value >= 0) {
   	   //ret = netdev_register_kobject(dev);
           klee_set_metadata(&dev->dev, 1);
	   dev->reg_state = NETREG_REGISTERED;
        }
	return return_value;
}


int register_netdev_PROSE(struct net_device *dev)
{
	int err;

	err = register_netdevice_PROSE(dev);
	return err;
}



void rollback_registered_many_PROSE(struct list_head *head)
{
	struct net_device *dev, *tmp;
        int dev_refcount;
	LIST_HEAD(close_head);


	list_for_each_entry(dev, head, unreg_list) {
		if (dev->netdev_ops->ndo_uninit)
			dev->netdev_ops->ndo_uninit(dev);
                /* Remove entries from kobject tree */
		// inside netdev_unregister_kobject(dev);
                /* Delete sysfs entries but hold kobject reference until after all
                 * netdev references are gone.
                */
               dev_refcount = klee_get_metadata(&dev->dev);
               dev_refcount++;
               klee_set_metadata(&dev->dev, dev_refcount);                
	}
}

void rollback_registered_PROSE(struct net_device *dev)
{
	LIST_HEAD(single);

	list_add(&dev->unreg_list, &single);
	rollback_registered_many_PROSE(&single);
	list_del(&single);
}

void netdev_freemem_PROSE(struct net_device *dev)
{
	char *addr = (char *)dev - dev->padded;

	kfree(addr);
}


void free_netdev_PROSE(struct net_device *dev)
{
        int dev_refcount;

	/*  Compatibility with error handling in drivers */
	if (dev->reg_state == NETREG_UNINITIALIZED) {
		netdev_freemem(dev);
		return;
	}

	if (dev->reg_state != NETREG_UNREGISTERED) 
	   return;

	dev->reg_state = NETREG_RELEASED;

	/* will free via device release */
	//put_device(&dev->dev);
        dev_refcount = klee_get_metadata(&dev->dev);
        dev_refcount--;
        klee_set_metadata(&dev->dev, dev_refcount);
        if (dev_refcount == 0) {
           netdev_freemem_PROSE(dev);            
        }
}

void net_set_todo_PROSE(struct net_device *dev)
{
	list_add_tail(&dev->todo_list, &net_todo_list);
}

void netdev_run_todo_PROSE(void)
{
	struct list_head list;
        int dev_refcount;

	/* Snapshot list, allow later requests */
	list_replace_init(&net_todo_list, &list);

	while (!list_empty(&list)) {
		struct net_device *dev
			= list_first_entry(&list, struct net_device, todo_list);
		list_del(&dev->todo_list);

		dev->reg_state = NETREG_UNREGISTERED;

		if (dev->priv_destructor)
			dev->priv_destructor(dev);

                if (dev->needs_free_netdev)
   	           free_netdev_PROSE(dev); 

		/* Free network device */
		// kobject_put(&dev->dev.kobj);
               dev_refcount = klee_get_metadata(&dev->dev);
               dev_refcount--;
               klee_set_metadata(&dev->dev, dev_refcount);
               if (dev_refcount == 0) {
                  netdev_freemem_PROSE(dev);            
               }
	}
}

void unregister_netdev_PROSE(struct net_device *dev)
{
     // unregister_netdevice => unregister_netdevice_queue
     rollback_registered_PROSE(dev);
     net_set_todo_PROSE(dev);
     // inside  rtnl_unlock
     netdev_run_todo_PROSE();
}


void *__alloc_percpu_gfp_PROSE(size_t size, size_t align, gfp_t gfp)
{
	return kmalloc(size, gfp);
}

