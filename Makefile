ASM = nasm
ASM_FLAGS = -f bin

all: bios_program.bin

bios_program.bin: bios_program.asm
	$(ASM) $(ASM_FLAGS) bios_program.asm -o bios_program.bin

clean:
	rm -f bios_program.bin
