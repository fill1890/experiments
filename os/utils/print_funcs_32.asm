[bits 32]

; Constants
VIDEO_MEMORY   equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; Prints null-terminated string from ebx
print_string_32:
    pusha
    mov edx, VIDEO_MEMORY

    .loop:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK
        
    cmp al, 0
    je .done
    
    mov [edx], ax           ; Move to video memory
    
    add ebx, 1              ; Next character
    add edx, 2              ; Next vidmem cell
    jmp .loop
        
    .done:

    popa
    retn
