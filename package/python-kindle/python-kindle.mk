################################################################################
#
# python-kindle
#
################################################################################

PYTHON_KINDLE_VERSION = 5711c6a3107dd9ce44cfc95d575e9edbea2e174e
PYTHON_KINDLE_SITE = https://github.com/katadelos/python-kindle.git
PYTHON_KINDLE_SITE_METHOD = git
PYTHON_KINDLE_SETUP_TYPE = setuptools
PYTHON_KINDLE_DEPENDENCIES = host-pkgconf host-python-cffi
PYTHON_KINDLE_LICENSE = MIT
PYTHON_KINDLE_LICENSE_FILES = LICENSE

# openlipc uses cffi to build bindings, which needs pkg-config
HOST_PYTHON_KINDLE_DEPENDENCIES = host-pkgconf


$(eval $(python-package))
