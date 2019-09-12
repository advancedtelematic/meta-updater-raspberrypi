FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append_raspberrypi4 = " file://0001-Add-rpi4-uart0-dtb-overlay.patch"

do_configure_append_sota() {
    # ramblk for inird
    kernel_configure_variable BLK_DEV_RAM y
}

ENABLE_UART_raspberrypi3 ?= "1"
ENABLE_UART_raspberrypi4 ?= "1"
