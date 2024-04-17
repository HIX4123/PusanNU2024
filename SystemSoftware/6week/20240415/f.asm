%include 		"dosdef.txt"	; include MSDOS definition file

segment		stack 	stack
		resw	512
tos:

segment		data

fact		dd	1, 0, 0, 0      ; 1! = 1
factw		dd	1, 0, 0, 0      ; 1! = 1
factd		resb	20
factn		db	1

mess1		db	'! -- $'
mess2		db	cr, lf, '$'

segment		code
..start:
		mov	ax, data
		mov	ds, ax
		mov	es, ax
		cld

		cli			; disable interrupt
		mov	ax, stack
		mov	ss, ax
		mov	sp, tos
		sti			; back on interrupt


f_loop:		call	disp_fact		; display N! = X

		inc	byte [factn]	; increment N

		xor	eax, eax		; clear factw
		mov	[factw], eax	; factw = fact * N
		mov	[factw+4], eax
		mov	[factw+8], eax
		mov	[factw+12], eax
		mov	bl, [factn]		; BL is N

fcal1:		shr	bl, 1		; LSB of BL to CY
		jnc	fcal2		; if no CY, do not add fact to factw

		mov	eax, [fact]
		add	[factw], eax
		mov	eax, [fact+4]
		adc	[factw+4], eax
		mov	eax, [fact+8]
		adc	 [factw+8], eax
		mov	eax, [fact+12]
		adc	[factw+12], eax

		jc	fcale		; if overflow, exit

fcal2:		or	bl, bl		; end of multiplying ?
		je	fcal3

		shl	dword [fact], 1	; fact = fact * 2
		rcl	dword [fact+4], 1
		rcl	dword [fact+8], 1
		rcl	dword [fact+12], 1

		jc	fcale		; if overflow, exit

		jmp	fcal1

fcal3: 		mov	si, factw		; copy factw to fact
		mov	di, fact
		mov	cx, 4
		rep	movsd

		jmp	f_loop

fcale:		msdos	exit_dos

disp_fact:

		mov	al, [factn]		; AX = N
		xor	ah, ah
		mov	bx, 0a00h		; BH = 10, BL is leading zero flag
		div	bh		; AL = 10s digit, AH = 1s digit
		shl	al, 4
		add	al, ah
		call	bcdout

		prints	mess1

		xor	eax, eax		; clear 20 digit packed BCD buffer
		mov	[factd], eax
		mov	[factd+4], eax
		mov	[factd+8], eax
		mov	[factd+12], eax
		mov	[factd+16], eax

		mov	cx, 128		; N! is 128 bit

disp2:		rcl	dword [factw], 1	; Convert 128 bit number in factw
		rcl	dword [factw+4], 1 ;into 40 digit packed BCD in factd
		rcl	dword [factw+8], 1
		rcl	dword [factw+12], 1

		mov	dl, 20
		mov	si, factd

disp3:		mov	al, [si]
		adc	al, al
		daa
		mov	[si], al
		inc	si
		dec	dl
		jne	disp3

		loop	disp2

		mov	cx, 20		; display 40 digit packed BCD in fibod
		xor	bl, bl		;  BL is leading zero flag
disp4:		dec	si
		mov	al, [si]
		call	bcdout
		loop	disp4

		prints	mess2
		ret

bcdout:		push	ax
		shr	al, 4
		call	bcdl
		pop	ax

bcdl:		and	al, 0fh
		or	bl, al
		je	bcde
		or	al, '0'
		conout	al
bcde:	ret


 




