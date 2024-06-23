; Calculadora ( Suma )
 ; Compilar con : nasm -f elf calculator - addition.asm
 ; Enlace con : ld -m elf_i386 calculator - addition.o -o calculator - addition
 ; Ejecuta con : ./ calculator - addition

%include 'functions.asm'

 SECTION .text
 global _start

_start:

 mov eax , 90 ; mover nuestro primer n m e r o a eax
 mov ebx , 9 ; mover nuestro segundo n m e r o a ebx
 add eax , ebx ; agregar ebx a eax
 call iprintLF ; llama a nuestra i m p r e s i n de n m e r o s enteros con la f u n c i n de avance de l n e a

 call quit
