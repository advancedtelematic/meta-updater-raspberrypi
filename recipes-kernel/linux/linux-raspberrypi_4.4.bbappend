#-------------------------------------------------------------------------
# smack patches for handling bluetooth

SRC_URI_append_smack = "\
       file://0001-Smack-File-receive-for-sockets.patch \
       file://0002-smack-fix-cache-of-access-labels.patch \
       file://0003-Smack-ignore-null-signal-in-smack_task_kill.patch \
       file://0004-Smack-Assign-smack_known_web-label-for-kernel-thread.patch \
"
