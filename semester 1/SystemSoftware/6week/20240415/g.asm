; 마방진 배열을 ‘0’으로 초기화한다.
;  for (ia=0 ; ia<numb ; ia++)
;    for (ja=0 ; ja<numb ; ja++) box[ia][ja] = 0 ;
;
; 마방진의 출발점은 box[0][(numb-1)/2]이다. ia, ja 인덱스를 초기화
; 한다.
;  ia = 0 ;
;  ja = (numb-1)/2 ;
;
; 출발점으로부터 numb*numb까지 반복 수행한다.
;  for (ib=1 ; ib<=numb*numb ; ib++)
;
; 저장할 위치에 이미 다른 수가 저장되어 있으면 ia 인덱스를 2, ja 인덱스를
; 1 각각 증가시킨다. 
;    { if (box[ia][ja] !=0 )
;        { ia+=2 ; ja++ ; }
;
; 마방진 배열에 수를 저장한다.
;      box[ia][ja] = ib ;
;
; 다음 저장할 위치를 결정한다.
; ia 인덱스가 ‘0’이 아니면 ia를 1 감소시킨다. ja가 0이라면 마방진을 빠져 
; 나갈 것이므로 다음 ja는 'numb-1'이고, ja가 0이 아니라면 ja를 1 감소
; 시킨다.
;      if (ia)
;	{ ia-- ;
;	  if (ja) ja-- ;
;	    else ja = numb-1 ; }
;
; ia 인덱스가 ‘0’이면 마방진을 빠져나갈 것이다. ja 또한 0이라면 다음 ia
; 는 1, ja는 0이다. ja가 0이 아니라면 ia는 'numb-1'이고, ja는 1 감소
; 시킨다.
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

; box[19][19]를 설정한다. 마방진 수는 16 비트이므로 resw를 사용한다.

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

; 코맨드 라인을 파싱해서 수 N을 AX로 리턴 시켜주는 서브프로그램
; 'clparse'를 호출한다.

		mov	si, cmdline	; SI to command line
		call	clparse 		; Parse command line into AX

; N이 19와 같거나 작은 홀수인가를 판별한다.

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

; 올바른 N이 입력되었으므로 box[N][N]을 '0'으로 초기화한다. 이는 다음 C
; 프로그램과 동일하다.
;  for (ia=0 ; ia<numb ; ia++)
;    for (ja=0 ; ja<numb ; ja++) box[ia][ja] = 0 ;
; 어셈블러에서는 배열 구조를 지원하지 않는다. 따라서 1차원 메모리 버퍼로
; 변환해야 한다. 상기 C 프로그램은 'numb*numb' 만큼의 메모리를 크리어
; 하는 것이다. box[][]는 16비트 데이터 배열이다.

		mul	al
		mov	cx, ax
		xor	ax, ax
		rep	stosw

; 마방진의 출발점 인덱스 ia, ja를 DL, BL(BX)로 설정하고 초기화한다.
; ia = 0 ;
; ja = (numb-1)/2 ;

		mov	al, [numb]
		xor	dl, dl		; DL is ia index
		mov	bl, al		; BL(BX) is ja index,
					;  box[ia][ja] = box[DL][BX]
		xor	bh, bh
		shr	bx, 1

; numb는 홀수이므로 오른쪽으로 한 비트 이동시키면 (numb-1)/2이 된다.

; 출발점으로부터 numb*numb까지 반복 수행한다.
;   for (ib=1 ; ib<=numb*numb ; ib++)

		mul	al
		mov	cx, ax		; CX is loop count
		mov	bp, 1		; BP is magic number

;    { if (box[ia][ja] !=0 )
;        { ia+=2 ; ja++ ; }

fill_box:

; box[ia][ja]의 오프셋을 계산하여 SI에 저장한다.

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

; 이하부터는 해당하는 C 프로그램을 주석으로 부기하고, 자세한 설명은 생략한
; 다. 독자들은 상기 C 프로그램의 주석을 참조하기 바란다.
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

; 완성된 마방진을 화면에 출력한다.

		mov	bx, box
		mov	cl, [numb]	; CL is inner loop
		mov	ch, cl		; CH is outer loop

disp:		mov	ax, [bx]

; 마방진 수의 최대값을 361로 BCD 3자리 수이다. AX에 저장된 2진수 마방진
; 수를 10으로 나누어가면서 100자리 수, 10자리 수, 단단위 수를 구하고 
; 이를  ASCII 코드로 변환하여 화면에 출력한다.

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

; ES:SI로 포인터하고 있는 코맨드 라인을 파싱하여 숫자 N을 AX에 저장하여,
; 복귀하는 서브프로그램이다.

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




 




