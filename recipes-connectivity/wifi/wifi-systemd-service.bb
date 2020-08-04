LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=815ca599c9df247a0c7f619bab123dad"

RDEPENDS_${PN} += " kernel-modules linux-firmware-rpidistro-bcm43430 linux-firmware-rpidistro-bcm43455 wpa-supplicant "

SRC_URI = "\
    file://26-dhcp-wireless.network \
    file://wpa_supplicant-wlan0.conf \
    "

inherit useradd

USERADD_PACKAGES = "${PN}"
GROUPADD_PARAM_${PN} = "-fr netdev"

do_install () {
    if [ -z ${RPI_WIFI_SSID} ]; then
        bbfatal "RPI_WIFI_SSID is not defined!"
    fi
    if [ -z ${RPI_WIFI_PWD} ]; then
        bbfatal "RPI_WIFI_PWD is not defined!"
    fi

    install -d ${D}/${systemd_unitdir}/network
    install -m 0644 ${WORKDIR}/26-dhcp-wireless.network ${D}/${systemd_unitdir}/network

    install -d ${D}/${sysconfdir}/wpa_supplicant
    install -m 0600 ${WORKDIR}/wpa_supplicant-wlan0.conf ${D}/${sysconfdir}/wpa_supplicant
    sed -i -e 's|@SSID@|${RPI_WIFI_SSID}|g' \
           -e 's|@PWD@|${RPI_WIFI_PWD}|g' \
           ${D}/${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf

    install -d ${D}/${sysconfdir}/systemd/system/multi-user.target.wants
    ln -s -r "${D}/${systemd_unitdir}/system/wpa_supplicant@.service" "${D}/${sysconfdir}/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service"
}

FILES_${PN} = " \
                ${systemd_unitdir}/network/26-dhcp-wireless.network \
                ${sysconfdir}/wpa_supplicant \
                ${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf \
                ${sysconfdir}/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service \
              "
