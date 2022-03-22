#!/usr/bin/env bash
make
cd build || exit
killall qemu-system-i386 # 杀掉上一次打开的QEMU。Clion不能在停止Debug的时候关闭QEMU。

CMD="run args-none" # 你要运行的指令。
nohup bash -c "DISPLAY=window ../../utils/pintos -v -k -T 60 --qemu  --filesys-size=2 -p tests/userprog/args-none -a args-none --gdb -- -q  -f run args-none > pintos.log" &
echo "Done!"