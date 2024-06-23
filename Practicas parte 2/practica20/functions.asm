SECTION .text

; sprintLF - Imprime una cadena terminada en 0h seguida de una nueva línea
sprintLF:
    push rbx                       ; guarda rbx
    mov rbx, rdi                   ; rbx = puntero a la cadena
.print_next_char:
    lodsb                          ; carga el siguiente byte en AL desde [DS:RSI] y aumenta RSI
    or al, al                      ; verifica si el byte es 0h (fin de cadena)
    jz .print_newline              ; si es 0h, salta para imprimir nueva línea
    mov rdi, rax                   ; mueve el carácter a RDI
    call print_char                ; llama a la rutina para imprimir un carácter
    jmp .print_next_char           ; repite para el siguiente carácter

.print_newline:
    mov eax, 0xA                   ; código ASCII para nueva línea
    mov rdi, rax
    call print_char                ; imprime el carácter de nueva línea

    pop rbx                        ; restaura rbx
    ret                            ; retorna

; print_char - Imprime un carácter en RDI
print_char:
    mov rax, 1                     ; código de sistema para sys_write
    mov rdi, 1                     ; file descriptor 1 (stdout)
    mov rsi, rsp                   ; usa la pila para el puntero al carácter
    mov [rsi], dil                 ; guarda el carácter en la pila
    mov rdx, 1                     ; longitud de 1 byte
    syscall                        ; llamada al sistema
    ret                            ; retorna

; quit - Termina el programa
quit:
    mov rax, 60                    ; código de sistema para sys_exit
    xor rdi, rdi                   ; código de salida 0
    syscall                        ; llamada al sistema