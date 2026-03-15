################################################################################
#
# fbink
#
################################################################################

FBINK_VERSION = v1.25.0
FBINK_SITE = https://github.com/NiLuJe/FBInk.git
FBINK_SITE_METHOD = git
FBINK_GIT_SUBMODULES = YES
FBINK_LICENSE = Apache-2.0
FBINK_LICENSE_FILES = LICENSE
FBINK_CPE_ID_VENDOR = fbink
FBINK_CPE_ID_PRODUCT = fbink

FBINK_MAKE_OPTS = KINDLE=1

define FBINK_BUILD_CMDS
	# Build main fbink binary
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(FBINK_MAKE_OPTS) \
		CC="$(TARGET_CC)" LD="$(TARGET_LD)" AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)" STRIP="$(TARGET_STRIP)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" kindle

	# Build fbdepth tool
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		CC="$(TARGET_CC)" LD="$(TARGET_LD)" AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)" STRIP="$(TARGET_STRIP)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" fbdepth KINDLE=1

	# Build shared library
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		CC="$(TARGET_CC)" LD="$(TARGET_LD)" AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)" STRIP="$(TARGET_STRIP)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" sharedlib SHARED=1 KINDLE=1

	# Strip the library
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		AR=$(TARGET_AR) RANLIB=$(TARGET_RANLIB) STRIP=$(TARGET_STRIP) striplib
endef

define FBINK_INSTALL_TARGET_CMDS
	# Install fbink binary
	$(INSTALL) -m 0755 -D $(@D)/Release/fbink $(TARGET_DIR)/usr/bin/fbink

	# Install fbdepth
	$(INSTALL) -m 0755 -D $(@D)/Release/fbdepth $(TARGET_DIR)/usr/bin/fbdepth

	# Install shared library
	$(INSTALL) -m 0755 -D $(@D)/Release/libfbink.so $(TARGET_DIR)/usr/lib/libfbink.so
	$(INSTALL) -m 0644 -D $(@D)/Release/libfbink.so.1 $(TARGET_DIR)/usr/lib/libfbink.so.1

	# Install header
	$(INSTALL) -m 0644 -D $(@D)/fbink.h $(TARGET_DIR)/usr/include/fbink.h

	# Install to staging for python bindings
	$(INSTALL) -d $(STAGING_DIR)/usr/include
	$(INSTALL) -m 0644 -D $(@D)/fbink.h $(STAGING_DIR)/usr/include/fbink.h
	$(INSTALL) -d $(STAGING_DIR)/usr/lib
	$(INSTALL) -m 0755 -D $(@D)/Release/libfbink.so $(STAGING_DIR)/usr/lib/libfbink.so
	$(INSTALL) -m 0644 -D $(@D)/Release/libfbink.so.1 $(STAGING_DIR)/usr/lib/libfbink.so.1
endef

$(eval $(generic-package))
