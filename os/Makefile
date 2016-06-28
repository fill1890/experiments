.PHONY: all run clean

C_OBJ_SOURCES = $(addsuffix .o,$(basename $(wildcard kernel/*.c drivers/*.c)))
HEADERS = $(wildcard kernel/*.h drivers/*.h)

all: os-image

run: all
	qemu ./os-image

os-image: boot/boot_sect.bin kernel.bin
	@echo "Building os-image..."
	@cat $^ > os-image

kernel.bin: kernel/kernel_entry.o ${C_OBJ_SOURCES}
	i386-elf-ld -melf_i386 -Ttext 0x1000 -o kernel.bin --oformat binary $^

%.o: %.c ${HEADERS}
	i386-elf-gcc -m32 -ffreestanding -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

tidy:
	@rm -rf *.bin *.o
	@rm -rf kernel/*.o boot/*.o drivers/*.o

clean:
	@rm -rf *.bin *.o os-image
	@rm -rf kernel/*.o boot/*.bin drivers/*.o
	@rm os-image || true
