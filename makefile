now := $(shell /bin/date "+%Y-%m-%d")
all:
	./fasm.x64 "arm/fish.arm" "armFishL_$(now)_v8"         -i "VERSION_OS='L'"
	./fasm.x64 "x86/fish.asm" "asmFishL_$(now)_base"       -i "VERSION_OS='L'"
	./fasm.x64 "x86/fish.asm" "asmFishL_$(now)_popcnt"     -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"
	./fasm.x64 "x86/fish.asm" "asmFishL_$(now)_bmi2"       -i "VERSION_OS='L'" -i "VERSION_POST = 'bmi2'"
	./fasm.x64 "x86/fish.asm" "asmFishW_$(now)_base.exe"   -i "VERSION_OS='W'"
	./fasm.x64 "x86/fish.asm" "asmFishW_$(now)_popcnt.exe" -i "VERSION_OS='W'" -i "VERSION_POST = 'popcnt'"
	./fasm.x64 "x86/fish.asm" "asmFishW_$(now)_bmi2.exe"   -i "VERSION_OS='W'" -i "VERSION_POST = 'bmi2'"
	./fasm.x64 "x86/fish.asm" "asmFishX_$(now)_base"       -i "VERSION_OS='X'"
	./fasm.x64 "x86/fish.asm" "asmFishX_$(now)_popcnt"     -i "VERSION_OS='X'" -i "VERSION_POST = 'popcnt'"
	./fasm.x64 "x86/fish.asm" "asmFishX_$(now)_bmi2"       -i "VERSION_OS='X'" -i "VERSION_POST = 'bmi2'"
	./fasm.x64 "arm/fish.arm" "armfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'";     chmod 755 ./armfish
	./fasm.x64 "x86/fish.asm" "asmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"; chmod 755 ./asmfish
	./fasm.x64 "arm/fish.arm" "NEWarmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'"
	./fasm.x64 "x86/fish.asm" "NEWasmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"
	diff "NEWarmfish" "armfish"
	diff "NEWasmfish" "asmfish"
	./fasm.x64 "x86/fish.asm" "asmfish1" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST='popcnt'"; chmod 755 ./asmfish
	./fasm.x64 "arm/fish.arm" "armfish1" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST='v8'"; chmod 755 ./armfish
	aarch64-linux-gnu-as -o master.o -march=armv8-a+crc+crypto "arm/include/master.arm"
	aarch64-linux-gnu-ld -o master master.o
#	aarch64-linux-gnu-objcopy -O binary master.o master
	aarch64-linux-gnu-strip master
	aarch64-linux-gnu-objdump -D -maarch64 -b binary master > master.txt
	./fasm.x64 "arm/include/slave.arm" "slave" -e 1000
	aarch64-linux-gnu-objdump -D -maarch64 -b binary slave > slave.txt
	diff -U9 slave.txt master.txt | less
	./fasm.x64 "arm/include/hello/elf_obj.arm" "hello.o"
