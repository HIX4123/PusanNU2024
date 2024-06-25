%include 		"dosdef.txt"	; include MSDOS definition file

; clparse와 prtdate는 본 프로그램에 없으며 링크시에 다른 프로그램 또는
; 라이브러리에서 링크가 된다는 것을 나타내기 위해서 extern으로 선언한다.
; 외부 변수가 code 세그먼트 영역에서 선언된 것이므로 code 세그먼트내에
; extern 문장이 있어야 한다.

segment 		code
extern  		clparse, prtdate

segment		stack stack
		resw	256
tos:

segment 		data		;  Data segment
headm		db	cr, lf
		db	' SUN MON TUE WED THU FRI SAT', cr, lf
crlf		db	cr, lf, '$'

errm1		db	cr, lf
		db	'Usage ---  CALEN  year/month', cr, lf, '$'
errm2		db	cr, lf
		db	'Incorrect year or month', cr, lf, '$'

; 달의 날수를 테이블로 작성한다. 윤년인 경우에는 2월의 날수를 29로 수정한
; 다,

max_date		db	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

; 한 달은 최대 6주이다. 달력을 저장하기 위한 버퍼이다.

date_buf		resb	7*6

segment		code
..start:
		mov	ax, data		; set data segment
		mov	ds, ax
		cld

		cli
		mov	ax, stack
		mov	ss, ax
		mov	sp, tos
		sti

; 달력 버퍼를 ‘0’으로 초기화한다.

		mov	bx, date_buf	; clear date buffer
		xor	ax, ax
		mov	cx, 21
clr1:		mov	[bx], ax
		inc	bx
		inc	bx
		loop	clr1

; 코맨드 라인을 파싱해서 년도(year)를 입력한다.

		mov	si, cmdline	; SI to command line
		call	clparse		; Parse command line into AX
		jnb	putyear

; 숫자가 입력되었으면 년도로 인식하고 'putyear'로 분기하며, 특수 문자가
;  입력 되었으면 오류 메시지를 출력하고 프로그램을 종요한다.

errt1:		prints	errm1		; error in command line
		msdos	exit_dos

; 입력된 년도가 10,000년 미만이면 'okyear'로 분기하고, 그렇지 않으면 
; 오류 메시지를 출력하고 프로그램을 종료한다.

putyear: 		cmp	ax, 10000		; check year boundary
		jc	okyear

errt2:		prints	errm2		; error in year/month
		msdos	exit_dos

; 년도를 BP 레지스터에 저장하고, ‘0’년이면 오류 처리 부분으로 분기한다. 

okyear: 		mov	bp, ax		; BP is year
		or	ax, ax		; year is 0
		je	errt2

; ‘/’ 문자 입력을 확인하기 위하여 ‘clparse’를 호출한다.

		call	clparse		; Parse command line into AX
		jnb	errt1
		cmp	al, '/'		; Must be /
		jne	errt1

; ‘clparse’를 호출하여 월(month) 입력을 파싱한다. 

		call	clparse
		jb	errt1

; 입력된 월(month)이 1-12 사이인지 판정한다. 올바른 월(month)이 입력
; 되었으면 월(month)을 DI 레지스터에 저장한다.

		or	ax, ax		; check month boundary
		je	errt2
		cmp	ax, 13
		jnc	errt2
		mov	di, ax		; DI is month

; 년도(year)의 1월 1일의 요일수를 계산하여 SI 레지스터에 저장한다. 1년
;부터 year까지 경과한 해수는 'year-1'이다. 

		mov	si, bp		; calculate week of year.1.1
		dec	si

; year까지 포함된 윤년의 수는 ‘(year-1) / 4’이다. 4로 나누는 것은 
; 오른쪽으로 2비트 이동시키는 것이다.  ‘(year-1) + (year-1)/4’를 계산
; 하면 4년마다 나오는 윤년을 포함하여 year년 1월 1일의 요일수가 계산
; 된다.

		mov	ax, si		; SI = year-1
		shr	ax, 2
		add	si, ax		; SI = (year-1) + (year-1)/4

; 100으로 나누어지는 해는 윤년이 아니므로 이를 앞의 요일수에서 감해주어야
; 한다. AX는 '(year-1)/4'가 저장되어 있으므로 이를 25로 나누어준다.

		mov	cl, 25
		div	cl		; AX = (year-1)/100
		xor	ah, ah
		sub	si, ax		; AX = (year-1)+(year-1)/4-(year-1)/100

; 400으로 나누어지는 해는 윤년이므로 이를 다시 더해준다. AX에는
; '(year-1)/100'이 저장되어 있으므로 이를 오른쪽으로 2비트 이동시키면
; 400으로 나눈 값이 구해진다.

		shr	ax, 2		; AX = (year-1)/4
		add	si, ax		

;   SI = (year-1)+(year-1)/4-(year-1)/100+(year-1)/400

; SI에는 1년 1월 1일부터 누적된 요일수가 저장되어 있다. 1년 1월 1일의 
; 요일수는 ‘1’이므로 SI에 ‘1’을 다하면 year년 1월 1일의 요일수가 
; 구해진다.

		inc	si		; 1.1.1 is monday

; 윤년을 판정한다. year는 2진수로 저장되어 있으므로 하위 2비트가 ‘00’
; 이면 4로 나누어지는 수이다. 이를 판단하기 위해서 3(11b)와 AND시켜본다.
; 그 결과 zero가 아니면 4로 나누어지지 않으므로 평년이다.

		mov	ax, bp		; check for leap year
		test	al, 3
		jne	plainy		; If year mod 4 is not 0

; 4로 나누어지면 100으로 나누어지는지 판단한다. 이는 100으로 나누어서 
; 나머지가 있는지 확인한다.

		mov	cl, 100
		div	cl
		or	ah, ah
		jne	leapy		; If year mod 100 is not 0

; 100으로 나누어지면 400으로 나누어지는지 판단한다. AL에는 100으로 나눈
; 몫이 저장되어 있으므로 AL의 하위 2비트가 ‘00’인지를 판단한다. 

		and	al, 3
		jne	plainy		; if year mod 400 is not 0

; 윤년이면 2월의 날수를 ‘1’증가시킨다.

leapy:		inc	byte [max_date + 1]

; year년 month월 1일의 요일수를 계산한다. month가 DI에 저장되어 
; 있으므로 날수 테이블에서 ‘DI - 1’까지의 날수를 year년 1월 1일의 
; 요일수에 더한다.

plainy:		mov	ax, si		; Get week of year.month.1
		mov	si, max_date
		xor	bh, bh
monloop:
		dec	di
		je	prtcal

; 요일수는 16비트로 AX에 저장되어 있고, 테이블의 날수는 8비트이므로 이를
; AL에 더하고, 자리올림수(CY)를 AH에 더한다.

		add	al, [si]
		adc	ah, 0
		inc	si
		jmp	monloop

; 요일수를 7로 나누어서 나머지를 구하면 year년 month월 1일의 요일수가 구
; 해진다. 16비트 나누기 8비트 명령어는 몫이 8비트를 넘어서면 오류를 발생
; 한다. 오류 발생을 막기 위해서 32비트 나누기 16비트 명령어를 사용한다.
; 구한 요일수를 BX에 저장한다. 

prtcal:		xor	dx, dx
		mov	cx, 7
		div	cx
		mov	bx, dx

; year년 month월 1일의 요일수부터 그 달의 날수까지를 달력 버퍼에 저장
; 하면 달력이 완성된다. 출력을 편하기 하기 위하여 날수는 BCD로 저장한다.

		mov	cl, [si] 		; DL last date of month
		mov	al, 1
putdate: 		mov	[date_buf + bx], al
		inc	bx
		add	al, 1
		daa
		loop	putdate

; 달력이 완성되었으므로 화면에 출력한다.

		prints	headm

		mov	si, date_buf

; 6주 7일의 카운터를 BH와 BL에 설정한다.

		mov	bx, 607h
putloop: 		lodsb
		call	prtdate
		dec	bl
		jne	putloop

; 한 주를 출력하면 줄 바꾸기를 한다.

		prints	crlf
		mov	bl, 7
		dec	bh
		jne	putloop

		msdos	exit_dos
