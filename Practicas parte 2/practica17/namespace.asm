; Espacio de nombres
; Compilar con : nasm -f elf namespace.asm
; Enlazar con : ld -m elf_i386 namespace.o -o namespace
; Ejecutar con : ./namespace

;nasm -f elf32 -o namespace.o namespace.asm
;nasm -f elf32 -o functions.o functions.asm
;ld -m elf_i386 -o namespace namespace.o functions.o
;./namespace



%include 'functions.asm'

SECTION .data
msg1 db 'Saltar a la etiqueta finished. ', 0h ; una cadena de mensaje
msg2 db 'Número de subrutina interior : ', 0h ; una cadena de mensaje
msg3 db 'Dentro de la subrutina "finished".', 0h ; una cadena de mensaje

SECTION .text
global _start

_start:
    ; Llamar a la subrutina uno
    call subroutineOne

    ; Llamar a la subrutina dos
    call subroutineTwo

    ; Saltar a la etiqueta global finished
    jmp finished

subroutineOne:
    mov eax, msg1 ; mover la dirección de msg1 a eax
    call sprintLF ; llamar a nuestra impresión de cadenas con función de avance de línea
    jmp .finished ; saltar a la etiqueta local bajo el alcance de subroutineOne

.finished:
    mov eax, msg2 ; mover la dirección de msg2 a eax
    call sprint ; llamar a nuestra función de impresión de cadenas
    mov eax, 1 ; mover el valor uno a eax (para la subrutina número uno)
    call iprintLF ; llamar a nuestra función de impresión de números enteros con la función de avance de línea
    ret

subroutineTwo:
    mov eax, msg1 ; mover la dirección de msg1 a eax
    call sprintLF ; llamar a nuestra impresión de cadenas con función de avance de línea
    jmp .finished ; saltar a la etiqueta local bajo el alcance de subroutineTwo

.finished:
    mov eax, msg2 ; mover la dirección de msg2 a eax
    call sprint ; llamar a nuestra función de impresión de cadenas
    mov eax, 2 ; mover el valor dos a eax (para la subrutina número dos)
    call iprintLF ; llamar a nuestra función de impresión de números enteros con la función de avance de línea
    ret

finished:
    mov eax, msg3 ; mover la dirección de msg3 a eax
    call sprintLF ; llamar a nuestra impresión de cadenas con función de avance de línea
    call quit ; llamar a nuestra función de salida