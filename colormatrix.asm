TITLE Color Matrix           (AddSub.asm)

INCLUDE Irvine32.inc

DELAY_TIME = 1000

.data
char    BYTE 'A'

rowCol LABEL WORD
col	BYTE 0
row	BYTE 0

.code
main PROC

	call Clrscr

	mov  ecx,6	; set loop counter to 6 

L0:	push ecx	; save loop counter
	mov  rowCol,0	; initialize row and 
	mov  dx,0	; cursor 0,0
	call Gotoxy

	mov  eax,0	;  black and black
	mov  ecx,16	; 16 background colors

L1:	push ecx	; 
	mov  dx,rowCol	
	call Gotoxy
	mov  ecx,16	; 16 foreground colors

L2:	call SetTextColor
	push eax
	mov  al,char	; character to output
	call WriteChar	
	pop  eax
	inc  al	; next foreground color
	loop L2	

	inc  row	; go to next row
	pop  ecx	; restore loop counter
	loop L1

	mov  eax,DELAY_TIME	; delay 1 second
	call Delay
	inc  char	; set next character
	pop  ecx	
	loop L0	;  next character

	mov  eax,lightGray	; screen back to normal
	call SetTextColor
	
	; "Press any key..."
	mov dl, 0 ; set the column 
	mov dh, 17 ; set the row 
	call Gotoxy 
	call WaitMsg


	exit
main ENDP
END main