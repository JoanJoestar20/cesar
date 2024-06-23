; Programa Hola Mundo ( Pasar argumentos desde la l n e a de comando )
 ; Compilar con : nasm -f elf helloworld - args.asm
 ; Enlazar con : ld -m elf_i386 helloworld - args.o -o helloworld - args
 ; Ejecutar con : ./ helloworld - args

%include 'functions.asm'

 SECTION .text
 global _start

_start:

 pop ecx ; El primer valor en la pila ( stack ) es el n m e r o de argumentos.

nextArg:
 cmp ecx , 0h ; comprobar si nos queda a l g n argumento
 jz noMoreArgs ; si se establece el indicador cero , salte a la etiqueta noMoreArgs ( saltando sobre el final del bucle )
 pop eax ; sacar el siguiente argumento de la pila (stack )
 call sprintLF ; llama a nuestra f u n c i n de i m p r e s i n consalto de l n e a
 dec ecx ; disminuir ecx ( n m e r o de argumentosrestantes ) en 1
 jmp nextArg ; saltar a la etiqueta nextArg noMoreArgs :
noMoreArgs:
 call quit
