# Amazon Yoshi (Kindle 5)

Notes for the `amazon_yoshime` Buildroot defconfig.

- U-Boot: legacy build system (2009.08). The defconfig uses board name `yoshi`.
- Linux kernel: custom git tree from Lab126 (2.6.31). The defconfig uses
  `imx50_yoshime_defconfig`.
- Toolchain: see `README-KINDLE.md` for the external toolchain details used in
  this tree. Adjust in `make menuconfig` if needed.