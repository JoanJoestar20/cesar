SECTION .data
    nl db 10  ; Definición del carácter de nueva línea (\n)

SECTION .text
global iprintLF
global quit

; Función para imprimir un salto de línea
iprintLF:
    mov eax, 4        ; SYS_WRITE (código 4)
    mov ebx, 1        ; Descriptor de archivo estándar de salida (stdout)
    mov ecx, nl       ; Dirección del carácter de nueva línea
    mov edx, 1        ; Longitud de la cadena (1 byte)
    int 80h           ; Llamada al sistema
    ret

; Función para salir del programa
quit:
    mov eax, 1        ; SYS_EXIT (código 1)
    xor ebx, ebx      ; Código de retorno 0
    int 80h           ; Llamada al sistema