# https://forums.rockylinux.org/t/how-do-i-remove-crashkernel-from-cmdline/13346/7
grubby --update-kernel=ALL --args="crashkernel=no"
# grubby --info /boot/vmlinuz-5.14.0-516.el9.x86_64
