; Load dh sectors to ES:BX from dl
; Requires print_string for error reporting
disk_load:
    pusha
    push dx         ; Store no. of sectors

    mov ah, 0x02    ; BIOS read sector function
    mov al, dh      ; Read dh sectors
    mov ch, 0x00    ; Cylinder 0
    mov dh, 0x00    ; Head 0
    mov cl, 0x02    ; Second sector - after boot sector

    int 0x13        ; BIOS interrupt

    jc disk_error_carry   ; Carry flag

    pop dx
    cmp dh, al
    jne disk_error_count

    popa
    ret

disk_error_carry:
    mov bx, DISK_ERROR_MSG_CARRY
    call print_function
    mov ax, 0xbcde
    jmp $

disk_error_count:
    mov bx, DISK_ERROR_MSG_COUNT
    call print_function
    mov ax, 0xcdef
    jmp $

DISK_ERROR_MSG_CARRY db "Disk read error (Carry flag set)", 0
DISK_ERROR_MSG_COUNT db "Disk read error (Count incorrect)", 0
