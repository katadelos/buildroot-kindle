################################################################################
#
# python-fbink
#
################################################################################

PYTHON_FBINK_VERSION = d41523291fa8a5de2570749cf1f61135c7039b4f
PYTHON_FBINK_SITE = https://github.com/NiLuJe/py-fbink.git
PYTHON_FBINK_SITE_METHOD = git
PYTHON_FBINK_SETUP_TYPE = setuptools
PYTHON_FBINK_DEPENDENCIES = fbink host-pkgconf host-python-cffi
PYTHON_FBINK_LICENSE = GPL-3.0-or-later
PYTHON_FBINK_LICENSE_FILES = LICENSE

# py-fbink uses cffi to build bindings, which needs pkg-config
HOST_PYTHON_FBINK_DEPENDENCIES = host-pkgconf


$(eval $(python-package))
