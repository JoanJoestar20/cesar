
 ; Programa Hola Mundo ( Cuenta hasta 10 itoa )
 ; Compilar con : nasm -f elf helloworld - itoa.asm 36
 ; Enlace con : ld -m elf_i386 helloworld - itoa.o -o helloworld - itoa
 ; Ejecuta con : ./ helloworld - itoa

%include 'functions.asm'

 SECTION .text
 global _start

_start:

 mov ecx , 0

nextNumber:
 inc ecx
 mov eax , ecx
 call iprintLF ; NOTA : Llama a nuestra nueva f u n c i n de i m p r e s i n de n m e r o s enteros ( itoa )
 cmp ecx , 10
 jne nextNumber

 call quit

