FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

# dtoverlays and dtparam definitions in rpi's config.txt are ignored when using
# ostree integration. You will have to patch existing dts or add overlays in
# your layer to achieve the same results.
# As a common example, here is a patch to enable audio support.
#
# see README.md and https://github.com/advancedtelematic/meta-updater-raspberrypi/issues/23 for
# more details
SRC_URI_append = " ${@oe.utils.conditional('ENABLE_AUDIO', '1', 'file://audio.patch', '', d)}"

do_configure_append_sota() {
    # ramblk for inird
    kernel_configure_variable BLK_DEV_RAM y
}

