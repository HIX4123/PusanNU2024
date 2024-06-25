segment		stack 	stack
		resw	256
tos:
segment	 	data
msg		db	" function(+, -, *, /) : $"       
msg1		db	" input1(only 1 digit) : $"
msg2		db	" input2(only 1 digit) : $"
msg3		db	" output : $"
msg4		db	" Press any key to continue or Esc to quit $"
msg5		db	" Invalid (+, -, *, /) : $"	
cr		db	0dh, 0ah, "$"
inp		resb	1
outp		db	' 00$'
	
segment		code
..start:
		mov	ax, data
		mov	ds, ax
		mov	es, ax
		cld

		cli
		mov	ax, stack
		mov	ss, ax
		mov	sp, tos
		sti
start:	
		mov	byte [outp], 20h
		mov	word [outp+1], '00'
		mov	byte [inp], 0

		mov	ah, 09h
		mov	dx, cr
		int	21h

		mov	ah, 09h
		mov	dx, msg
		int	21h
re:
		mov	ah, 01h
		int	21h

		cmp	al, '+'
		je	br10

		cmp	al, '-'
		je	br20

		cmp	al, '*'
		je	br30

		cmp	al, '/'
		je	br40

		mov	ah, 09h
		mov	dx, cr
		int	21h

		mov	ah, 09h
		mov	dx, msg5
		int	21h

		jmp	re

br10:	
		call	get_in
		add	al, bl
		mov	[inp], al
		jmp	out10	

br20:	
		call	get_in
		sub	bl, al
		mov	[inp], bl
		jns	out10
		neg	byte [inp]
		mov	byte [outp], '-'
		jmp	out10

br30:	
		call	get_in
		mul	bl
		mov	[inp], al
		jmp	out10

br40:	
		call	get_in
		mov	bh, al
		movzx	ax, bl
		div	bh
		mov	[inp], al

out10:	
		mov	ah, 09h
		mov	dx, cr
		int	21h

		mov	ah, 09h
		mov	dx, msg3
		int	21h

		mov	al, [inp]
		xor	ah, ah
		mov	bl, 10
		div	bl

		or	ax, 3030h
		mov	[outp+1], ax

		mov	ah, 09h
		mov	dx, outp
		int	21h

		mov	ah, 09h
		mov	dx, cr
		int	21h

		mov	ah, 09h
		mov	dx, msg4
		int	21h

		mov	ah, 08h
		int	21h

		cmp	al, 1bh
		jne	start

		mov	ax, 4c00h
		int	21h

get_in:	
		mov	ah, 09h
		mov	dx, cr
		int	21h

		mov	ah, 09h
		mov	dx, msg1
		int	21h

		mov	ah, 01h
		int	21h

		and	al, 0fh
		mov	bl, al

		mov	ah, 09h
		mov	dx, cr
		int	21h

		mov	ah, 09h
		mov	dx, msg2
		int	21h

		mov	ah, 01h
		int	21h

		and	al, 0fh
		ret
 




