#include <linux/types.h>
#include <media/v4l2-device.h>
#include <media/v4l2-ctrls.h>
#include <media/videobuf2-v4l2.h>
#include <media/videobuf2-vmalloc.h>
#include <linux/i2c.h>

// models the case when the function calls a successful return value: GTEQZERO
int __video_register_device_PROSE_GTEQZERO(struct video_device *vdev, int type, int nr,
		int warn_if_nr_in_use, struct module *owner);

void video_unregister_device_PROSE(struct video_device *vdev);

int v4l2_device_register_PROSE(struct device *dev, struct v4l2_device *v4l2_dev);

void v4l2_device_unregister_PROSE(struct v4l2_device *v4l2_dev);

void v4l2_device_disconnect_PROSE(struct v4l2_device *v4l2_dev);

int v4l2_device_put_PROSE(struct v4l2_device *v4l2_dev);

void v4l2_device_get_PROSE(struct v4l2_device *v4l2_dev);
