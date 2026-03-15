# Kindle stuff

## Toolchain
Often packages will compile on host but fail on target - caused by ancient glibc on target

Not building in Buildroot yet, use external toolchain:

```
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/home/builder/x-tools/arm-kindle5-linux-gnueabi/"
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
BR2_PACKAGE_HAS_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL="toolchain-external-custom"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-kindle5-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-kindle5-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_GCC_14=y
```


## Linker
To pick up libs in userstore:
```
BR2_TARGET_LDFLAGS="-Wl,-rpath,/mnt/us/buildroot/lib,-rpath,/mnt/us/buildroot/usr/lib"
```

## Busybox
- disable:
  - Misc/seedrng
  - Misc/watchdog