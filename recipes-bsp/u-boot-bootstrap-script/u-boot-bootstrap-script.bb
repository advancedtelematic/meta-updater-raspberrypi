DESCRIPTION = "Bootstrap u-boot script loading the main one provided by meta-updater"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

DEPENDS = "u-boot-mkimage-native"

PR = "r1"

COMPATIBLE_MACHINE = "raspberrypi"

SRC_URI = "file://boot.scr"

S = "${WORKDIR}"

inherit deploy

do_deploy() {
    install -d ${DEPLOYDIR}/bcm2835-bootfiles

    mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "Ostree boot script" -d ${S}/boot.scr ${DEPLOYDIR}/bcm2835-bootfiles/boot.scr
}

addtask deploy before do_package after do_install
do_deploy[dirs] += "${DEPLOYDIR}/bcm2835-bootfiles"

PACKAGE_ARCH = "${MACHINE_ARCH}"
