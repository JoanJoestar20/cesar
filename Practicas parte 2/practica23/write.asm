; Write
; Compilar con : nasm -f elf write.asm
; Enlaza con : ld -m elf_i386 write.o -o write
; Ejecuta con : ./ write

%include 'functions.asm'

SECTION .data
filename db 'readme.txt ', 0 h ; el nombre del archivo a crear
contents db 'Hola mundo !', 0 h ; los contenidos a escribir

SECTION .text
global _start

_start :

mov ecx , 0777 ; El có digo contin úa desde la practica 22
mov ebx , filename
mov eax , 8
int 80h

mov edx , 12 ; Nú mero de bytes para escribir : uno para cada letra de nuestra cadena de contenido.
mov ecx , contents ; mueve la direcci ón de memoria de nuestra cadena de contenido a ecx
mov ebx , eax ; mueve el descriptor de archivo del archivo que creamos a ebx

mov eax , 4 ; invocar SYS_WRITE (có digo de operaci ón del kernel 4)
int 80h ; llamar al kernel

call quit ; llama a nuestra funci ón de salida