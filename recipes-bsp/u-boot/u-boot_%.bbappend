FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_rpi = " \
                      file://0001-board-raspberrypi-add-serial-and-revision-to-the-dev.patch \
                      file://0001-Increase-rpi-BOOTM_LEN.patch \
                      file://fit.cfg \
                      file://bootcount.cfg \
                     "
