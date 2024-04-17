; 시계가 표시될 좌표를 상수로 정의했다. 

clock_row			equ	0	; CLOCK row position, max = 24
clock_col			equ	68	; CLOCK column position, max = 79

; AM/PM, 시간, 분, 초의 칼라 색상을 상수로 정의했다.

attrampm			equ	20h	; AM/PM field color attribute
attrhrmin			equ	7	; Hour/Minute field color attribute
attrsec 			equ	3	; Second field color attribute

; 프로그램에서 사용하는 메모리 번지들을 상수로 정의한다. 이 영역을
; 통상 BIOS 영역이라 부른다.
; 18.2Hz 인터럽트 (IV = 8) 백터 테이블 

int8			equ	20h	; 18.2 interrupts every second

; CGA는 ‘25 X 80 문자’ 이외에도 여러 가지 비디오 모드가 있다. 비디오 
; 모드는 449H 번지에 저장되어 있는데, 본 프로그램에서는 모드 2와 3만을 
; 지원한다.

video_mode		equ	449h	; 2 = 25 X 80 BW text
					; 3 = 25 X 80 Color text

; 현재 표시하고 있는 CGA 비디오 페이지를 1 바이트로 저장하고 있다.

active_page		equ	462h

; 18.2Hz 클록 인터럽트가 발생할 때마다 1씩 증가한다. 32비트 데이터이다.

time_tick			equ	46ch

segment			code

; 실시간 시계 프로그램 상주 부분이다.
; 원래의 ‘20H'에 저장되어 있는 것을 이곳으로 옮겨놓는다. 즉, 원래의 
; 인터럽트 서비스 프로그램 시작 주소이다.

intvect			resd	1	; original interrupt vector

; 문자의 칼라 속성을 저장하고 있다.

attr1			db	attrampm		; AM/PM color attribute
attr2			db	attrhrmin		; hour/min color attribute
attr3			db	attrsec		; sec color attribute

; 실시간 시계 상주 프로그램이다.

intserv:						; timer tick interrupt service

; 인터럽트 신호를 CPU가 인지하면 인터럽트를 불활성화시킨다. 인터럽트가 오
; 랜 시간 동안 불능화되어 있으면 입출력이 정지된다. 따라서 인터럽트를 활성
; 화시켜서 다른 입출력을 가능하게 해야 한다.

			sti			; interrupt back on
			cld

; 인터럽트 서비스 프로그램에서 사용할 레지스터들을 스택에 저장한다.

			push	eax		; push registers
			push	bx
			push	ecx
			push	edx
			push	di
			push	ds
			push	es

; DS에 ‘0000’을 저장해서 DS가 BIOS 영역을 포인터한다. 

			xor	bx, bx		; DS points BIOS data
			mov	ds, bx

; 비디오 모드가 2 또는 3인가를 판단한다. 즉, '25 X 80' CGA 모드가 
; 아니면 시계를 화면에 표시하지 않는다.

			mov	al, [video_mode]		; check valid video mode
			cmp	al, 2			; process if mode 2 or 3
			je	proc_int
			cmp	al, 3			; exit_int
			jne	exit_int

proc_int:

; 시계를 표시할 비디오 프레임 메모리 번지를 계산하여 ES:DI에 저장한다.

			mov	ax, 0b800h		; ES = CGA video frame buffer
			mov	es, ax
			mov	ah, [active_page]		; get active video page
			shl	ah, 4			; page * 1000H ==> AX
			add	ax, (clock_row * 80 + clock_col) * 2
			mov	di, ax			; ES:DI points CLOCK display area

; time_tick 32 비트를 읽어 와서 이를 18.2로 나누어 현재 시간을 초단위로
; 계산한다. 18.2로 나누어줄 수 없으므로 time_tick에 5를 곱해주고 이를
; 91로 나누었다.

			mov	eax, [time_tick]		; convert time tick
			mov	ecx, 5			; tick * 5 / 91 = sec
			mul	ecx
			mov	cl, 91
			div	ecx			; EAX = second

; EAX에 초단위의 현재 시간이 저장되어 있으므로 이를 60으로 나누면 나머지
; 가 초이다. 몫이 초단위 시간과 분이다. 몫을 다시 60으로 나누면 나머지가
; 분이고, 몫이 시간이다.

			xor	edx, edx
			mov	cl, 60
			div	ecx
			mov	bh, dl			; BH = second, AX = min & hour
			div	cl			; AL = hour, AH = min

; 시, 분, 초가 다 구해졌으므로 이를 CGA 비디오 프레임 메모리에 저장한다.
; 80x86은 리틀 엔디안으로 AL이 낮은 번지에 AH가 높은 번지에 저장된다.

			mov	dx, cs			; DS = CS
			mov	ds, dx

			mov	cx, ax			; Display AM/PM
			mov	ah, [attr1]			; CL = hour, CH = min
			mov	al, ' '
			stosw
			mov	al, 'A'
			cmp	cl, 12
			jb	time2
			mov	al, 'P'
			je	time2
			sub	cl, 12
time2:			stosw
			mov	al, 'M'
			stosw
			mov	al, ' '
			stosw

			mov	ah, [attr2]		; Display HOUR
			mov	al, cl
			call	ascii
			mov	al, ':'
			stosw
			mov	al, ch		; Display MIN
			call	ascii
			mov	al, ' '
			stosw
			mov	ah, [attr3]
			mov	al, bh		; Display SEC
			call	ascii

; 모든 작업을 마쳤으므로 스택에 저장했던 레지스터들을 복구한다.

exit_int:			; Goto original interrupt
			pop	es
			pop	ds
			pop	di
			pop	edx
			pop	ecx
			pop	bx
			pop	eax

; 원래의 인터럽트 서비스 프로그램으로 원거리 간접 분기한다.

			jmp	far [cs:intvect]	; DS is unknown

ascii:			mov	dh, ah		; save attribute code
			mov	bl, 10		; hexa in AL to BCD in AX
			xor	ah, ah
			div	bl
			or	ax, '00'
			cmp	al, '0'
			jne	asc1
			mov	al, ' '
asc1:			xchg	ah, dh		; restore attribute code
			stosw			; save MSB first
			xchg	al, dh
			stosw
			ret

; 여기까지가 메모리에 상주할 부분이다.

messg			db	'CLOCK already installed', 0dh, 0ah, '$'

; cclock.exe 시작점이다.

..start:
			mov		ax, cs		; DS = CS
			mov		ds, ax

; 실시간 시계 프로그램이 이미 상주해서 동작 중인지를 판단한다. 이미 상주해 
; 있다면 메시지를 출력하고 프로그램을 종료한다.

			xor	ax, ax		; check if CLOCK already installed
			mov	es, ax
			mov	di, [es:int8]
			mov	es, [es:int8 + 2]
			mov	si, intserv
			mov	cx, 32
			repe	cmpsw
			jne	setime

			mov	dx, messg
			mov	ah, 9
			int	21h
			mov	ax, 4c00h
			int	21h

; 20H(INT  8)에 저장되어 있는 원래의 인터럽트 서비스 프로그램의 시작 
; 번지를 읽어서 ‘intvect 	resd 1’에 저장하고, 20H 번지에는 실시간 시계
; 상주 프로그램 시작점 ‘intserv:’의 코드 세그먼트와 오프셋을 저장한다.

setime: 			xor	ax, ax		; DS points BIOS data
			mov	ds, ax

			cli			; redirect INT 8

; 인터럽트 백터를 바꾸는 도중에 인터럽트가 들어오는 것을 방지하기 위해서
; 인터럽트를 불능화시킨다.

			mov	cx, intserv
			xchg	cx, [int8]
			mov	dx, cs
			xchg	dx, [int8 + 2]
			mov	[cs:intvect], cx
			mov	[cs:intvect + 2], dx
			sti

; 인터럽트 서비스 프로그램을 상주시키고 프로그램을 종료한다.

			mov	dx, messg + 15	; resident and exit to DOS
			mov	cl, 4
			shr	dx, cl
			mov	ax, 3100h
			int	21h
