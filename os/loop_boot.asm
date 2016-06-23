; Simple boot sector program, loops forever

start:
    jmp start

times 510-($-$$) db 0 ; Pad sector
dw 0xaa55 ; magic bytes
