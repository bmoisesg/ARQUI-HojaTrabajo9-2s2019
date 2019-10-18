ModoVideo macro
    mov ah,00h
    mov al,13h
    int 10h
    mov ax, 0A000h
    mov ds, ax  ; DS = A000h (memoria de graficos).
    endm

    ModoTexto macro
    mov ah,00h
    mov al,03h
    int 10h
endm

;-------------DELAY 1 PARA QUE SEA VISIBLE
Delay macro constante
    LOCAL D1,D2,Fin
    push si
    push di

    mov si,constante
    D1:
    dec si
    jz Fin
    mov di,constante
    D2:
    dec di
    jnz D2
    jmp D1

    Fin:
    pop di
    pop si
endm

;mov [di],30h

PintarMargen macro color
    mov dl, color

    ;empieza en pixel (i,j) = (20,0) = 20*320+0 = 6400
    ;barra horizontal superior
    mov di,6405
    Primera:
    mov [di],dl
    inc di
    cmp di,6714
    jne Primera

    ;barra horizontal inferior
    ;empieza en pixel (i,j) = (190,0) = 190 * 320 + 0 = 60800
    mov di,60805
    Segunda:
    mov [di],dl
    inc di
    cmp di, 61114
    jne Segunda

    ;barra vertical izquierda
    mov di, 6405
    Tercera:
    mov [di], dl
    add di,320
    cmp di,60805
    jne Tercera

    ;barra vertical derecha
    mov di,6714
    Cuarta:
    mov [di], dl
    add di,320
    cmp di,61114
    jne Cuarta

endm

getCoordenada macro parametro
    push dx

    
    mov ax,dx       ;9610
    mov dx,0
    mov cx,320d            ;320
    div cx
    mov cx, dx
    ;ax cociente  y
    ;cx resultado x

 

    pop dx

endm

;--------------OBTENER CARACTER DE CONSOLA CON ECHO A PANTALLA----------------------
getChar macro
    mov ah,0dh
    int 21h
    mov ah,01h
    int 21h
endm

;--------------MACRO IMPRESION DE CADENA---------------------------
print macro cadena
    push ax
    push dx
    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset cadena
    int 21h
    pop dx
    pop ax
endm

pintarPelota macro pos, color
    push dx
    mov di,pos
    mov dl,color

    mov [di],dl
    mov [di+1], dl
    mov [di+2], dl

    mov [di+320], dl
    mov [di+321], dl
    mov [di+322], dl

    mov [di+640], dl
    mov [di+641], dl
    mov [di+642], dl

    pop dx
endm