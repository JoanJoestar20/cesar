section .text
global atoi
global iprintLF
global quit

; int atoi ( char *str )
; Convierte una cadena ASCII en un entero

atoi:
    push ebx        ; conservar ebx en la pila para restaurarlo después de la función
    push ecx        ; conservar ecx en la pila para restaurarlo después de la función
    push edx        ; conservar edx en la pila para restaurarlo después de la función
    push esi        ; conservar esi en la pila para restaurarlo después de la función

    mov esi, eax    ; mover el puntero en eax a esi (nuestra cadena para convertir)
    mov eax, 0      ; inicializar eax con valor decimal 0
    xor ecx, ecx    ; inicializar ecx con valor decimal 0 (contador)

.multiplyLoop:
    xor ebx, ebx    ; restablecer ebx a 0
    mov bl, byte [esi + ecx]  ; mover un byte de la cadena a bl
    cmp bl, 48      ; comparar con '0'
    jl .finished    ; si es menor que '0', terminar
    cmp bl, 57      ; comparar con '9'
    jg .finished    ; si es mayor que '9', terminar

    sub bl, 48      ; convertir de carácter a valor numérico
    add eax, ebx    ; sumar al valor acumulado en eax
    mov ebx, 10     ; poner 10 en ebx
    mul ebx         ; multiplicar eax por 10 para el siguiente dígito
    inc ecx         ; incrementar contador
    jmp .multiplyLoop ; continuar multiplicando

.finished:
    cmp ecx, 0      ; verificar si se procesó algún dígito
    je .restore     ; si no, saltar a restaurar

    mov ebx, 10     ; dividir por 10 para corregir multiplicación adicional
    div ebx

.restore:
    pop esi         ; restaurar registros desde la pila
    pop edx
    pop ecx
    pop ebx
    ret             ; devolver resultado en eax

iprintLF:
    ; implementación de la función iprintLF
    ; por ejemplo:
    ; mov eax, 4   ; syscall para imprimir
    ; mov ebx, 1   ; descriptor de archivo (stdout)
    ; mov ecx, mensaje  ; dirección del mensaje a imprimir
    ; mov edx, longitud_mensaje  ; longitud del mensaje
    ; int 0x80     ; hacer la llamada al sistema para imprimir

    ret

quit:
    ; implementación de la función quit
    ; por ejemplo:
    ; mov eax, 1   ; syscall para salir del programa
    ; xor ebx, ebx ; código de salida 0
    ; int 0x80     ; hacer la llamada al sistema para salir

    ret