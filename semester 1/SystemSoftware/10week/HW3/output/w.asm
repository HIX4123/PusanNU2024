%macro		first	0
		mov	ax, data
		mov	ds, ax
		mov	es, ax
		cld
		cli
		mov	ax, stack
		mov	ss, ax
		mov	sp, tos
		sti
%endmacro

%macro		finish	1
		mov	ax, %1
		int	21h
%endmacro

segment		stack	stack
		resw	512
tos:

segment 		data
msg1		db	'input  : $'
msg2		db	0dh, 0ah, 'output : $'

segment		code
..start:
		first

		mov 	ah, 09h
		mov	dx, msg1
		int	21h

		mov	ah, 01h
		int 	21h

		mov	bl, al
		mov	ah, 09h
		mov	dx, msg2
		int 	21h

		mov	ah, 02h
		mov	dl, al
		int	21h

		finish	4c00h