; Programa Hola Mundo ( Cuenta hasta 10)
 ; Compilar con : nasm -f elf helloworld -10 .asm
 ; Enlazar con : ld -m elf_i386 helloworld -10 .o -o helloworld -10
 ; Ejecuta con : ./ helloworld -10

 %include 'functions.asm'

 SECTION .text
 global _start

_start:

 mov ecx , 0 ; ecx se inicializa a cero.

nextNumber:
 inc ecx ; incrementar ecx

 mov eax , ecx ; mover la d i r e c c i n de nuestro n m e r o entero a eax
 add eax , 48 ; agregue 48 a nuestro n m e r o para convertirde entero a ascii para imprimir
 push eax ; empujar eax a la pila
 mov eax , esp ; obtener la d i r e c c i n del personaje en lapila
 call sprintLF ; llama a nuestra f u n c i n de i m p r e s i n

 pop eax ; Limpiar la pila para que no tengamos bytes innecesarios que ocupen espacio.
 cmp ecx , 10 ; Ya llegamos a 10? compara nuestro contadorcon el decimal 10
 jne nextNumber ; salta si no es igual y sigue contando

 call quit
