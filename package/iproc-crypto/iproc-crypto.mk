################################################################################
#
# IPROC crypto acceleration driver
#
################################################################################
IPROC_CRYPTO_SOURCE := $(TOPDIR)/../crypto/iproc-crypto
IPROC_CRYPTO_OVERRIDE_SRCDIR = $(IPROC_CRYPTO_SOURCE)

$(eval $(kernel-module))
$(eval $(generic-package))
