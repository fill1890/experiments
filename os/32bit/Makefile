os-image: boot_sect.bin kernel.bin
	@echo "Building os-image..."
	@cat boot_sect.bin kernel.bin > os-image
	@echo "Tidying build..."
	@rm kernel.o kernel.bin boot_sect.bin kernel_entry.o

kernel.bin: kernel.o kernel_entry.o
	ld -melf_i386 -Ttext 0x1000 -o kernel.bin --oformat binary kernel_entry.o kernel.o

%.o: %.c
	gcc -m32 -ffreestanding -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

.PHONY: clean

clean:
	@rm *.bin || true
	@rm *.o || true
	@rm os-image || true
