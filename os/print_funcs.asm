; Prints 4-digit hex code from dx
print_hex:
    pusha           ; Save registers

    ; dx: 0xd5f1
    mov cx, 0       ; Counter
    .loop:
    mov al, dl      ; Take lowest two digits of number
    
    and al, 0x0F    ; Ignore upper digit
    cmp al, 10      ; Test if letter or number
    jge .high       

    add al, 48
    jmp .next

    .high:
    add al, 87
    
    .next:
    
    mov bx, HEX_OUT ; Initial position
    add bx, 5       ; Trailing digit
    sub bx, cx      ; Choose correct digit
    mov [bx], al    ; Modify HEX_OUT

    shr dx, 4       ; Select next digit
    inc cx          ; Increment counter
    cmp cx, 3       ; Terminate loop if complete
    jle .loop

    mov bx, HEX_OUT
    call print_function

    popa
    ret

; Prints null-terminated string from bx
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
