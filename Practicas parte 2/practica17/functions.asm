; functions.asm

SECTION .data
LF db 0Ah ; carácter de avance de línea (LF)

SECTION .text

; Función para imprimir una cadena seguida de un avance de línea
sprintLF:
    call sprint
    mov eax, LF
    call printChar
    ret

; Función para imprimir una cadena
sprint:
    pusha
    mov edx, 0 ; establecer el contador de longitud en 0

.next_char:
    mov cl, [eax]
    cmp cl, 0
    je .done
    inc edx
    inc eax
    jmp .next_char

.done:
    mov eax, 4       ; syscall número (sys_write)
    mov ebx, 1       ; archivo descriptor (stdout)
    sub eax, edx     ; restar la longitud para obtener el inicio de la cadena
    mov ecx, eax     ; puntero al buffer de la cadena
    mov eax, 4       ; syscall número (sys_write)
    mov ebx, 1       ; archivo descriptor (stdout)
    int 0x80         ; llamada al kernel
    popa
    ret

; Función para imprimir un número entero seguido de un avance de línea
iprintLF:
    call iprint
    mov eax, LF
    call printChar
    ret

; Función para imprimir un número entero
iprint:
    pusha
    mov ebx, 10
    xor ecx, ecx

.convert_loop:
    xor edx, edx
    div ebx
    add dl, '0'
    push dx
    inc ecx
    test eax, eax
    jnz .convert_loop

.print_loop:
    pop dx
    mov al, dl
    call printChar
    loop .print_loop

    popa
    ret

; Función para imprimir un carácter almacenado en AL
printChar:
    pusha
    mov eax, 4       ; syscall número (sys_write)
    mov ebx, 1       ; archivo descriptor (stdout)
    mov ecx, esp     ; dirección del carácter
    mov [ecx-1], al  ; almacenar el carácter en la pila
    lea ecx, [ecx-1]
    mov edx, 1       ; longitud del carácter
    int 0x80         ; llamada al kernel
    popa
    ret

; Función para salir del programa
quit:
    mov eax, 1       ; syscall número (sys_exit)
    xor ebx, ebx     ; código de salida 0
    int 0x80         ; llamada al kernel