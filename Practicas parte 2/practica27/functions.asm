SECTION .data
filename db 'readme.txt', 0    ; el nombre del archivo a crear
contents db '-updated-', 0      ; el contenido a escribir al inicio del archivo

SECTION .text
global _start

_start:
    ; Llama a la función seek_and_write
    call seek_and_write

    ; Llama a nuestra función de salida
    call quit

; Función para realizar el seek y escribir en el archivo
seek_and_write:
    ; Abrir archivo para escritura
    mov ecx, 1       ; modo de acceso de sólo escritura (O_WRONLY)
    mov ebx, filename ; nombre del archivo a abrir
    mov eax, 5       ; invocar SYS_OPEN (código de operación del kernel 5)
    int 80h           ; llamar al kernel

    ; Mover el cursor al final del archivo (SEEK_END)
    mov edx, 2       ; de donde argumento (SEEK_END)
    mov ecx, 0       ; mover el cursor 0 bytes
    mov ebx, eax     ; mover el descriptor del archivo abierto a EBX
    mov eax, 19      ; invocar SYS_LSEEK (código de operación del kernel 19)
    int 80h           ; llamar al kernel

    ; Escribir contenido al archivo
    mov edx, 9       ; número de bytes para escribir: longitud de nuestra cadena de contenido
    mov ecx, contents ; mover la dirección de memoria de nuestra cadena de contenido a ECX
    mov ebx, eax     ; mover el descriptor del archivo abierto a EBX (no es necesario, pero se mantiene por claridad)
    mov eax, 4       ; invocar SYS_WRITE (código de operación del kernel 4)
    int 80h           ; llamar al kernel

    ret              ; retorno de la función seek_and_write