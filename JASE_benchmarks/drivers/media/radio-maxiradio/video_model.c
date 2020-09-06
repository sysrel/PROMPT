#include "video_model.h"

extern void klee_set_metadata(void *, int);
extern int klee_get_metadata(void *);
extern void klee_make_symbolic(void *array, size_t nbytes, const char *name);
extern void klee_assume(uintptr_t x);

// models the case when the function calls a successful return value: GTEQZERO
int __video_register_device_PROSE(struct video_device *vdev, int type, int nr,
		int warn_if_nr_in_use, struct module *owner)
{
   int video_refcount, v4l2_refcount;
   int return_value;
   
   klee_make_symbolic(&return_value, sizeof(return_value), "__video_register_device_return_value");
   if (return_value >=0 ) {
      // modeling ret = device_register(&vdev->dev);
      klee_set_metadata(&vdev->dev,1);

      v4l2_device_get_PROSE(vdev->v4l2_dev);
  
   }
   return return_value;
}


void video_unregister_device_PROSE(struct video_device *vdev)
{
     struct v4l2_device *v4l2_dev;
     int video_refcount, v4l2_refcount;

     if (!vdev)
        return;
     v4l2_dev = vdev->v4l2_dev;
     // device_unregister calls put_device(dev);
     video_refcount = klee_get_metadata(&vdev->dev);
     klee_set_metadata(&vdev->dev, --video_refcount);     
     if (video_refcount == 0)
     {// v4l2_device_release from v4l2-dev.c gets called
         if (v4l2_dev->release == NULL)
		v4l2_dev = NULL;

         if (vdev->release)
            vdev->release(vdev);

         if (v4l2_dev) 
            v4l2_device_put(v4l2_dev);
     } 
}


int v4l2_device_register_PROSE(struct device *dev, struct v4l2_device *v4l2_dev)
{
   int dev_refcount;
   int return_value;
   
   klee_make_symbolic(&return_value, sizeof(return_value), "v4l2_device_register_return_value");
   if (return_value >=0 ) {
      dev_refcount = klee_get_metadata(dev);
      klee_set_metadata(dev, ++dev_refcount);
      klee_set_metadata(v4l2_dev, 1); 
      v4l2_dev->dev = dev;
      // if (!dev_get_drvdata(dev))
      if (!dev->driver_data)
        // dev_set_drvdata 
        dev->driver_data = v4l2_dev;
   }
   return return_value;
}

void v4l2_device_unregister_PROSE(struct v4l2_device *v4l2_dev)
{
   if (v4l2_dev == NULL)
      return;		
   v4l2_device_disconnect(v4l2_dev);
}

void v4l2_device_disconnect_PROSE(struct v4l2_device *v4l2_dev)
{
   int dev_refcount; 
   if (v4l2_dev->dev == NULL)
      return;

   if (v4l2_dev->dev->driver_data == v4l2_dev)
      v4l2_dev->dev->driver_data = NULL;
   // put_device(v4l2_dev->dev);
   // we just model the relative update of the refcount for a device structure as their 
   // lifecycle, e.g., the device embedded by a usb_interface type object, is handled by 
   // the USB core and not the driver itself
   dev_refcount = klee_get_metadata(v4l2_dev->dev);
   klee_set_metadata(v4l2_dev->dev, --dev_refcount);
   v4l2_dev->dev = NULL;   
}

int v4l2_device_put_PROSE(struct v4l2_device *v4l2_dev)
{
    int v4l2_refcount;
    int return_value;

    klee_make_symbolic(&return_value, sizeof(return_value), "v4l2_device_put_return_value");
    if (return_value >= 0) { 
       v4l2_refcount = klee_get_metadata(v4l2_dev);
       klee_set_metadata(v4l2_dev,--v4l2_refcount);
       if (v4l2_refcount == 0) 
       {
          // v4l2_device_release from v4l2-device.c gets called
          if (v4l2_dev->release)
             v4l2_dev->release(v4l2_dev); 
       }  	
    }
    return return_value;
}

// original is defined as an inlined function 
// Therefore, we add _PROSE to avoid compilation errors!
void v4l2_device_get_PROSE(struct v4l2_device *v4l2_dev)
{
    int v4l2_refcount; 
    v4l2_refcount = klee_get_metadata(v4l2_dev);
    klee_set_metadata(v4l2_dev,++v4l2_refcount);
}

int atomic_add_return_PROSE(int i, atomic_t *v)
{
    return i + v->counter;
}

void atomic_dec_PROSE(atomic_t *v) 
{
   v->counter--;
}

void atomic_inc_PROSE(atomic_t *v) 
{
   v->counter--;
}

void v4l2_i2c_subdev_init_PROSE(struct v4l2_subdev *sd, struct i2c_client *client,
		const struct v4l2_subdev_ops *ops)
{
	sd->flags |= V4L2_SUBDEV_FL_IS_I2C;
	/* the owner is the same as the i2c_client's driver owner */
	sd->owner = client->dev.driver->owner;
	sd->dev = &client->dev;
	/* i2c_client and v4l2_subdev point to one another */
	//v4l2_set_subdevdata(sd, client);
        sd->dev_priv = client;
	//i2c_set_clientdata(client, sd);
        client->dev.driver_data = sd;
}
