LINUX_VERSION ?= "4.19.44"
LINUX_RPI_BRANCH ?= "rpi-4.19.y"

require recipes-kernel/linux/linux-raspberrypi.inc

SRCREV = "b45a32b47b76cb64225d19841c20ee85ea97874d"
SRC_URI = " \
    git://github.com/raspberrypi/linux.git;protocol=git;branch=${LINUX_RPI_BRANCH} \
    "

# checksum of this kernel version differs from the one specified in linux-raspberrypi.inc
LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
