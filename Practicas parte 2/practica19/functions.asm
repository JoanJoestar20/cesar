SECTION .text

quit:
    mov eax, 1               ; código de salida del sistema (sys_exit)
    xor ebx, ebx             ; código de salida (0)
    int 80h