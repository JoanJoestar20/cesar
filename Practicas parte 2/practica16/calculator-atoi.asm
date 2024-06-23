%include 'functions.asm'

section .text
global _start

_start:
    pop ecx         ; El primer valor en la pila es el número de argumentos.
    pop edx         ; El segundo valor en la pila es el nombre del programa (ignorado).
    sub ecx, 1      ; disminuir ecx en 1 (número de argumentos sin nombre de programa)
    mov edx, 0      ; Inicializar registro de datos para almacenar suma.

nextArg:
    cmp ecx, 0      ; comprobar si quedan argumentos
    jz noMoreArgs   ; si no quedan, salir del bucle
    pop eax         ; sacar el siguiente argumento de la pila
    call atoi       ; convertir cadena ASCII a entero
    add edx, eax    ; realizar suma
    dec ecx         ; decrementar contador de argumentos
    jmp nextArg     ; continuar con el siguiente argumento

noMoreArgs:
    mov eax, edx    ; mover el resultado a eax para imprimir
    call iprintLF   ; imprimir el resultado seguido de un salto de línea
    call quit       ; salir del programa