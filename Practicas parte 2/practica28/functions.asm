SECTION .text

global quit

quit:
    ; código para terminar el programa
    mov eax, 1       ; código de salida del programa
    xor ebx, ebx     ; código de error (0 = sin errores)
    int 80h          ; llamar al kernel para salir del programa