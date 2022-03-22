#!/usr/bin/env bash
make
cd build || exit
#killall qemu-system-i386 # 杀掉上一次打开的QEMU。Clion不能在停止Debug的时候关闭QEMU。
#
#CMD="run alarm-single" # 你要运行的指令。
#nohup bash -c "DISPLAY=window ../../utils/pintos --qemu --gdb -- $CMD > pintos.log" &
#echo "Done!"
