
do_install_append () {

  cat >${D}${sysconfdir}/fw_env.config <<EOF

/mnt/bootpart/uboot.env 0x0000    0x4000

EOF
}
