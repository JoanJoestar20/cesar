; Seek
; Compilar con : nasm -f elf seek.asm
; Enlazar con : ld -m elf_i386 seek.o -o seek
; ejecutar con : ./ seek


%include 'functions.asm'

SECTION .data
filename db 'readme.txt', 0 h ; el nombre del archivo a crear
contents db '-updated -', 0 h ; el contenido a escribir al inicio del archivo

SECTION .text
global _start

_start :

mov ecx , 1 ; indicador para el modo de acceso de sólo escritura ( O_WRONLY )
mov ebx , filename ; nombre del archivo a abrir
mov eax , 5 ; invocar SYS_OPEN (có digo de operaci ón del kernel 5)
int 80h ; llamar al kernel

mov edx , 2 ; de donde argumento ( SEEK_END )
mov ecx , 0 ; mover el cursor 0 bytes
mov ebx , eax ; mover el descriptor del archivo abierto a EBX
mov eax , 19 ; invocar SYS_LSEEK (có digo de operaci ón del kernel 19)
int 80h ; llamar al kernel

mov edx , 9 ; Nú mero de bytes para escribir : uno para cada letra de nuestra cadena de contenido.
mov ecx , contents ; mover la direcci ón de memoria de nuestra cadena de contenido a ecx
mov ebx , ebx ; mmueva el descriptor del archivo abierto a EBX (no es necesario ya que EBX ya tiene el FD)
mov eax , 4 ; invocar SYS_WRITE (có digo de operaci ón del kernel 4)
int 80h ; llamar al kernel

call quit ; llama a nuestra funci ón de salida
