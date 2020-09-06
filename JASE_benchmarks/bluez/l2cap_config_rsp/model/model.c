#include <linux/module.h>

#include <linux/debugfs.h>
#include <linux/crc16.h>
#include <linux/filter.h>

#include <net/bluetooth/bluetooth.h>
#include <net/bluetooth/hci_core.h>
#include <net/bluetooth/l2cap.h>

int l2cap_get_conf_opt_PROSE(void **ptr, int *type, int *olen,
				     unsigned long *val)
{
   struct l2cap_conf_opt *opt = *ptr;
   int len;

   opt->type = 1;
   opt->len = 4;

   len = L2CAP_CONF_OPT_SIZE + opt->len;
   *ptr += len;

   *type = opt->type;
   *olen = opt->len;
   return len;
}
