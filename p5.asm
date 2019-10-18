;sub 319
;sub 321
;add 319
;add 321

include macro.asm
.model small
.stack
.data
include data.asm
.code
main proc

	MenuPrincipal:
		print enc0
		print enc1
		print salt
		getChar
		cmp al,'1'; COMPARO CON EL ASCII DEL NUMERO 1 QUE ES 49 Y EN HEXA 31H
		je Video1
		cmp al,'3'
		je Salir
		jmp MenuPrincipal

	Video1:
		ModoVideo
		PintarMargen 5

		mov dx ,35360

		NorteEste:
			pintarPelota dx, 0 ;(i,j) = (110,160) = 110*320 + 160
			sub dx,319
			pintarPelota dx, 2
			getCoordenada dx

			cmp ax,21
			je SurEste
			cmp cx,310
			je NorteOeste

			Delay 200
			jmp NorteEste

		SurEste:
			pintarPelota dx, 0 
			add dx,321
			pintarPelota dx, 2

			getCoordenada dx
			cmp cx,310
			je SurOeste
			cmp ax,187
			je NorteEste


			Delay 200
			jmp SurEste

		NorteOeste:
			pintarPelota dx, 0 
			sub dx,321
			pintarPelota dx, 2

			getCoordenada dx
			cmp cx,6
			je NorteEste
			cmp ax,21
			je SurOeste


			Delay 200
			jmp NorteOeste
		SurOeste:
			pintarPelota dx, 0 
			add dx,319
			pintarPelota dx, 2

			getCoordenada dx
			cmp cx,6
			je SurEste
			cmp ax,187
			je NorteOeste


			Delay 200
			jmp SurOeste

		

		getChar
		ModoTexto
		jmp MenuPrincipal
;---------------------METODO PARA FINALIZAR EL PROGRAMA-----------------------------
	Salir:
		mov ah, 4ch
		mov al, 00h
		int 21h
main endp ;Termina proceso
end main