#
# KERNEL
#
ifeq ($(BOXTYPE), hd51)
KERNEL_VER             = 4.10.12
KERNEL_DATE            = 20180424
KERNEL_TYPE            = hd51
KERNEL_SRC             = linux-$(KERNEL_VER)-arm.tar.gz
KERNEL_URL             = http://source.mynonpublic.com/gfutures
KERNEL_CONFIG          = hd51_defconfig
KERNEL_DIR             = $(BUILD_TMP)/linux-$(KERNEL_VER)
KERNEL_PATCHES_ARM     = $(HD51_PATCHES)
KERNEL_DTB_VER         = bcm7445-bcm97445svmb.dtb
endif

ifeq ($(BOXTYPE), hd60)
KERNEL_VER             = 4.4.35
KERNEL_DATE            = 20180301
KERNEL_TYPE            = hd60
KERNEL_SRC             = linux-$(KERNEL_VER)-$(KERNEL_DATE)-arm.tar.gz
KERNEL_URL             = http://downloads.mutant-digital.net
KERNEL_CONFIG          = hd60_defconfig
KERNEL_DIR             = $(BUILD_TMP)/linux-$(KERNEL_VER)
KERNEL_PATCHES_ARM     = $(HD60_PATCHES)
endif

ifeq ($(BOXTYPE), vusolo4k)
KERNEL_VER             = 3.14.28-1.8
KERNEL_TYPE            = vusolo4k
KERNEL_SRC_VER         = 3.14-1.8
KERNEL_SRC             = stblinux-${KERNEL_SRC_VER}.tar.bz2
KERNEL_URL             = http://archive.vuplus.com/download/kernel
ifeq ($(VU_MULTIBOOT), 1)
KERNEL_CONFIG          = vusolo4k_defconfig_multi
else
KERNEL_CONFIG          = vusolo4k_defconfig
endif
KERNEL_DIR             = $(BUILD_TMP)/linux
KERNEL_PATCHES_ARM     = $(VUSOLO4K_PATCHES)
endif

ifeq ($(BOXTYPE), vuduo4k)
KERNEL_VER             = 4.1.45-1.17
KERNEL_TYPE            = vuduo4k
KERNEL_SRC_VER         = 4.1-1.17
KERNEL_SRC             = stblinux-${KERNEL_SRC_VER}.tar.bz2
KERNEL_URL             = http://archive.vuplus.com/download/kernel
ifeq ($(VU_MULTIBOOT), 1)
KERNEL_CONFIG          = vuduo4k_defconfig_multi
else
KERNEL_CONFIG          = vuduo4k_defconfig
endif
KERNEL_DIR             = $(BUILD_TMP)/linux
KERNEL_PATCHES_ARM     = $(VUDUO4K_PATCHES)
endif

ifeq ($(BOXTYPE), vuultimo4k)
KERNEL_VER             = 3.14.28-1.12
KERNEL_TYPE            = vuultimo4k
KERNEL_SRC_VER         = 3.14-1.12
KERNEL_SRC             = stblinux-${KERNEL_SRC_VER}.tar.bz2
KERNEL_URL             = http://archive.vuplus.com/download/kernel
ifeq ($(VU_MULTIBOOT), 1)
KERNEL_CONFIG          = vuultimo4k_defconfig_multi
else
KERNEL_CONFIG          = vuultimo4k_defconfig
endif
KERNEL_DIR             = $(BUILD_TMP)/linux
KERNEL_PATCHES_ARM     = $(VUULTIMO4K_PATCHES)
endif

ifeq ($(BOXTYPE), vuzero4k)
KERNEL_VER             = 4.1.20-1.9
KERNEL_TYPE            = vuzero4k
KERNEL_SRC_VER         = 4.1-1.9
KERNEL_SRC             = stblinux-${KERNEL_SRC_VER}.tar.bz2
KERNEL_URL             = http://archive.vuplus.com/download/kernel
ifeq ($(VU_MULTIBOOT), 1)
KERNEL_CONFIG          = vuzero4k_defconfig_multi
else
KERNEL_CONFIG          = vuzero4k_defconfig
endif
KERNEL_DIR             = $(BUILD_TMP)/linux
KERNEL_PATCHES_ARM     = $(VUZERO4K_PATCHES)
endif

#
# Todo: findkerneldevice.py

DEPMOD = $(HOST_DIR)/bin/depmod

#
# Patches Kernel
#
COMMON_PATCHES_ARM = \

HD51_PATCHES = \
		armbox/hd51_TBS-fixes-for-4.10-kernel.patch \
		armbox/hd51_0001-Support-TBS-USB-drivers-for-4.6-kernel.patch \
		armbox/hd51_0001-TBS-fixes-for-4.6-kernel.patch \
		armbox/hd51_0001-STV-Add-PLS-support.patch \
		armbox/hd51_0001-STV-Add-SNR-Signal-report-parameters.patch \
		armbox/hd51_blindscan2.patch \
		armbox/hd51_0001-stv090x-optimized-TS-sync-control.patch \
		armbox/hd51_reserve_dvb_adapter_0.patch \
		armbox/hd51_blacklist_mmc0.patch \
		armbox/hd51_export_pmpoweroffprepare.patch

HD60_PATCHES = \

COMMON_PATCHES_3_14 = \
		armbox/3_14_bcm_genet_disable_warn.patch \
		armbox/3_14_linux_dvb-core.patch \
		armbox/3_14_rt2800usb_fix_warn_tx_status_timeout_to_dbg.patch \
		armbox/3_14_usb_core_hub_msleep.patch \
		armbox/3_14_rtl8712_fix_build_error.patch \
		armbox/3_14_kernel-add-support-for-gcc6.patch \
		armbox/3_14_kernel-add-support-for-gcc7.patch \
		armbox/3_14_kernel-add-support-for-gcc8.patch \
		armbox/3_14_0001-Support-TBS-USB-drivers.patch \
		armbox/3_14_0001-STV-Add-PLS-support.patch \
		armbox/3_14_0001-STV-Add-SNR-Signal-report-parameters.patch \
		armbox/3_14_0001-stv090x-optimized-TS-sync-control.patch \
		armbox/3_14_blindscan2.patch \
		armbox/3_14_genksyms_fix_typeof_handling.patch \
		armbox/3_14_0001-tuners-tda18273-silicon-tuner-driver.patch \
		armbox/3_14_01-10-si2157-Silicon-Labs-Si2157-silicon-tuner-driver.patch \
		armbox/3_14_02-10-si2168-Silicon-Labs-Si2168-DVB-T-T2-C-demod-driver.patch \
		armbox/3_14_0003-cxusb-Geniatech-T230-support.patch \
		armbox/3_14_CONFIG_DVB_SP2.patch \
		armbox/3_14_dvbsky.patch \
		armbox/3_14_rtl2832u-2.patch \
		armbox/3_14_0004-log2-give-up-on-gcc-constant-optimizations.patch \
		armbox/3_14_0005-uaccess-dont-mark-register-as-const.patch \
		armbox/3_14_0006-makefile-disable-warnings.patch \
		armbox/3_14_linux_dvb_adapter.patch

VUSOLO4K_PATCHES = $(COMMON_PATCHES_3_14) \
		armbox/vusolo4k_linux_rpmb_not_alloc.patch \
		armbox/vusolo4k_fix_mmc_3.14.28-1.10.patch

VUDUO4K_PATCHES = \
		armbox/vuduo4k_bcmsysport_4_1_45.patch \
		armbox/vuduo4k_linux_dvb-core.patch \
		armbox/vuduo4k_linux_dvb_adapter.patch \
		armbox/vuduo4k_linux_usb_hub.patch

VUULTIMO4K_PATCHES = $(COMMON_PATCHES_3_14) \
		armbox/vuultimo4k_bcmsysport_3.14.28-1.12.patch \
		armbox/vuultimo4k_linux_prevent_usb_dma_from_bmem.patch

VUZERO4K_PATCHES = \
		armbox/vuzero4k_bcmgenet-recovery-fix.patch \
		armbox/vuzero4k_kernel-gcc6.patch \
		armbox/vuzero4k_linux_dvb-core.patch \
		armbox/vuzero4k_linux_dvb_adapter.patch \
		armbox/vuzero4k_linux_rpmb_not_alloc.patch \
		armbox/vuzero4k_linux_4_1_1_9_dvbs2x.patch

#
# KERNEL
#
KERNEL_PATCHES = $(KERNEL_PATCHES_ARM)

$(ARCHIVE)/$(KERNEL_SRC):
	$(WGET) $(KERNEL_URL)/$(KERNEL_SRC)

$(D)/kernel.do_prepare: $(ARCHIVE)/$(KERNEL_SRC) $(PATCHES)/armbox/$(KERNEL_CONFIG)
	$(START_BUILD)
	rm -rf $(KERNEL_DIR)
	$(UNTAR)/$(KERNEL_SRC)
	set -e; cd $(KERNEL_DIR); \
		for i in $(KERNEL_PATCHES); do \
			echo -e "==> $(TERM_RED)Applying Patch:$(TERM_NORMAL) $$i"; \
			$(PATCH)/$$i; \
		done
	install -m 644 $(PATCHES)/armbox/$(KERNEL_CONFIG) $(KERNEL_DIR)/.config
ifeq ($(OPTIMIZATIONS), $(filter $(OPTIMIZATIONS), kerneldebug debug))
	@echo "Using kernel debug"
	@grep -v "CONFIG_PRINTK" "$(KERNEL_DIR)/.config" > $(KERNEL_DIR)/.config.tmp
	cp $(KERNEL_DIR)/.config.tmp $(KERNEL_DIR)/.config
	@echo "CONFIG_PRINTK=y" >> $(KERNEL_DIR)/.config
	@echo "CONFIG_PRINTK_TIME=y" >> $(KERNEL_DIR)/.config
endif
	@touch $@

$(D)/kernel.do_compile: $(D)/kernel.do_prepare
ifeq ($(BOXTYPE), hd51)
	set -e; cd $(KERNEL_DIR); \
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm oldconfig
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(TARGET)- $(KERNEL_DTB_VER) zImage modules
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(TARGET)- DEPMOD=$(DEPMOD) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
	@touch $@
endif
ifeq ($(BOXTYPE), hd60)
	set -e; cd $(KERNEL_DIR); \
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm oldconfig
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(TARGET)- uImage modules
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(TARGET)- DEPMOD=$(DEPMOD) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
	@touch $@
endif
ifeq ($(BOXTYPE), $(filter $(BOXTYPE), vusolo4k vuduo4k vuultimo4k vuzero4k))
	set -e; cd $(KERNEL_DIR); \
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm oldconfig
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(TARGET)- zImage modules
		$(MAKE) -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(TARGET)- DEPMOD=$(DEPMOD) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
	@touch $@
endif

KERNEL = $(D)/kernel
$(D)/kernel: $(D)/bootstrap $(D)/kernel.do_compile
ifeq ($(BOXTYPE), hd51)
	install -m 644 $(KERNEL_DIR)/arch/arm/boot/zImage $(BOOT_DIR)/vmlinux.ub
	install -m 644 $(KERNEL_DIR)/vmlinux $(TARGET_DIR)/boot/vmlinux-arm-$(KERNEL_VER)
	install -m 644 $(KERNEL_DIR)/System.map $(TARGET_DIR)/boot/System.map-arm-$(KERNEL_VER)
	cp $(KERNEL_DIR)/arch/arm/boot/zImage $(TARGET_DIR)/boot/
	cat $(KERNEL_DIR)/arch/arm/boot/zImage $(KERNEL_DIR)/arch/arm/boot/dts/$(KERNEL_DTB_VER) > $(TARGET_DIR)/boot/zImage.dtb
	rm $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/build || true
	rm $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/source || true
	$(TOUCH)
endif
ifeq ($(BOXTYPE), hd60)
	install -m 644 $(KERNEL_DIR)/arch/arm/boot/zImage $(BOOT_DIR)/vmlinux.ub
	install -m 644 $(KERNEL_DIR)/vmlinux $(TARGET_DIR)/boot/vmlinux-arm-$(KERNEL_VER)
	install -m 644 $(KERNEL_DIR)/System.map $(TARGET_DIR)/boot/System.map-arm-$(KERNEL_VER)
	cp $(KERNEL_DIR)/arch/arm/boot/uImage $(TARGET_DIR)/boot/
	rm $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/build || true
	rm $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/source || true
	$(TOUCH)
endif
ifeq ($(BOXTYPE), $(filter $(BOXTYPE), vusolo4k vuduo4k vuultimo4k vuzero4k))
	install -m 644 $(KERNEL_DIR)/arch/arm/boot/zImage $(BOOT_DIR)/vmlinux
	install -m 644 $(KERNEL_DIR)/vmlinux $(TARGET_DIR)/boot/vmlinux-arm-$(KERNEL_VER)
	install -m 644 $(KERNEL_DIR)/System.map $(TARGET_DIR)/boot/System.map-arm-$(KERNEL_VER)
	cp $(KERNEL_DIR)/arch/arm/boot/zImage $(TARGET_DIR)/boot/
	rm $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/build || true
	rm $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/source || true
	$(TOUCH)
endif

kernel-distclean:
	rm -f $(D)/kernel
	rm -f $(D)/kernel.do_compile
	rm -f $(D)/kernel.do_prepare

kernel-clean:
	-$(MAKE) -C $(KERNEL_DIR) clean
	rm -f $(D)/kernel
	rm -f $(D)/kernel.do_compile

#
# Helper
#
kernel.menuconfig kernel.xconfig: \
kernel.%: $(D)/kernel
	$(MAKE) -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(TARGET)- $*
	@echo ""
	@echo "You have to edit $(PATCHES)/armbox/$(KERNEL_CONFIG) m a n u a l l y to make changes permanent !!!"
	@echo ""
	diff $(KERNEL_DIR)/.config.old $(KERNEL_DIR)/.config
	@echo ""
