;	int a, b;
;	printf("		** Multiplication Table **\n");
;	for (a = 1; a < 10; a++)
;	{ 
;		for (b = 2; b < 10; b++)
;			printf("%1d * %1d = %2d ", b, a, a*b);
;		printf("\n")
;  	}


segment		stack 	stack
		resw	256
tos:
		
segment		data
messg		db		'		** Multiplication Table **'
crlf		db		0dh, 0ah, '$'
space		db		'  $'
		
segment		code
..start:
		mov	ax, data
		mov	ds, ax

		cli
		mov	ax, stack
		mov	ss, ax
		mov	sp, tos
		sti

		mov	dx, messg
		mov	ah, 9
		int	21h

		mov	cx, 201h	

mloop1:	
		mov	dl, ch		
		add	dl, '0'
		mov	ah, 2
		int	21h

		mov	dl, 'X'
		int	21h

		mov	dl, cl		
		add	dl, '0'
		int	21h

		mov	dl, '='
		int	21h

		mov	al, cl		
		mul	ch

		mov	bl, 10		
		div	bl			
		mov	bl, ah	

		mov	dl, ' '		
		or	al, al		
		je	mloop2
		mov	dl, al
		add	dl, '0'
mloop2:	
		mov	ah, 2
		int	21h

		mov	dl, bl		
		add	dl, '0'
		mov	ah, 2
		int	21h


		mov	dx, space	
		mov	ah, 9
		int	21h

		inc	ch			
		cmp	ch, 10		
		jb	mloop1

		mov	dx, crlf
		mov	ah, 9
		int	21h

		mov	ch, 2		
		inc	cl
		cmp	cl, 10
		jb	mloop1

		mov	ax, 4c00h
		int	21h 




