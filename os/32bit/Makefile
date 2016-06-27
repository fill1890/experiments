.PHONY: all run clean

all: os-image

run: all
	qemu

os-image: boot_sect.bin kernel.bin
	@echo "Building os-image..."
	@cat $^ > os-image
	@echo "Tidying build..."
	@rm kernel.o kernel.bin boot_sect.bin kernel_entry.o

kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -melf_i386 -Ttext 0x1000 -o kernel.bin --oformat binary $^

%.o: %.c
	i386-elf-gcc -m32 -ffreestanding -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

clean:
	@rm *.bin || true
	@rm *.o || true
	@rm os-image || true
