; Execute
; Compilar con : nasm -f elf execute.asm
; Enlazar con : ld -m elf_i386 execute.o -o execute
; Ejecutar con : ./ execute


SECTION .data
command db '/bin/echo', 0        ; comando para ejecutar
arg1 db 'Hola Mundo!', 0         ; argumento para el comando
arguments dd command             ; apuntador al comando
dd arg1                          ; apuntador al primer argumento
dd 0                             ; terminador de la lista de argumentos
environment dd 0                 ; terminador de la lista de variables de entorno

SECTION .text
global _start

_start:
    mov edx, environment         ; dirección de variables de entorno
    mov ecx, arguments           ; dirección de los argumentos para pasar a la línea de comando
    mov ebx, command             ; dirección del archivo a ejecutar
    mov eax, 11                  ; invocar SYS_EXECVE (código de operación del kernel 11)
    int 0x80                     ; llamada al sistema

    ; Si execve falla, ejecuta la siguiente parte
    call quit                    ; llama a nuestra función de salida

quit:
    mov eax, 1                   ; código de salida del sistema
    xor ebx, ebx                 ; código de retorno 0
    int 0x80                     ; llamada al sistema