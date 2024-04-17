%include 		"dosdef.txt"	; include MSDOS definition file

; clparse�� prtdate�� �� ���α׷��� ������ ��ũ�ÿ� �ٸ� ���α׷� �Ǵ�
; ���̺귯������ ��ũ�� �ȴٴ� ���� ��Ÿ���� ���ؼ� extern���� �����Ѵ�.
; �ܺ� ������ code ���׸�Ʈ �������� ����� ���̹Ƿ� code ���׸�Ʈ����
; extern ������ �־�� �Ѵ�.

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

; ���� ������ ���̺�� �ۼ��Ѵ�. ������ ��쿡�� 2���� ������ 29�� ������
; ��,

max_date		db	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

; �� ���� �ִ� 6���̴�. �޷��� �����ϱ� ���� �����̴�.

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

; �޷� ���۸� ��0������ �ʱ�ȭ�Ѵ�.

		mov	bx, date_buf	; clear date buffer
		xor	ax, ax
		mov	cx, 21
clr1:		mov	[bx], ax
		inc	bx
		inc	bx
		loop	clr1

; �ڸǵ� ������ �Ľ��ؼ� �⵵(year)�� �Է��Ѵ�.

		mov	si, cmdline	; SI to command line
		call	clparse		; Parse command line into AX
		jnb	putyear

; ���ڰ� �ԷµǾ����� �⵵�� �ν��ϰ� 'putyear'�� �б��ϸ�, Ư�� ���ڰ�
;  �Է� �Ǿ����� ���� �޽����� ����ϰ� ���α׷��� �����Ѵ�.

errt1:		prints	errm1		; error in command line
		msdos	exit_dos

; �Էµ� �⵵�� 10,000�� �̸��̸� 'okyear'�� �б��ϰ�, �׷��� ������ 
; ���� �޽����� ����ϰ� ���α׷��� �����Ѵ�.

putyear: 		cmp	ax, 10000		; check year boundary
		jc	okyear

errt2:		prints	errm2		; error in year/month
		msdos	exit_dos

; �⵵�� BP �������Ϳ� �����ϰ�, ��0�����̸� ���� ó�� �κ����� �б��Ѵ�. 

okyear: 		mov	bp, ax		; BP is year
		or	ax, ax		; year is 0
		je	errt2

; ��/�� ���� �Է��� Ȯ���ϱ� ���Ͽ� ��clparse���� ȣ���Ѵ�.

		call	clparse		; Parse command line into AX
		jnb	errt1
		cmp	al, '/'		; Must be /
		jne	errt1

; ��clparse���� ȣ���Ͽ� ��(month) �Է��� �Ľ��Ѵ�. 

		call	clparse
		jb	errt1

; �Էµ� ��(month)�� 1-12 �������� �����Ѵ�. �ùٸ� ��(month)�� �Է�
; �Ǿ����� ��(month)�� DI �������Ϳ� �����Ѵ�.

		or	ax, ax		; check month boundary
		je	errt2
		cmp	ax, 13
		jnc	errt2
		mov	di, ax		; DI is month

; �⵵(year)�� 1�� 1���� ���ϼ��� ����Ͽ� SI �������Ϳ� �����Ѵ�. 1��
;���� year���� ����� �ؼ��� 'year-1'�̴�. 

		mov	si, bp		; calculate week of year.1.1
		dec	si

; year���� ���Ե� ������ ���� ��(year-1) / 4���̴�. 4�� ������ ���� 
; ���������� 2��Ʈ �̵���Ű�� ���̴�.  ��(year-1) + (year-1)/4���� ���
; �ϸ� 4�⸶�� ������ ������ �����Ͽ� year�� 1�� 1���� ���ϼ��� ���
; �ȴ�.

		mov	ax, si		; SI = year-1
		shr	ax, 2
		add	si, ax		; SI = (year-1) + (year-1)/4

; 100���� ���������� �ش� ������ �ƴϹǷ� �̸� ���� ���ϼ����� �����־��
; �Ѵ�. AX�� '(year-1)/4'�� ����Ǿ� �����Ƿ� �̸� 25�� �������ش�.

		mov	cl, 25
		div	cl		; AX = (year-1)/100
		xor	ah, ah
		sub	si, ax		; AX = (year-1)+(year-1)/4-(year-1)/100

; 400���� ���������� �ش� �����̹Ƿ� �̸� �ٽ� �����ش�. AX����
; '(year-1)/100'�� ����Ǿ� �����Ƿ� �̸� ���������� 2��Ʈ �̵���Ű��
; 400���� ���� ���� ��������.

		shr	ax, 2		; AX = (year-1)/4
		add	si, ax		

;   SI = (year-1)+(year-1)/4-(year-1)/100+(year-1)/400

; SI���� 1�� 1�� 1�Ϻ��� ������ ���ϼ��� ����Ǿ� �ִ�. 1�� 1�� 1���� 
; ���ϼ��� ��1���̹Ƿ� SI�� ��1���� ���ϸ� year�� 1�� 1���� ���ϼ��� 
; ��������.

		inc	si		; 1.1.1 is monday

; ������ �����Ѵ�. year�� 2������ ����Ǿ� �����Ƿ� ���� 2��Ʈ�� ��00��
; �̸� 4�� ���������� ���̴�. �̸� �Ǵ��ϱ� ���ؼ� 3(11b)�� AND���Ѻ���.
; �� ��� zero�� �ƴϸ� 4�� ���������� �����Ƿ� ����̴�.

		mov	ax, bp		; check for leap year
		test	al, 3
		jne	plainy		; If year mod 4 is not 0

; 4�� ���������� 100���� ������������ �Ǵ��Ѵ�. �̴� 100���� ����� 
; �������� �ִ��� Ȯ���Ѵ�.

		mov	cl, 100
		div	cl
		or	ah, ah
		jne	leapy		; If year mod 100 is not 0

; 100���� ���������� 400���� ������������ �Ǵ��Ѵ�. AL���� 100���� ����
; ���� ����Ǿ� �����Ƿ� AL�� ���� 2��Ʈ�� ��00�������� �Ǵ��Ѵ�. 

		and	al, 3
		jne	plainy		; if year mod 400 is not 0

; �����̸� 2���� ������ ��1��������Ų��.

leapy:		inc	byte [max_date + 1]

; year�� month�� 1���� ���ϼ��� ����Ѵ�. month�� DI�� ����Ǿ� 
; �����Ƿ� ���� ���̺��� ��DI - 1�������� ������ year�� 1�� 1���� 
; ���ϼ��� ���Ѵ�.

plainy:		mov	ax, si		; Get week of year.month.1
		mov	si, max_date
		xor	bh, bh
monloop:
		dec	di
		je	prtcal

; ���ϼ��� 16��Ʈ�� AX�� ����Ǿ� �ְ�, ���̺��� ������ 8��Ʈ�̹Ƿ� �̸�
; AL�� ���ϰ�, �ڸ��ø���(CY)�� AH�� ���Ѵ�.

		add	al, [si]
		adc	ah, 0
		inc	si
		jmp	monloop

; ���ϼ��� 7�� ����� �������� ���ϸ� year�� month�� 1���� ���ϼ��� ��
; ������. 16��Ʈ ������ 8��Ʈ ��ɾ�� ���� 8��Ʈ�� �Ѿ�� ������ �߻�
; �Ѵ�. ���� �߻��� ���� ���ؼ� 32��Ʈ ������ 16��Ʈ ��ɾ ����Ѵ�.
; ���� ���ϼ��� BX�� �����Ѵ�. 

prtcal:		xor	dx, dx
		mov	cx, 7
		div	cx
		mov	bx, dx

; year�� month�� 1���� ���ϼ����� �� ���� ���������� �޷� ���ۿ� ����
; �ϸ� �޷��� �ϼ��ȴ�. ����� ���ϱ� �ϱ� ���Ͽ� ������ BCD�� �����Ѵ�.

		mov	cl, [si] 		; DL last date of month
		mov	al, 1
putdate: 		mov	[date_buf + bx], al
		inc	bx
		add	al, 1
		daa
		loop	putdate

; �޷��� �ϼ��Ǿ����Ƿ� ȭ�鿡 ����Ѵ�.

		prints	headm

		mov	si, date_buf

; 6�� 7���� ī���͸� BH�� BL�� �����Ѵ�.

		mov	bx, 607h
putloop: 		lodsb
		call	prtdate
		dec	bl
		jne	putloop

; �� �ָ� ����ϸ� �� �ٲٱ⸦ �Ѵ�.

		prints	crlf
		mov	bl, 7
		dec	bh
		jne	putloop

		msdos	exit_dos
