
%include 		"dosdef.txt"		; include MSDOS definition file

segment		stack 	stack
		resw	512
tos:

segment		data			;  Data	segment
mess1:		db	'Sigma -- $'
erm:		db	'Command Error'
crlf:		db	cr, lf, '$'

segment		code
..start:
		mov	ax, data		; set DS
		mov	 ds, ax

		cli			; disable interrupt
		mov	ax, stack
		mov	ss, ax
		mov	sp, tos
		sti			; back on interrupt


		mov	 si, cmdline	; get command

		xor	bx, bx		; BL is N

get1:		mov	cl, [es:si]		; input char to CL
		inc	si

		cmp	cl, space
		je	get1
		cmp	cl, htab
		je	get1

		cmp	cl, cr	
		jne	get2

error:		prints	erm
		msdos	exit_dos

get2:		sub	cl, zero
		jb	error
		cmp	cl, 9
		ja	error

		mov	al, 10		; N(BL) * 10 + in(CL) ==> N(BL)
		mul	bl
		add	al, cl
		mov	bl, al

		mov	cl, [es:si]
		inc	si
		cmp	cl, cr
		jne	get2

		prints	mess1

		mov	al, bl		; AL and BL is N
		test	al, 1		; N is even ?
		je	even

		shr	al, 1		; Sum = N * (N-1) / 2 + N

		mul	bl
		add	ax, bx

		jmp	short cal

even:		inc	bl		; Sigma = N * (N+1) / 2
		shr	al, 1
		mul	bl

cal:	 	mov	bx, ax		; BX = sum
		mov	cx, 16		; 16 bit counts
		xor	dx, dx		; 5 digit BCD = CH:DH:DL

conv:		shl	bx, 1		; MSB of BX to CY

		mov	al, dl
		adc	al, al
		daa
		mov	dl, al

		mov	al, dh
		adc	al, al
		daa
		mov	dh, al

		mov	al, ch
		adc	al, al
		daa
		mov	ch, al

		dec	cl
		jne	conv

		mov	al, ch		; Display BCD MSB
		call	bcdl		; Display low nibble of AL

		mov	al, dh
		call	bcd		; Display 2 BCD digit in AL
		mov	al, dl
		call	bcd		; Display low nibble of AL

		prints	crlf
		msdos	exit_dos

bcd:		push	ax
		shr	al, 4
		call	bcdl
		pop	ax

bcdl:		push	dx
		and	al, 0fh
		or	cl, al		; CL is leading zero flag
		je	bcde
		or	al, zero
		conout	al
bcde:		pop	dx
		ret

 




