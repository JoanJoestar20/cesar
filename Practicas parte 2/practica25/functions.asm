section .text
global sprintLF
global quit

sprintLF:
    ; Esta función imprimirá una cadena terminada en null ('\0') seguida de un salto de línea
    push eax ; guardamos el registro eax (que contiene la dirección del string) en la pila
    push ecx ; guardamos el registro ecx (que contiene la longitud del string) en la pila

    mov edx, ecx ; longitud de la cadena
    mov ecx, eax ; dirección de memoria de la cadena
    mov eax, 4  ; sys_write
    mov ebx, 1  ; file descriptor stdout
    int 0x80    ; syscall

    pop ecx  ; restauramos ecx desde la pila
    pop eax  ; restauramos eax desde la pila
    ret      ; retornamos

quit:
    ; Esta función termina el programa
    mov eax, 1    ; sys_exit
    xor ebx, ebx  ; exit status
    int 0x80      ; syscall