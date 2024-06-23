; Fork
; Compilar con : nasm -f elf fork.asm
; Enlazar con : ld -m elf_i386 fork.o -o fork
; Ejecuta con : ./ fork

%include 'functions.asm'

SECTION .data
childMsg db 'Este es el proceso hijo', 0   ; una cadena de mensaje
parentMsg db 'Este es el proceso principal', 0 ; una cadena de mensaje

SECTION .text
global _start

_start:

    mov rax, 57         ; invocar SYS_FORK (código de operación del kernel 57 en x86_64)
    syscall

    cmp rax, 0          ; si rax es cero estamos en el proceso hijo
    je child            ; saltar si rax es cero a la etiqueta child

parent:
    mov rdi, parentMsg  ; dentro de nuestro proceso principal, mueve parentMsg a rdi
    call sprintLF       ; llama a nuestra impresión de cadenas con función de avance de línea

    call quit           ; salir del proceso padre

child:
    mov rdi, childMsg   ; dentro de nuestro proceso hijo, mueve childMsg a rdi
    call sprintLF       ; llama a nuestra impresión de cadenas con función de avance de línea

    call quit           ; salir del proceso hijo