; ������ �迭�� ��0������ �ʱ�ȭ�Ѵ�.
;  for (ia=0 ; ia<numb ; ia++)
;    for (ja=0 ; ja<numb ; ja++) box[ia][ja] = 0 ;
;
; �������� ������� box[0][(numb-1)/2]�̴�. ia, ja �ε����� �ʱ�ȭ
; �Ѵ�.
;  ia = 0 ;
;  ja = (numb-1)/2 ;
;
; ��������κ��� numb*numb���� �ݺ� �����Ѵ�.
;  for (ib=1 ; ib<=numb*numb ; ib++)
;
; ������ ��ġ�� �̹� �ٸ� ���� ����Ǿ� ������ ia �ε����� 2, ja �ε�����
; 1 ���� ������Ų��. 
;    { if (box[ia][ja] !=0 )
;        { ia+=2 ; ja++ ; }
;
; ������ �迭�� ���� �����Ѵ�.
;      box[ia][ja] = ib ;
;
; ���� ������ ��ġ�� �����Ѵ�.
; ia �ε����� ��0���� �ƴϸ� ia�� 1 ���ҽ�Ų��. ja�� 0�̶�� �������� ���� 
; ���� ���̹Ƿ� ���� ja�� 'numb-1'�̰�, ja�� 0�� �ƴ϶�� ja�� 1 ����
; ��Ų��.
;      if (ia)
;	{ ia-- ;
;	  if (ja) ja-- ;
;	    else ja = numb-1 ; }
;
; ia �ε����� ��0���̸� �������� �������� ���̴�. ja ���� 0�̶�� ���� ia
; �� 1, ja�� 0�̴�. ja�� 0�� �ƴ϶�� ia�� 'numb-1'�̰�, ja�� 1 ����
; ��Ų��.
;	else
;	  if (ja) {ia = numb-1 ; ja-- ; }
;	     else { ia = 1 ; ja = 0 ; }
;    }
;  }

%include 		"dosdef.txt"		; include MSDOS definition file

segment		stack stack
		resw	512
tos:

segment		data 			;  Data segment

; box[19][19]�� �����Ѵ�. ������ ���� 16 ��Ʈ�̹Ƿ� resw�� ����Ѵ�.

box		resw	361		; box[ia][ja]
numb		db	0

errm1		db	'Illegal number'
crlf		db	cr, lf, '$'

segment		code
..start:
		mov	ax, data 		; set data segment
		mov	ds, ax
		cld

		cli			; disable interrupt
		mov	ax, stack
		mov	ss, ax
		mov	sp, tos
		sti			; back on interrupt

; �ڸǵ� ������ �Ľ��ؼ� �� N�� AX�� ���� �����ִ� �������α׷�
; 'clparse'�� ȣ���Ѵ�.

		mov	si, cmdline	; SI to command line
		call	clparse 		; Parse command line into AX

; N�� 19�� ���ų� ���� Ȧ���ΰ��� �Ǻ��Ѵ�.

		cmp	ax, 19		; check number
		jbe	goodn

errt:		prints	errm1		; error in command line
		msdos	exit_dos

goodn:		cmp	al, 3
		jb	errt

		test	al, 1
		je	errt

		mov	bx, ds
		mov	es, bx
		mov	[numb], al	; numb = N

; �ùٸ� N�� �ԷµǾ����Ƿ� box[N][N]�� '0'���� �ʱ�ȭ�Ѵ�. �̴� ���� C
; ���α׷��� �����ϴ�.
;  for (ia=0 ; ia<numb ; ia++)
;    for (ja=0 ; ja<numb ; ja++) box[ia][ja] = 0 ;
; ����������� �迭 ������ �������� �ʴ´�. ���� 1���� �޸� ���۷�
; ��ȯ�ؾ� �Ѵ�. ��� C ���α׷��� 'numb*numb' ��ŭ�� �޸𸮸� ũ����
; �ϴ� ���̴�. box[][]�� 16��Ʈ ������ �迭�̴�.

		mul	al
		mov	cx, ax
		xor	ax, ax
		rep	stosw

; �������� ����� �ε��� ia, ja�� DL, BL(BX)�� �����ϰ� �ʱ�ȭ�Ѵ�.
; ia = 0 ;
; ja = (numb-1)/2 ;

		mov	al, [numb]
		xor	dl, dl		; DL is ia index
		mov	bl, al		; BL(BX) is ja index,
					;  box[ia][ja] = box[DL][BX]
		xor	bh, bh
		shr	bx, 1

; numb�� Ȧ���̹Ƿ� ���������� �� ��Ʈ �̵���Ű�� (numb-1)/2�� �ȴ�.

; ��������κ��� numb*numb���� �ݺ� �����Ѵ�.
;   for (ib=1 ; ib<=numb*numb ; ib++)

		mul	al
		mov	cx, ax		; CX is loop count
		mov	bp, 1		; BP is magic number

;    { if (box[ia][ja] !=0 )
;        { ia+=2 ; ja++ ; }

fill_box:

; box[ia][ja]�� �������� ����Ͽ� SI�� �����Ѵ�.

		mov	al, dl		; calculate offset in SI
		mul	byte [numb]	; offset = i * N + j = DL * numb + BX
		add	ax, bx
		mov	si, ax		; box entry size is a word, 2 byte
		add	si, si

		test	word [box + si], -1	; already filled ?
		je	fill1

		inc	bl		; ja++, BL = BL + 1
		inc	dl		; ia += 2, DL = DL + 2
		inc	dl
		jmp	fill_box

; ���Ϻ��ʹ� �ش��ϴ� C ���α׷��� �ּ����� �α��ϰ�, �ڼ��� ������ ������
; ��. ���ڵ��� ��� C ���α׷��� �ּ��� �����ϱ� �ٶ���.
;      box[ia][ja] = ib ;

fill1:  		mov  	[box + si], bp  	; if empty slot, save number
		inc	bp

;      if (ia)

		or	dl, dl		; if (ia)
		je	fill3

;	{ ia-- ;
;	  if (ja) ja-- ;


		dec	dl		; ia--, DL = DL - 1
		or	bl, bl		; if (ja)
		je	fill2
		dec	bl		; ja--, BL = BL - 1
		jmp	short fill5

;	    else ja = numb-1 ; }

fill2:		mov	bl, [numb]	; ja = numb - 1
		dec	bl
		jmp	short fill5

;	else
;	  if (ja) {ia = numb-1 ; ja-- ; }
;	     else { ia = 1 ; ja = 0 ; }

fill3:		or	bl, bl		; if (ja)
		je	fill4

		mov	dl, [numb]	; ia = numb-1
		dec	dl
		dec	bl
		jmp	short fill5

fill4:		mov	dl, 1		; ia = 1, DL = 1
		xor	bl, bl		; ja = 0, BL = 0

fill5:		loop	fill_box

; �ϼ��� �������� ȭ�鿡 ����Ѵ�.

		mov	bx, box
		mov	cl, [numb]	; CL is inner loop
		mov	ch, cl		; CH is outer loop

disp:		mov	ax, [bx]

; ������ ���� �ִ밪�� 361�� BCD 3�ڸ� ���̴�. AX�� ����� 2���� ������
; ���� 10���� ������鼭 100�ڸ� ��, 10�ڸ� ��, �ܴ��� ���� ���ϰ� 
; �̸�  ASCII �ڵ�� ��ȯ�Ͽ� ȭ�鿡 ����Ѵ�.

		mov	dx, 100		; DH is leading blank flag
		div	dl

		call	bcdout

		mov	al, ah
		xor	ah, ah
		mov	dl, 10
		div	dl
		call	bcdout

		mov	al, ah
		call	bcdout

		conout	' '

		inc	bx
		inc	bx
		dec	cl
		jne	disp

		prints	crlf

		mov	cl, [numb]
		dec	ch
		jne	disp
		msdos	exit_dos

bcdout:		push	ax
		mov	dl, ' '
		or	dh, al
		je	bcd1
		or	al, '0'
		mov	dl, al
bcd1:		conout	dl
		pop	ax
		ret

; ES:SI�� �������ϰ� �ִ� �ڸǵ� ������ �Ľ��Ͽ� ���� N�� AX�� �����Ͽ�,
; �����ϴ� �������α׷��̴�.

clparse:					; parse command line
		xor	ax, ax		; return in AX
		xor	bh, bh

clpa1:		mov	bl, [es:si]		; skip leading space and htab
		cmp	bl, space
		je	clpa2
		cmp	bl, htab
		jne	clpa3

clpa2:		inc	si
		jmp	clpa1

clpa3:		sub	bl, zero 		; numeric ASCII code ?
		jb	clpa4
		cmp	bl, 9
		ja	clpa4

		mov	cx, ax
		add	cx, cx
		add	cx, cx
		add	ax, cx
		add	ax, ax
		add	ax, bx
		inc	si
		mov	bl, [es:si]		; get next char.
		jmp	clpa3

clpa4:		ret




 




