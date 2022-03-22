# pintos_configuration
适配在 Macos 上使用 Clion 进行 debug 的 pintos.
1. brew install qemu x86_64-elf-gcc x86_64-elf-binutils
2. 最新的代码在： git clone git://pintos-os.org/pintos-anon，但是建议使用我的修改版本：
 
```git clone https://github.com/qzeng2490/pintos_configuration```
 
3. 修改~/.bashrc（如果echo $0输出了-bash）或者~/.zshrc（如果echo $0输出了-zsh），增加以下内容到文件末尾：
```
export PINTOSHOME=<你的Pintos路径> 
export GDBMACROS=$PINTOSHOME/src/misc/gdb-marcos 
export PATH=$PATH:$PINTOSHOME/src/utils
```
4. cd src/utils && make
5. cd src/threads && make && cd build && pintos --qemu  --
6. 在src/threads新建一个bash脚本，写入以下内容
```
#!/usr/bin/env bash
make
cd build || exit
killall qemu-system-i386 # 杀掉上一次打开的QEMU。Clion不能在停止Debug的时候关闭QEMU。

CMD="run alarm-single" # 你要运行的指令。
nohup bash -c "DISPLAY=window ../../utils/pintos --qemu --gdb -- $CMD > pintos.log" &
echo "Done!"
```
7. 用clion打开项目。如果之前打开过项目，删除.idea文件夹后再打开。点击右上角的Add configurations,选择GDB Remote Debug,

       ’target remote‘ args 填入以下信息：```tcp:localhost:1234```

       Symbol file:选择你 src/threads/build/kernel.o

       Path mappings:
       remote: ../../threads
       local: 你的项目的完整路径/src/threads

       Before launch:添加一个Run external tool,选择上面新建的bash脚本

8. Cmd+D or Ctrl+D即可调试
