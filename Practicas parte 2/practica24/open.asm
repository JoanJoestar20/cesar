; Open
; Compilar con : nasm -f elf open.asm
; Enlaza con : ld -m elf_i386 open.o -o open
; Ejecuta con : ./ open

%include 'functions.asm'

SECTION .data
filename db 'readme.txt ', 0 h ; el nombre del archivo a crear

contents db 'Hola Mundo !', 0 h ; los contenidos a escribir

SECTION .text
global _start

_start :

mov ecx , 0777  ; Crear archivo de la prá ctica 22
mov ebx , filename
mov eax , 8
int 80h

mov edx , 12 ; Escribir contenidos al archivo de la práctica 23
mov ecx , contents
mov ebx , eax
mov eax , 4
int 80h

mov ecx , 0 ; indicador para el modo de acceso de sólo lectura ( O_RDONLY )
mov ebx , filename ; nombre de archivo que creamos arriba
mov eax , 5 ; invocar SYS_OPEN (có digo de operaci ón del kernel 5)
int 80h ; llamar al kernel

call iprintLF ; llame a nuestra funci ón de impresi ón de nú meros enteros
call quit ; llame a nuestra funci ón de salida