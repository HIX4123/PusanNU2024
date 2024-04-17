; int i, j, k, n, dir = 0;
; int box[361] = {0,}; 
; int low = 0;
; int high = n-1;
; i = 0;
; j = 0;
; for(k = 1; k <= n*n; k++)
; {
;    box[i][j] = k;
;    if(dir == 0)
;    {
;       if(j == high)
;           dir = 1;
;       else
;           j++;
;    }
;    if(dir == 1)
;    {
;       if(i == high)
;           dir = 2;
;       else
;           i++;
;    }
;    if(dir == 2)
;    {
;       if(j == low)
;           dir = 3;
;       else
;           j--;
;    }
;    if(dir == 3)
;    {
;       if(j == (low+1))
;		{
;           dir = 0;
;           low++;
;           j++;
;           high--;
;       }
;       else
;           i--;
;    }
; }

segment 		stack  	stack
		resw	512
tos:
segment 		data			
mess1:		db	" Input  : $"
mess2:		db	" Press any key to continue or Esc to quit $"
mess3:		db  	" Command Error !$"
outd:                	db	"    $"		; �������� �ƽ�Ű ���� 3�ڸ� ��¿� ��� 
enter:		db	0ah, 0dh, "$"	

ind:        		db	3	; 10���� �ִ� 2�ڸ� �Է��� ���� �޸� ����3�� ���� 
		db	0
		resb	3

arr		resw	361	; 19*19�� �޸� �ִ� �뷮 ����(����� ���� ������ ���忡 ���)
tarr		dw	1	; 1���� �Էµ� �� �������� ������ ���� ���� �޸� ����
n		db	0	; �Էµ� �ƽ�Ű ���� ������ ��ȯ �� ���� �޸�
dir		db	0	; ����� ��������� �����ϴ� flag���� 
				; 0 = j����, 1 = i����, 2 = j����, 3 = i����

segment 		code
..start:
		mov  	ax, data
		mov  	ds, ax
		mov  	es, ax
		cli
		mov  	ax, stack
		mov  	ss, ax
		mov  	sp, tos
		sti

a10:        
		mov  	ah, 9			
		mov  	dx, enter		; �� �ٲ�
		int  	21h  
			
		call 	init		; �ʱ�ȭ �۾� �Լ� 
		call 	input		; ������ �Է� �޴� �Լ� 
    		call 	golbang		; ����� �޸� ��� �Լ�
		call 	output		; ����� 2���� �迭 ���	        

		mov  	ah, 9			
		mov  	dx, enter		; �� �ٲ�
		int  	21h                  

		mov  	ah, 9			
		mov  	dx, enter		; �� �ٲ�
		int  	21h                    
								
		mov  	dx, mess2		; ������Ʈ3�� ����� ���� �ּ� dx�� ����
    		mov  	ah, 9
		int  	21h

    		mov  	ah, 1		; ���� ���� �� ���� �Է��� ���� ��ɹ�ȣ ah�� ����         
    		int  	21h		; int ȣ��, �Է� ���� ���ڴ� al�� ����� 
                    
    		cmp  	al, 1bh		; pasue �Լ����� �Է� ���� Ű�� ESC���� �˻�
    		jne  	a10		; Ű�� ESC �̸� ���� �ƴϸ� a10���� �̵�
            
		mov  	ax, 4c00h		; ���α׷� ���� �� DOS�� ��� �ֱ�
		int  	21h

; ���� �޸𸮸� �ʱ�ȭ�ϴ� �Լ�, ���α׷��� ������� �ʰ� �ٽ� ����� ������
; �����ؾ� �ϹǷ� �ݵ�� �޸𸮸� �ʱ�ȭ �� �� �ٽ� ���α׷��� �����ؾ� ���� ����
; ���������� ����� ���α׷��� ��� �� �� �ִ�.

init:	
		mov  	byte[dir], 0	; ���� flag 0���� �ʱ�ȭ
		mov  	byte[n], 0		; ���� ���� 0���� �ʱ�ȭ
		mov  	byte[ind+1], 0	; �Է��� ���� �޸𸮸� �ʱ�ȭ
		mov  	word[tarr], 1
		mov  	cx, 4
		mov  	si, outd		; ����� ���� 10���� ���� �޸𸮸� �������� �ʱ�ȭ

b10:	
		mov  	[si], byte " "
		inc  	si			
		loop 	b10

		cld			; ���ʿ��� ���������� ������� ����
		mov  	cx, 361		; arr�迭�� 0���� �ʱ�ȭ ��Ű������ 361�� �ݺ�ȸ�� cx�� ����
    		mov  	ax, 0		; arr�迭�� 0���� �ʱ�ȭ
		mov  	di, arr		; arr�迭�� �����ּҸ� di�� ����
		rep  	stosw		; ax�� �ִ� 0���� �޸� arr�迭�� 361�� �ݺ� ����
			
    		ret			; ȣ��� ������ ����

; Ű����κ��� ���ڿ� �Է��� �޾�(10���� 2�ڸ��� �ִ� 2~19����) �̸� ������ ��ȯ ��
; �޸� n�� �����ϴ� �Լ�
; ó���� ������ ���� ����� bl�� ����, ���ڿ����� ���ڸ� �Է¹޾� ó���� ���� cl ���
; (((0 * 10) + d1) * 10) + d0 �˰������� ���� ���ڸ� �ƽ�Ű ���ں��� ó��

input:					; �ƽ�Ű ���� �Է¹޾� ������ ��ȯ�ϴ� �Լ�
		mov  	ah, 9			
		mov  	dx, enter		; �� �ٲ�
		int  	21h

    		mov  	dx, mess1		; ����� ���ڿ��� �ּҸ� dx�� ����
    		int  	21h			
                    
    		mov  	ah, 10		; Ű����κ��� dx�� �޸𸮿� �ƽ�Ű �� �Է�
		mov  	dx, ind
		int  	21h

		xor  	bx, bx		; ��������� bl�� �����ϱ� ���� 0���� bx �ʱ�ȭ
		mov  	si, ind+2		; �Էµ� ���ڿ� ó���� ���� si �����ּ� �ʱ�ȭ

c10:	
		mov  	cl, [si]		; 
		inc  	si

		cmp  	cl, ' '		; �����̸� ���� �ּ��� ����ó�� 
		je   	c10
		cmp  	cl, 9		; ���̸� ���� �ּ��� ����ó�� 
		je   	c10
		cmp  	cl, 0dh		; ���ڿ��� ���̸�(�Է��� ������) �ٽ� �Է��Լ� ���� 
		jne  	c30

c20:	
		mov  	ah, 9
		mov  	dx, mess3		; �Է¿��� �޽����� ���
		int  	21h

		jmp  	input		; �Է� �ٽ� ����

c30:	
		sub  	cl, '0'
		jb   	c20
		cmp  	cl, 9
		ja   	c20

		mov  	al, 10		; 10*bl + cl�� �����ϹǷ� �ƽ�Ű ���ڸ� ������ ��ȯ
		mul  	bl
		add  	al, cl
		mov  	bl, al
		mov  	cl, [si]
		inc  	si			

		cmp  	cl, 0dh		; ���ڿ��� ���̸� ������ȯ ó���� ����
		jne  	c30

		mov  	byte[n], bl	; ������ ó���� ����� �޸�(n)�� ����

		mov  	ah, 9			
		mov  	dx, enter		; �� �ٲ�
		int  	21h

		mov  	ah, 9			
		mov  	dx, enter		; �� �ٲ�
		int  	21h
           
		ret			; ȣ��� ������ ����

; ����̸� 1���� �޸�(�ִ� ����� 361����)�� ������ ���� ����� �����ϴ� �Լ�
; 2���� �迭�� ���� ä�� �� ������ �����ϴ� ������ �޸� dir�� ���, 
; dir = 0(��(j) ����), dir = 1(��(i) ����), dir = 2(��(j) ����), dir = 3(��(i) ����)
; ��(i) = bl, ��(j) = dl, 2���� �迭�� ������ �˻��ϱ� ���� low, high�� ���� di, bp���
; 1���� �迭�� �ε��� �ּҴ� si�� ���

golbang:	
		mov  	al, [n]
		mul  	al
		mov  	cx, ax		; �ݺ� Ƚ�� cx�� ����
		xor  	bx, bx		; i = bx, j = dx ���� 0���� ����
		xor  	dx, dx		; i = bx, j = dx ���� 0���� ���� 
		mov  	di, 0		; low�� di�� 0���� �ʱ�ȭ
		mov  	al, [n]
		dec  	al
		movzx  	bp, al		; high�� bp�� n-1������ �ʱ�ȭ
			
d10:	
		mov  	al, [n]
		mul  	bl
		add  	ax, dx			
		add  	ax, ax
		mov  	si, ax
		mov  	ax, [tarr]
		mov  	[arr+si], ax
		inc  	word[tarr]

		cmp  	byte[dir], 0	; j ���� �˻�(dl)
		jne  	d20
		cmp  	dx, bp		; ���� ������ �˻�
		je   	d100
		inc  	dx		; ���� 1����
		jmp  	d20 

d100:	
		mov  	byte[dir], 1	; ���� ���̸� dir�� 1�� ����		

d20:	
		cmp  	byte[dir], 1	; i ���� �˻�(bl)
		jne  	d30
		cmp  	bx, bp		; ���� ������ �˻�
		je   	d200
		inc  	bx		; ���� 1����
		jmp  	d30

d200:	
		mov  	byte[dir], 2	; ���� ���̸� dir�� 2�� ����	

d30:	
		cmp  	byte[dir], 2	; j ���� �˻�(dl)
		jne  	d40
		cmp  	dx, di		; ���� ���� ���� �ִ��� �˻�
		je   	d300
		dec  	dx		; ���� 1����
		jmp  	d40

d300:	
		mov  	byte[dir], 3	; ���� ������ �Ѿ�� dir�� 3���� ����

d40:	
		cmp  	byte[dir], 3	; i ���� �˻�
		jne  	d50			
		mov  	ax, di			 
		inc  	ax
		cmp  	bx, ax		; i�� low+1�� ������ �˻�
		je   	d400
		dec  	bx		; ���� 1����
		jmp  	d50

d400:	
		mov  	byte[dir], 0	; dir�� 0���� ����
		inc  	di		; low�� 1����
		inc  	dx		; ���� 1����
		dec  	bp		; high�� 1 ����

d50:	
		loop 	d10

		ret			; ȣ��� ������ ����

; arr �迭�� �ִ� �������� ��� outd�� �ƽ�Ű ���ڷ� ��ȯ �� ����ϴ� �Լ�
; ������ �ƽ�Ű ���ڷ� ��ȯ �� �� 1�ڸ����� �����ϴ� ���� �ٸ� �˰���� 
; �ٸ��� ��. ��ȯ�� �������� �̿��Ͽ� ������ 10���� ������ �������� �ƽ�Ű
; ���ڷ� ��ȯ�Ͽ� outd �޸𸮿� �����ϰ� ���� �ٽ� ax�� �����Ͽ� 0�� �� ������
; �������� ��� ����. �׸��� ���ٿ� �Էµ� n��ŭ ��� �� �ٹٲ��� �����ؼ�
; 2���� �迭 �ϼ�

output:     
		mov  	si, outd+3	; ��� ���� �޸� �ּ� ���� 1�ڸ����� 10, 100�ڸ� ���
		mov  	di, arr		; ����� �޸� �ּ� ����
		mov  	al, [n]
		mul  	byte[n]
		mov  	cx, ax		; �ݺ� ����� Ƚ�� cx�� ����
		mov  	bl, 10		; 10���� ��°��� ����� ���� 10���� ���� �� bl�� ����
		mov  	bh, [n]		; �� �ٲ��� ���� n���� bh�� ���� bh�� 0�� �Ǹ� �ٹٲ� ����
			
e10:	
		mov  	ax, [di]

e20:	
		div  	bl		; 1�ڸ��� ah�� ���� ��
		xor  	ah, 30h		; �ƽ�Ű ���ڷ� ��ȯ
		mov  	[si], ah		; ��°� �޸𸮿� ����
		dec  	si
		movzx  	ax, al
		cmp  	ax, 0
		jne  	e20

		cmp  	bh, 0
		jne  	e30

		mov  	ah, 9			
		mov  	dx, enter		; �� �ٲ�
		int  	21h   
		mov  	bh, [n]

e30:	
		mov  	ah, 9
		mov  	dx, outd		; ���� ������ ��ȯ�� �ƽ�Ű ���ڿ� ���
		int  	21h

		dec  	bh				 
		inc  	di
		inc  	di
		mov  	si, outd+3
		mov  	[outd], byte " "	; ��� �� ���� ����� ���� ��� �޸� 
		mov  	[outd+1], byte " "	; �ʱ�ȭ �۾� ����
		mov  	[outd+2], byte " "
		mov  	[outd+3], byte " " 
		loop 	e10			

		ret			; ȣ��� ������ ����