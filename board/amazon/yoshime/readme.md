# Amazon Yoshi (Kindle 5)

Notes for the `amazon_yoshime` Buildroot defconfig.

- U-Boot: legacy build system (2009.08). The defconfig uses board name `yoshi`.
- Linux kernel: custom git tree from Lab126 (2.6.31). The defconfig uses
  `imx50_yoshime_defconfig`.
- Toolchain: Buildroot internal glibc 2.12.2, with kernel headers taken from
  the kernel tree (2.6.31).
