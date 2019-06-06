FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
                  file://0001-Enable-FIT-and-bootcount-on-RPi3.patch \
                  file://0001-board-raspberrypi-add-serial-and-revision-to-the-dev.patch \
                  file://0001-Increase-rpi-BOOTM_LEN.patch \
                 "
