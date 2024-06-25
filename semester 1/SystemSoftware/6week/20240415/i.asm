; �ð谡 ǥ�õ� ��ǥ�� ����� �����ߴ�. 

clock_row			equ	0	; CLOCK row position, max = 24
clock_col			equ	68	; CLOCK column position, max = 79

; AM/PM, �ð�, ��, ���� Į�� ������ ����� �����ߴ�.

attrampm			equ	20h	; AM/PM field color attribute
attrhrmin			equ	7	; Hour/Minute field color attribute
attrsec 			equ	3	; Second field color attribute

; ���α׷����� ����ϴ� �޸� �������� ����� �����Ѵ�. �� ������
; ��� BIOS �����̶� �θ���.
; 18.2Hz ���ͷ�Ʈ (IV = 8) ���� ���̺� 

int8			equ	20h	; 18.2 interrupts every second

; CGA�� ��25 X 80 ���ڡ� �̿ܿ��� ���� ���� ���� ��尡 �ִ�. ���� 
; ���� 449H ������ ����Ǿ� �ִµ�, �� ���α׷������� ��� 2�� 3���� 
; �����Ѵ�.

video_mode		equ	449h	; 2 = 25 X 80 BW text
					; 3 = 25 X 80 Color text

; ���� ǥ���ϰ� �ִ� CGA ���� �������� 1 ����Ʈ�� �����ϰ� �ִ�.

active_page		equ	462h

; 18.2Hz Ŭ�� ���ͷ�Ʈ�� �߻��� ������ 1�� �����Ѵ�. 32��Ʈ �������̴�.

time_tick			equ	46ch

segment			code

; �ǽð� �ð� ���α׷� ���� �κ��̴�.
; ������ ��20H'�� ����Ǿ� �ִ� ���� �̰����� �Űܳ��´�. ��, ������ 
; ���ͷ�Ʈ ���� ���α׷� ���� �ּ��̴�.

intvect			resd	1	; original interrupt vector

; ������ Į�� �Ӽ��� �����ϰ� �ִ�.

attr1			db	attrampm		; AM/PM color attribute
attr2			db	attrhrmin		; hour/min color attribute
attr3			db	attrsec		; sec color attribute

; �ǽð� �ð� ���� ���α׷��̴�.

intserv:						; timer tick interrupt service

; ���ͷ�Ʈ ��ȣ�� CPU�� �����ϸ� ���ͷ�Ʈ�� ��Ȱ��ȭ��Ų��. ���ͷ�Ʈ�� ��
; �� �ð� ���� �Ҵ�ȭ�Ǿ� ������ ������� �����ȴ�. ���� ���ͷ�Ʈ�� Ȱ��
; ȭ���Ѽ� �ٸ� ������� �����ϰ� �ؾ� �Ѵ�.

			sti			; interrupt back on
			cld

; ���ͷ�Ʈ ���� ���α׷����� ����� �������͵��� ���ÿ� �����Ѵ�.

			push	eax		; push registers
			push	bx
			push	ecx
			push	edx
			push	di
			push	ds
			push	es

; DS�� ��0000���� �����ؼ� DS�� BIOS ������ �������Ѵ�. 

			xor	bx, bx		; DS points BIOS data
			mov	ds, bx

; ���� ��尡 2 �Ǵ� 3�ΰ��� �Ǵ��Ѵ�. ��, '25 X 80' CGA ��尡 
; �ƴϸ� �ð踦 ȭ�鿡 ǥ������ �ʴ´�.

			mov	al, [video_mode]		; check valid video mode
			cmp	al, 2			; process if mode 2 or 3
			je	proc_int
			cmp	al, 3			; exit_int
			jne	exit_int

proc_int:

; �ð踦 ǥ���� ���� ������ �޸� ������ ����Ͽ� ES:DI�� �����Ѵ�.

			mov	ax, 0b800h		; ES = CGA video frame buffer
			mov	es, ax
			mov	ah, [active_page]		; get active video page
			shl	ah, 4			; page * 1000H ==> AX
			add	ax, (clock_row * 80 + clock_col) * 2
			mov	di, ax			; ES:DI points CLOCK display area

; time_tick 32 ��Ʈ�� �о� �ͼ� �̸� 18.2�� ������ ���� �ð��� �ʴ�����
; ����Ѵ�. 18.2�� �������� �� �����Ƿ� time_tick�� 5�� �����ְ� �̸�
; 91�� ��������.

			mov	eax, [time_tick]		; convert time tick
			mov	ecx, 5			; tick * 5 / 91 = sec
			mul	ecx
			mov	cl, 91
			div	ecx			; EAX = second

; EAX�� �ʴ����� ���� �ð��� ����Ǿ� �����Ƿ� �̸� 60���� ������ ������
; �� ���̴�. ���� �ʴ��� �ð��� ���̴�. ���� �ٽ� 60���� ������ ��������
; ���̰�, ���� �ð��̴�.

			xor	edx, edx
			mov	cl, 60
			div	ecx
			mov	bh, dl			; BH = second, AX = min & hour
			div	cl			; AL = hour, AH = min

; ��, ��, �ʰ� �� ���������Ƿ� �̸� CGA ���� ������ �޸𸮿� �����Ѵ�.
; 80x86�� ��Ʋ ��������� AL�� ���� ������ AH�� ���� ������ ����ȴ�.

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

; ��� �۾��� �������Ƿ� ���ÿ� �����ߴ� �������͵��� �����Ѵ�.

exit_int:			; Goto original interrupt
			pop	es
			pop	ds
			pop	di
			pop	edx
			pop	ecx
			pop	bx
			pop	eax

; ������ ���ͷ�Ʈ ���� ���α׷����� ���Ÿ� ���� �б��Ѵ�.

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

; ��������� �޸𸮿� ������ �κ��̴�.

messg			db	'CLOCK already installed', 0dh, 0ah, '$'

; cclock.exe �������̴�.

..start:
			mov		ax, cs		; DS = CS
			mov		ds, ax

; �ǽð� �ð� ���α׷��� �̹� �����ؼ� ���� �������� �Ǵ��Ѵ�. �̹� ������ 
; �ִٸ� �޽����� ����ϰ� ���α׷��� �����Ѵ�.

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

; 20H(INT  8)�� ����Ǿ� �ִ� ������ ���ͷ�Ʈ ���� ���α׷��� ���� 
; ������ �о ��intvect 	resd 1���� �����ϰ�, 20H �������� �ǽð� �ð�
; ���� ���α׷� ������ ��intserv:���� �ڵ� ���׸�Ʈ�� �������� �����Ѵ�.

setime: 			xor	ax, ax		; DS points BIOS data
			mov	ds, ax

			cli			; redirect INT 8

; ���ͷ�Ʈ ���͸� �ٲٴ� ���߿� ���ͷ�Ʈ�� ������ ���� �����ϱ� ���ؼ�
; ���ͷ�Ʈ�� �Ҵ�ȭ��Ų��.

			mov	cx, intserv
			xchg	cx, [int8]
			mov	dx, cs
			xchg	dx, [int8 + 2]
			mov	[cs:intvect], cx
			mov	[cs:intvect + 2], dx
			sti

; ���ͷ�Ʈ ���� ���α׷��� ���ֽ�Ű�� ���α׷��� �����Ѵ�.

			mov	dx, messg + 15	; resident and exit to DOS
			mov	cl, 4
			shr	dx, cl
			mov	ax, 3100h
			int	21h
