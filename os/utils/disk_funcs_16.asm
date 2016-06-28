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

    jnc .no_errors  ; Carry flag

    pop dx
    cmp dh, al
    je disk_error

    .no_errors:

    popa
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print_function
    jmp $

DISK_ERROR_MSG db "Disk read error!", 0
