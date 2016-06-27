os-image: boot_sect.bin kernel.bin
	@echo "Building os-image..."
	@cat boot_sect.bin kernel.bin > os-image
	@echo "Tidying build..."
	@rm kernel.o kernel.bin boot_sect.bin
	@echo "Done, no errors"

kernel.bin: kernel.o
	ld -Ttext 0x1000 -o kernel.bin --oformat binary kernel.o

kernel.o: kernel.c
	gcc -ffreestanding -c kernel.c -o kernel.o

%.bin: %.asm
	nasm $< -f bin -o $@

.PHONY: clean

clean:
	rm *.bin
