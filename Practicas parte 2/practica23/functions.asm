SECTION .text
global quit

quit:
    mov eax, 1        ; Cargar el código de salida 1 (éxito)
    xor ebx, ebx      ; Limpiar ebx (no hay errores)
    int 80h           ; Llamar al kernel para salir del programa