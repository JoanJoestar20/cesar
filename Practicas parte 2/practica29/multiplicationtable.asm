; Tablas de multiplicar
; Compilar con : nasm -f elf multiplicationtable.asm
; Enlazar con : ld -m elf_i386 multiplicationtable.o -o multiplicationtable
; Ejecuta con : ./ multiplicationtable

section .data
    multiplier   db  5           ; El número por el cual multiplicar (5 en este caso)
    limit        equ 10          ; Límite de la tabla de multiplicar (del 1 al 10)

section .text
    global _start

_start:
    mov     ecx, 1              ; Inicializamos el contador en 1

loop_start:
    mov     eax, ecx            ; Movemos el contador a eax para multiplicarlo
    movzx   ebx, byte [multiplier] ; Extendemos el byte a ebx
    mul     ebx                 ; Multiplicamos eax por el multiplicador (5)
    
    ; Mostramos el resultado por consola
    mov     eax, 4              ; Código de la syscall para sys_write
    mov     ebx, 1              ; File descriptor (stdout)
    mov     ecx, result_buffer  ; Dirección del resultado
    mov     edx, result_length  ; Longitud del resultado
    int     0x80                ; Llamada al sistema

    ; Imprimimos un salto de línea
    mov     eax, 4              ; Código de la syscall para sys_write
    mov     ebx, 1              ; File descriptor (stdout)
    mov     ecx, newline        ; Dirección del salto de línea
    mov     edx, 1              ; Longitud del salto de línea
    int     0x80                ; Llamada al sistema

    inc     ecx                 ; Incrementamos el contador
    cmp     ecx, limit          ; Comparamos con el límite
    jle     loop_start          ; Si es menor o igual, repetimos el bucle

    ; Salimos del programa
    mov     eax, 1              ; Código de la syscall para sys_exit
    xor     ebx, ebx            ; Código de salida 0
    int     0x80                ; Llamada al sistema

section .data
    result_buffer db 20 dup(0)   ; Buffer para almacenar el resultado de la multiplicación
    result_length equ $ - result_buffer  ; Longitud del resultado almacenado
    newline     db  0x0A         ; Carácter de nueva línea ('\n')