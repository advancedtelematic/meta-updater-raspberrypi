FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

do_configure_append_sota() {
    # ramblk for inird
    kernel_configure_variable BLK_DEV_RAM y
}

ENABLE_UART_raspberrypi3 ?= "1"
ENABLE_UART_raspberrypi4 ?= "1"
