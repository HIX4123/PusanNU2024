segment		stack 	stack
		resw	256
tos:

segment		data
msg1		db  	" input : $"
msg2		db	"--------------------------$"
msg3		db  	" prime : $"
msg4		db	" Press any key to continue or Esc to Quit : $"
cr		db	0dh, 0ah, "$"

max		db	11
actin		db	0
inval	    	times	11	db  0
invale:

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
		mov	ah, 09h			 ;줄바꿈
    		mov     	edx, cr
    		int     	21h

		mov     	ah, 09h
    		mov     	edx, msg1		 ;msg1 출력
    		int     	21h

		mov	ah, 0ah			 ;버퍼된키보드입력
		mov	edx, max
		int	21h

		mov	ah, 09h			 ;줄바꿈
    		mov     	edx, cr
    		int     	21h

		mov     	ah, 09h
    		mov     	edx, msg2		 ;msg2 출력
    		int     	21h

		xor	eax, eax		     	;get input number into EAX
		mov	esi, inval
		mov	ecx, 10
		xor	ebx, ebx

c10:		mov	bl, [esi]
		cmp	bl, 0dh
		je     	c20

		and	bl, 0fh
		mul	ecx
		add	eax, ebx
		inc	esi
		jmp	c10

c20:		mov	ebx, eax
		cmp	ebx, 4
		jb	e40

		test	bl, 1			 ;input is even number ?
		jne	e10

		dec	ebx

e10:		mov	ecx, 3

e20:		mov    	eax, ecx
		mul	ecx
		or	edx, edx
		jne	e40

		cmp	ebx, eax
		jb	e40

		mov	eax, ebx
		div	ecx
		or	edx, edx
		je	e30

		add	ecx, 2
		jmp	e20

e30:		sub	ebx, 2
		jmp	e10

e40:		mov	esi, invale-2
		mov	byte [esi+1], '$'
		mov	ecx, 10
		mov	eax, ebx

d10:		cmp	eax, ecx
		jb	d20

		xor	edx, edx
		div	ecx
		or	dl, 30h
		mov	[esi], dl
		dec	esi
		jmp	d10

d20:
		or	al, 30h
		mov	[esi], al
		mov	ah, 09h			 ; 줄바꿈
    		mov     	edx, cr
    		int     	21h

		mov     	ah, 09h
    		mov     	edx, msg3		 ; msg3 출력
    		int     	21h

		mov     	ah, 09h
    		mov     	edx, esi		     	; 소수결과출력
    		int     	21h

		mov	ah, 09h			; 줄바꿈
    		mov     	edx, cr
    		int     	21h

		mov     	ah, 09h
    		mov     	edx, msg2		 ; msg2 출력
    		int     	21h

		mov	ah, 09h			 ; 줄바꿈
    		mov     	edx, cr
    		int     	21h

		mov     	ah, 09h
    		mov     	edx, msg4		 ; msg4 출력
    		int     	21h

		mov	ah, 07h			 ; 한문자입력
		int	21h

		cmp	al, 1bh
		jne	start

		mov	ax, 4c00h
		int	21h