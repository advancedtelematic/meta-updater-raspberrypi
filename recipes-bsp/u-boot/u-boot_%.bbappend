FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_rpi = " \
                      file://0001-Increase-rpi-BOOTM_LEN.patch \
                      file://0001-board-raspberrypi-add-serial-and-revision-to-the-dev.patch \
                      file://bootcount.cfg \
                      file://fit.cfg \
                      file://fw_env.config \
                     "

SRC_URI_append_raspberrypi4 = " \
                               file://rpi4-fixup-mem.cfg \
                              "

# build u-boot image suitable for use with qemu
# we need to masquerade a kernel uImage, due to qemu limitations
# (see https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg05094.html)
# thus, we cannot use u-boot default rule for u-boot.img which sets a correct
# "u-boot" as image type

DEPENDS_append_rpi = " u-boot-mkimage-native"

UBOOT_LOAD_ADDR = "0x8000"
UBOOT_LOAD_ADDR_raspberrypi3-64 = "0x80000"
UBOOT_LOAD_ADDR_raspberrypi4-64 = "0x80000"

do_compile_append_rpi() {
	uboot-mkimage -A arm -T kernel -C none -O linux -a ${UBOOT_LOAD_ADDR} -e ${UBOOT_LOAD_ADDR} -d ${B}/u-boot.bin ${B}/u-boot-qemu.img
}

do_install_append_rpi () {
  install -d ${D}${sysconfdir}
  install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}

do_deploy_append_rpi() {
	install -m 644 ${B}/u-boot-qemu.img ${DEPLOYDIR}/u-boot-qemu.img
}
