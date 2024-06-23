; ------------------------------------------
 ; int slen ( String message )
 ; F u n c i n de c l c u l o de longitud de cadena
slen:
 push ebx
 mov ebx , eax

nextchar:
 cmp byte [eax ] , 0
 jz finished
 inc eax
 jmp nextchar

finished:
    sub eax , ebx
    pop ebx
    ret


 ; ------------------------------------------
 ; void sprint ( String message )
 ; F u n c i n de i m p r e s i n de cadenas
sprint:
    push edx
    push ecx
    push ebx
    push eax
    call slen

    mov edx , eax
    pop eax

    mov ecx , eax
    mov ebx , 1
    mov eax , 4
    int 80h

    pop ebx
    pop ecx
    pop edx
    ret

sprintLF:
    call sprint

    push eax ; Enviamos eax a la pila para conservarlo mientras usamos el registro eax en esta f u n c i n
    mov eax , 0Ah ; mueve 0Ah a eax : 0Ah es el c a r c t e r ascii para un salto de l n e a
    ; como eax tiene 4 bytes de ancho , ahora contiene 0000000 Ah
    push eax ; Enviamos el salto de l n e a a la pila para que podamos obtener la d i r e c c i n .
    ; dado que tenemos una arquitectura little -endian , los bytes del registro eax se almacenan en orden inverso ,
    ; esto corresponde al contenido de la memoria de pila de 0Ah , 0h, 0h, 0h,
    ; d n d o n o s un salto de l n e a seguido de un byte de t e r m i n a c i n NULL
    mov eax , esp ; mueve la d i r e c c i n del puntero de la pilaactual a eax para sprint
    call sprint ; llama a nuestra f u n c i n sprint
    pop eax ; eliminar nuestro c a r c t e r de salto de l n e a de la pila
    pop eax ; restaurar el valor original de eax antes de que se llamara nuestra f u n c i n
   ret ; volver a nuestro programa


 ; ------------------------------------------
 ; void exit ()
 ; Salir del programa y restaurar recursos.
quit:
    mov ebx , 0
    mov eax , 1
    int 80h
    ret