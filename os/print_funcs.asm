print_hex:
    ; TODO: Manipulate HEX_OUT to reflect dx
    mov bx, HEX_OUT
    call print_function
    ret

print_function:
    pusha
    
    mov ah, 0x0e
   
     .loop:
        cmp byte [bx], 0 
        je .done
        
        mov al, [bx]
        int 0x10
        inc bx

        cmp byte [bx], 0x0a
        je .carriage
        jne .loop

    .carriage:
        mov al, 0x0d
        int 0x10

        jmp .loop

    .done:
        popa
        ret

HEX_OUT: db '0x0000', 0
