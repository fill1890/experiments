[bits 16]
; Switch to protected mode

switch_to_pm:

    cli                     ; Disable interrupts
    lgdt [gdt_descriptor]   ; Load GDT from file
    
    mov eax, cr0            ; Set up control to 32-bit mode
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:init_pm    ; Make far jump to flush cache

[bits 32]

init_pm:
    mov ax, DATA_SEG        ; Redefine data segment registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000        ; Update stack position
    mov esp, ebp

    call BEGIN_PM           ; Required label
