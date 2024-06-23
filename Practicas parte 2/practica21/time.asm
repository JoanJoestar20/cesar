;Time
; Compilar con : nasm -f elf time.asm
; Enlace con : ld -m elf_i386 time.o -o time
; Ejecuta con : ./ time

%include 'functions.asm'

SECTION .data
msg db 'Segundos desde Ene 01 1970: ', 0h ; una cadena de mensaje
msg_length equ $ - msg                   ; longitud del mensaje

SECTION .text
global _start

_start:
    mov eax, msg          ; mueve nuestra cadena de mensaje a EAX para imprimir
    mov edx, msg_length   ; mueve la longitud del mensaje a EDX
    call sprint           ; llama a nuestra función de impresión de cadenas

    mov eax, 13           ; invocar SYS_TIME (código de operación del kernel 13)
    int 0x80              ; llamar al kernel

    call iprintLF         ; llama a nuestra función de impresión de números enteros con salto de línea

    call quit             ; llama a nuestra función de salida