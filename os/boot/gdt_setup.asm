; GDT

gdt_start:

gdt_null:           ; Mandatory null descriptor
    dd 0x0
    dd 0x0

gdt_code:           ; Code segment descriptor
    dw 0xffff       ; Limit (bits 0-16)
    dw 0x0          ; Base (bits 0-15)
    db 0x0          ; Base (bits 16-23)
    db 10011010b    ; Flags, Type flags
    db 11001111b    ; More flags, Limit (bits 16-19)
    db 0x0          ; Base (bits 24-31)

gdt_data:           ; Data segment descriptor, same as code except flags
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1  ; Size of gdt less 1
    dd gdt_start                ; Start address of gdt

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
