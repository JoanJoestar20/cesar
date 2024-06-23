; functions.asm

SECTION .function

quit:
    ; código para la función quit
    mov eax, 1          ; código de salida
    xor ebx, ebx        ; estado de salida (éxito)
    int 80h             ; llamar al kernel para salir del programa