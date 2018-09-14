now := $(shell /bin/date "+%Y-%m-%d")
all:
	# LinuxOS and ARM
	./fasmg "x86/fish.asm" "asmFishL_$(now)_popcnt" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'"
	./fasmg "x86/fish.asm" "asmFishL_$(now)_bmi1" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'"
	./fasmg "x86/fish.asm" "asmFishL_$(now)_bmi2" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'"
	./fasmg "arm/fish.arm" "armFishL_$(now)_v8" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'v8'"
	./fasmg "x86/fish.asm" "asmFishL_$(now)_base" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_base" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_popcnt" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_bmi1" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_bmi2" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_base" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'" -i "USE_MATEFINDER = 1"
	./fasmg "arm/fish.arm" "mateFishL_$(now)_v8" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'" -i "USE_MATEFINDER = 1"

	# MacOS
	./fasmg "x86/fish.asm" "asmFishX_$(now)_popcnt" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'"
	./fasmg "x86/fish.asm" "asmFishX_$(now)_bmi1" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'"
	./fasmg "x86/fish.asm" "asmFishX_$(now)_bmi2" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'"
	./fasmg "x86/fish.asm" "asmFishX_$(now)_base" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'"
	./fasmg "x86/fish.asm" "mateFishX_$(now)_base" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishX_$(now)_popcnt" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishX_$(now)_bmi1" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishX_$(now)_bmi2" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishX_$(now)_base" -e 1000 -i "VERSION_OS='X'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'" -i "USE_MATEFINDER = 1"

	# WindowsOS
	./fasmg "x86/fish.asm" "asmFishW_$(now)_popcnt.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'"
	./fasmg "x86/fish.asm" "asmFishW_$(now)_bmi1.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'"
	./fasmg "x86/fish.asm" "asmFishW_$(now)_bmi2.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'"
	./fasmg "x86/fish.asm" "asmFishW_$(now)_base.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'"
	./fasmg "x86/fish.asm" "mateFishW_$(now)_base.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishW_$(now)_popcnt.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishW_$(now)_bmi1.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishW_$(now)_bmi2.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishW_$(now)_base.exe" -e 1000 -i "VERSION_OS='W'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'" -i "USE_MATEFINDER = 1"
	chmod 755 *Fish*

quick:
	./fasmg "arm/fish.arm" "armfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'";     chmod 755 ./armfish
	./fasmg "x86/fish.asm" "asmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"; chmod 755 ./asmfish

bincheck:
	./fasmg "arm/fish.arm" "NEWarmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'"
	./fasmg "x86/fish.asm" "NEWasmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"
	diff "NEWarmfish" "armfish"
	diff "NEWasmfish" "asmfish"

asmquick:
	./fasmg "x86/fish.asm" "asmfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST='popcnt'"; chmod 755 ./asmfish

armquick:
	./fasmg "arm/fish.arm" "armfish" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST='v8'"; chmod 755 ./armfish

test:
	aarch64-linux-gnu-as -o master.o -march=armv8-a+crc+crypto "arm/include/master.arm"
	aarch64-linux-gnu-ld -o master master.o
#	aarch64-linux-gnu-objcopy -O binary master.o master
	aarch64-linux-gnu-strip master
	aarch64-linux-gnu-objdump -D -maarch64 -b binary master > master.txt
	./fasmg "arm/include/slave.arm" "slave" -e 1000
	aarch64-linux-gnu-objdump -D -maarch64 -b binary slave > slave.txt
	diff -U9 slave.txt master.txt | less

hellome:
	./fasmg "arm/include/hello/elf_obj.arm" "hello.o"


linux:
	./fasmg "x86/fish.asm" "asmFishL_$(now)_popcnt" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'"
	./fasmg "x86/fish.asm" "asmFishL_$(now)_bmi1" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'"
	./fasmg "x86/fish.asm" "asmFishL_$(now)_bmi2" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'"
	./fasmg "arm/fish.arm" "armFishL_$(now)_v8" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'v8'"
	./fasmg "x86/fish.asm" "asmFishL_$(now)_base" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_base" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_popcnt" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'popcnt'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_bmi1" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi1'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_bmi2" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'bmi2'" -i "USE_MATEFINDER = 1"
	./fasmg "x86/fish.asm" "mateFishL_$(now)_base" -e 1000 -i "VERSION_OS='L'" -i "PEDANTIC = 1" -i "VERSION_POST = 'base'" -i "USE_MATEFINDER = 1"
	./fasmg "arm/fish.arm" "mateFishL_$(now)_v8" -e 1000 -i "VERSION_OS='L'" -i "VERSION_POST = 'v8'" -i "USE_MATEFINDER = 1"
