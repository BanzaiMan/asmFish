now := $(shell /bin/date "+%Y-%m-%d")
all:
	./fasmg "x86/fish.asm"
	./fasmg.exe "x86/fish.asm" "asmFishL_$(now)_popcnt"     -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"
	./fasmg.exe "x86/fish.asm" "asmFishL_$(now)_bmi2"       -i "VERSION_OS='L'" -i "VERSION_POST = 'bmi2'"
	./fasmg.exe "arm/fish.arm" "armfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'";     chmod 755 ./armfish
	./fasmg.exe "x86/fish.asm" "asmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"; chmod 755 ./asmfish
	./fasmg.exe "arm/fish.arm" "NEWarmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'"
	./fasmg.exe "x86/fish.asm" "NEWasmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"
	diff "NEWarmfish" "armfish"
	diff "NEWasmfish" "asmfish"
	./fasmg.exe "x86/fish.asm" "asmfish1" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST='popcnt'"; chmod 755 ./asmfish
	./fasmg.exe "arm/fish.arm" "armfish1" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST='v8'"; chmod 755 ./armfish
	aarch64-linux-gnu-as -o master.o -march=armv8-a+crc+crypto "arm/include/master.arm"
	aarch64-linux-gnu-ld -o master master.o
#	aarch64-linux-gnu-objcopy -O binary master.o master
	aarch64-linux-gnu-strip master
	aarch64-linux-gnu-objdump -D -maarch64 -b binary master > master.txt
	./fasmg.exe "arm/include/slave.arm" "slave" -e 1000
	aarch64-linux-gnu-objdump -D -maarch64 -b binary slave > slave.txt
	diff -U9 slave.txt master.txt | less
	./fasmg.exe "arm/include/hello/elf_obj.arm" "hello.o"
