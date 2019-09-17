################################################################################
#
# IPROC crypto test application
#
################################################################################
IPROC_CRYPTO_TEST_SOURCE := $(TOPDIR)/../crypto/cryptotest
IPROC_CRYPTO_TEST_OVERRIDE_SRCDIR = $(IPROC_CRYPTO_TEST_SOURCE)
IPROC_CRYPTO_TEST_DEPENDENCIES = cryptodev-linux

define IPROC_CRYPTO_TEST_BUILD_CMDS
        $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define IPROC_CRYPTO_TEST_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/cryptotest $(TARGET_DIR)/usr/bin
endef

define IPROC_CRYPTO_TEST_UNINSTALL_TARGET_CMDS
        rm -f $(TARGET_DIR)/usr/bin/cryptotest
endef

define IPROC_CRYPTO_TEST_CLEAN_CMDS
        $(MAKE) -C $(@D) clean
endef

$(eval $(generic-package))
