;	>nasm -f obj h1.asm 
;	>nasm -f obj h2.asm 
;	>alink -o h h1.obj h2.obj


%include 		"dosdef.txt"

segment 		code

; clparse와 prtdate는 다른 모듈(프로그램)에서 참조할 수 있도록 
; global로 선언

global		clparse, prtdate

; Parse command line
;    input : ES:SI = command line
;    output : CY = 0 then AX is hexa number
;               CY = 1 then AL is input char

clparse:					; parse command line
		push	bx
		push	cx

clpa1:		mov	al, [es:si]		; skip leading space and htab
		cmp	al, space
		je	clpa2
		cmp	al, htab
		jne	clpa3
clpa2:		inc	si
		jmp	clpa1

clpa3:		cmp	al, zero		; numeric ASCII code ?
		jb	nogood
		cmp	al, '9'
		ja	nogood

		xor	ah, ah
		xor	bx, bx
clpa4:		mov	 al, [es:si]		; get numeric code
		sub	al, zero
		jb	eos		; If not numeric code, end of string
		cmp	al, 9
		ja	eos
		mov	cx, bx
		add	cx, cx
		add	cx, cx
		add	bx, cx
		add	bx, bx
		add	bx, ax
		inc	si
		jmp	clpa4

eos:		mov	ax, bx
		or	ax, ax		; clear CY
		pop	cx
		pop	bx
		ret

nogood: 		inc	si
		stc
		pop	cx
		pop	bx
		ret

; 날짜를 출력하는 서브프로그램.

prtdate:
		push	ax
		conout	space
		conout	space
		pop	ax
		or	al, al		; If printed char is 0
		jne	prt1
		conout	space
		conout	space
		ret

prt1:		push	ax		; Console out MSB first
		shr	al, 4
		and	al, 0fh
		mov	dl, space		; If leading zero, console out space
		je	prt2
		or	al, zero
		mov	dl, al
prt2:		conout	dl
		pop	ax
		and	al, 0fh
		or	al, zero
		conout	al
		ret





 




