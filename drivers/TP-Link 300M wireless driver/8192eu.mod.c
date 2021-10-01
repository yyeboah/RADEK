#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=cfg80211";

MODULE_ALIAS("usb:v0BDAp818Bd*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDAp818Cd*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v2357p0107d*dc*dsc*dp*ic*isc*ip*in*");
MODULE_ALIAS("usb:v2357p0108d*dc*dsc*dp*ic*isc*ip*in*");
MODULE_ALIAS("usb:v2357p0109d*dc*dsc*dp*ic*isc*ip*in*");
MODULE_ALIAS("usb:v2357p0126d*dc*dsc*dp*ic*isc*ip*in*");
MODULE_ALIAS("usb:v2019pAB33d*dc*dsc*dp*ic*isc*ip*in*");
MODULE_ALIAS("usb:v2001p3319d*dc*dsc*dp*ic*isc*ip*in*");
MODULE_ALIAS("usb:v2C4Ep0100d*dc*dsc*dp*ic*isc*ip*in*");

MODULE_INFO(srcversion, "5F063B49C7E211942486C33");
