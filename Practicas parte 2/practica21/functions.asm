section .text

; Sprint - Imprime una cadena de caracteres
; Entrada: EAX - dirección de la cadena a imprimir
;          EDX - longitud de la cadena
sprint:
    pusha                  ; guarda todos los registros
    mov ecx, edx           ; mueve la longitud de la cadena a ECX
    mov edx, eax           ; mueve la dirección de la cadena a EDX
    mov ebx, 1             ; archivo descriptor (1 = stdout)
    mov eax, 4             ; número de syscall (sys_write)
    int 0x80               ; llamada al kernel
    popa                   ; restaura todos los registros
    ret

; iprintLF - Imprime un número entero (tiempo en segundos desde el 01 Ene 1970) seguido de un salto de línea
iprintLF:
    pusha                  ; guarda todos los registros
    mov ecx, 0             ; limpiar ECX para contar los dígitos

print_digit:
    inc ecx                ; incrementa el contador de dígitos
    xor edx, edx           ; limpia EDX
    mov ebx, 10            ; divisor
    div ebx                ; divide EAX por EBX
    add dl, '0'            ; convierte el residuo a carácter
    push edx               ; guarda el carácter en la pila
    test eax, eax          ; prueba si EAX es 0
    jnz print_digit        ; si no es 0, repite

print_digits:
    pop edx                ; saca el carácter de la pila
    mov eax, 4             ; número de syscall (sys_write)
    mov ebx, 1             ; archivo descriptor (1 = stdout)
    mov ecx, edx           ; carga el carácter a imprimir
    mov edx, 1             ; longitud del mensaje
    int 0x80               ; llamada al kernel
    loop print_digits      ; repite hasta que ECX sea 0

print_newline:
    mov eax, 4             ; número de syscall (sys_write)
    mov ebx, 1             ; archivo descriptor (1 = stdout)
    mov ecx, newline       ; dirección de la nueva línea
    mov edx, 1             ; longitud de la nueva línea
    int 0x80               ; llamada al kernel

    popa                   ; restaura todos los registros
    ret

; Quit - Sale del programa
quit:
    mov eax, 1             ; número de syscall (sys_exit)
    xor ebx, ebx           ; código de salida 0
    int 0x80               ; llamada al kernel
    ret

section .data
newline db 10             ; nueva línea