section .data
newline db 0x0A, 0x00  ; Newline character for printing

section .text
global sprintLF, quit

; Función para imprimir una cadena seguida de un salto de línea
sprintLF:
    push eax
    push edx
    mov edx, eax  ; edx apunta a la cadena (en eax)
    mov ecx, eax  ; ecx contiene la cadena a ser impresa
    mov eax, 4  ; invocar SYS_WRITE (código de operación del kernel 4)
    mov ebx, 1  ; descriptor de archivo de salida estándar (stdout)
    int 80h  ; llamar al kernel

    mov eax, newline  ; imprimir una nueva línea
    mov edx, 1  ; longitud de la nueva línea
    mov ebx, 1  ; descriptor de archivo de salida estándar (stdout)
    mov eax, 4  ; invocar SYS_WRITE
    int 80h  ; llamar al kernel

    pop edx
    pop eax
    ret

; Función para salir del programa
quit:
    mov eax, 1  ; invocar SYS_EXIT (código de operación del kernel 1)
    xor ebx, ebx  ; código de salida 0 (éxito)
    int 80h  ; llamar al kernel