[org 0x7c00]
KERNEL_OFFSET equ 0x1000

mov [BOOT_DRIVE], dl

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print_function

call load_kernel

call switch_to_pm

jmp $

%include "../16bit/print_funcs.asm"
%include "../16bit/disk_funcs.asm"
%include "gdt_setup.asm"
%include "print_funcs.asm"
%include "switch_to_32.asm"

[bits 16]

load_kernel:
    mov bx, KERNEL_OFFSET
    mov dh, 15
    mov dl, [BOOT_DRIVE]
    call disk_load

    mov bx, MSG_LOAD_KERNEL
    call print_function

    ret

[bits 32]

BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_32
    
    call KERNEL_OFFSET

    jmp $

BOOT_DRIVE      db 0
MSG_REAL_MODE   db "Started in 16-bit Real Mode", 0x0a, 0
MSG_PROT_MODE   db "Successfully switched to 32-bit Mode", 0x0a, 0
MSG_LOAD_KERNEL db "Successfully loaded kernel into memory", 0x0a, 0

times 510-($-$$) db 0
dw 0xaa55
