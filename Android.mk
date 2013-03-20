ifeq ($(BOARD_VENDOR),motorola-omap4-kexec)

LOCAL_PATH := $(call my-dir)

#Creating Gralloc SymLink
GRALLOC_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/gralloc.omap4.so
$(GRALLOC_SYMLINK): GRALLOC_FILE := gralloc.omap4430.so
$(GRALLOC_SYMLINK): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(GRALLOC_FILE)"
	@rm -rf $@
	$(hide) ln -fs $(GRALLOC_FILE) $@

ALL_DEFAULT_INSTALLED_MODULES += $(GRALLOC_SYMLINK)

# for mm/mmm
all_modules: $(GRALLOC_SYMLINK)

include $(all-subdir-makefiles)

endif
