do_install_append_rpi () {
    mkdir -p ${D}/mnt/bootpart
    cat >> ${D}${sysconfdir}/fstab <<EOF

/dev/mmcblk0p1	/mnt/bootpart	vfat	noatime	0	0

EOF
}
