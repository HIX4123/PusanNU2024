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
outd:                	db	"    $"		; 정수값을 아스키 숫자 3자리 출력에 사용 
enter:		db	0ah, 0dh, "$"	

ind:        		db	3	; 10진수 최대 2자리 입력을 위한 메모리 버퍼3개 정의 
		db	0
		resb	3

arr		resw	361	; 19*19의 메모리 최대 용량 정의(출력을 위한 정수값 저장에 사용)
tarr		dw	1	; 1부터 입력된 수 제곱까지 저장을 위한 워드 메모리 정의
n		db	0	; 입력된 아스키 수를 정수로 변환 후 저장 메모리
dir		db	0	; 골뱅이 진행방향을 설정하는 flag변수 
				; 0 = j증가, 1 = i증가, 2 = j감소, 3 = i감소

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
		mov  	dx, enter		; 줄 바꿈
		int  	21h  
			
		call 	init		; 초기화 작업 함수 
		call 	input		; 정수를 입력 받는 함수 
    		call 	golbang		; 골뱅이 메모리 계산 함수
		call 	output		; 골뱅이 2차원 배열 출력	        

		mov  	ah, 9			
		mov  	dx, enter		; 줄 바꿈
		int  	21h                  

		mov  	ah, 9			
		mov  	dx, enter		; 줄 바꿈
		int  	21h                    
								
		mov  	dx, mess2		; 프롬프트3의 출력을 위한 주소 dx에 셋팅
    		mov  	ah, 9
		int  	21h

    		mov  	ah, 1		; 에코 없는 한 문자 입력을 위한 기능번호 ah에 셋팅         
    		int  	21h		; int 호출, 입력 받은 문자는 al에 저장됨 
                    
    		cmp  	al, 1bh		; pasue 함수에서 입력 받은 키가 ESC인지 검사
    		jne  	a10		; 키가 ESC 이면 종료 아니면 a10으로 이동
            
		mov  	ax, 4c00h		; 프로그램 종료 후 DOS로 제어를 넣김
		int  	21h

; 사용된 메모리를 초기화하는 함수, 프로그램이 종료되지 않고 다시 골뱅이 연산을
; 수행해야 하므로 반드시 메모리를 초기화 한 후 다시 프로그램을 수행해야 버그 없이
; 정상적으로 골뱅이 프로그램을 계산 할 수 있다.

init:	
		mov  	byte[dir], 0	; 방향 flag 0으로 초기화
		mov  	byte[n], 0		; 정수 값을 0으로 초기화
		mov  	byte[ind+1], 0	; 입력을 위한 메모리를 초기화
		mov  	word[tarr], 1
		mov  	cx, 4
		mov  	si, outd		; 출력을 위한 10진수 저장 메모리를 공백으로 초기화

b10:	
		mov  	[si], byte " "
		inc  	si			
		loop 	b10

		cld			; 왼쪽에서 오른쪽으로 진행방향 설정
		mov  	cx, 361		; arr배열을 0으로 초기화 시키기위해 361번 반복회수 cx에 셋팅
    		mov  	ax, 0		; arr배열을 0으로 초기화
		mov  	di, arr		; arr배열의 시작주소를 di에 셋팅
		rep  	stosw		; ax에 있는 0으로 메모리 arr배열을 361번 반복 저장
			
    		ret			; 호출된 곳으로 리턴

; 키보드로부터 문자열 입력을 받아(10진수 2자리로 최대 2~19까지) 이를 정수로 변환 후
; 메모리 n에 저장하는 함수
; 처리된 정수의 최종 결과는 bl에 저장, 문자열에서 문자를 입력받아 처리를 위해 cl 사용
; (((0 * 10) + d1) * 10) + d0 알고리즘으로 제일 앞자리 아스키 숫자부터 처리

input:					; 아스키 수를 입력받아 정수로 변환하는 함수
		mov  	ah, 9			
		mov  	dx, enter		; 줄 바꿈
		int  	21h

    		mov  	dx, mess1		; 출력할 문자열의 주소를 dx에 셋팅
    		int  	21h			
                    
    		mov  	ah, 10		; 키보드로부터 dx의 메모리에 아스키 수 입력
		mov  	dx, ind
		int  	21h

		xor  	bx, bx		; 정수결과를 bl에 저장하기 위한 0으로 bx 초기화
		mov  	si, ind+2		; 입력된 문자열 처리를 위한 si 시작주소 초기화

c10:	
		mov  	cl, [si]		; 
		inc  	si

		cmp  	cl, ' '		; 공백이면 다음 주소의 문자처리 
		je   	c10
		cmp  	cl, 9		; 탭이면 다음 주소의 문자처리 
		je   	c10
		cmp  	cl, 0dh		; 문자열의 끝이면(입력이 없으면) 다시 입력함수 시작 
		jne  	c30

c20:	
		mov  	ah, 9
		mov  	dx, mess3		; 입력에러 메시지를 출력
		int  	21h

		jmp  	input		; 입력 다시 수행

c30:	
		sub  	cl, '0'
		jb   	c20
		cmp  	cl, 9
		ja   	c20

		mov  	al, 10		; 10*bl + cl을 수행하므로 아스키 숫자를 정수로 변환
		mul  	bl
		add  	al, cl
		mov  	bl, al
		mov  	cl, [si]
		inc  	si			

		cmp  	cl, 0dh		; 문자열의 끝이면 정수변환 처리로 점프
		jne  	c30

		mov  	byte[n], bl	; 정수로 처리된 결과를 메모리(n)에 저장

		mov  	ah, 9			
		mov  	dx, enter		; 줄 바꿈
		int  	21h

		mov  	ah, 9			
		mov  	dx, enter		; 줄 바꿈
		int  	21h
           
		ret			; 호출된 곳으로 리턴

; 골뱅이를 1차원 메모리(최대 워드로 361까지)에 저장을 위한 계산을 수행하는 함수
; 2차원 배열의 값을 채울 때 방향을 설정하는 값으로 메모리 dir을 사용, 
; dir = 0(열(j) 증가), dir = 1(행(i) 증가), dir = 2(열(j) 감소), dir = 3(행(i) 감소)
; 행(i) = bl, 열(j) = dl, 2차원 배열의 범위를 검사하기 위한 low, high는 각각 di, bp사용
; 1차원 배열의 인덱스 주소는 si로 계산

golbang:	
		mov  	al, [n]
		mul  	al
		mov  	cx, ax		; 반복 횟수 cx에 저장
		xor  	bx, bx		; i = bx, j = dx 각각 0으로 셋팅
		xor  	dx, dx		; i = bx, j = dx 각각 0으로 셋팅 
		mov  	di, 0		; low를 di에 0으로 초기화
		mov  	al, [n]
		dec  	al
		movzx  	bp, al		; high를 bp에 n-1값으로 초기화
			
d10:	
		mov  	al, [n]
		mul  	bl
		add  	ax, dx			
		add  	ax, ax
		mov  	si, ax
		mov  	ax, [tarr]
		mov  	[arr+si], ax
		inc  	word[tarr]

		cmp  	byte[dir], 0	; j 증가 검사(dl)
		jne  	d20
		cmp  	dx, bp		; 열의 끝인지 검사
		je   	d100
		inc  	dx		; 열을 1증가
		jmp  	d20 

d100:	
		mov  	byte[dir], 1	; 열의 끝이면 dir을 1로 변경		

d20:	
		cmp  	byte[dir], 1	; i 증가 검사(bl)
		jne  	d30
		cmp  	bx, bp		; 행의 끝인지 검사
		je   	d200
		inc  	bx		; 행을 1증가
		jmp  	d30

d200:	
		mov  	byte[dir], 2	; 행의 끝이면 dir을 2로 변경	

d30:	
		cmp  	byte[dir], 2	; j 감소 검사(dl)
		jne  	d40
		cmp  	dx, di		; 열이 범위 내에 있는지 검사
		je   	d300
		dec  	dx		; 열을 1감소
		jmp  	d40

d300:	
		mov  	byte[dir], 3	; 열이 범위를 넘어면 dir을 3으로 변경

d40:	
		cmp  	byte[dir], 3	; i 감소 검사
		jne  	d50			
		mov  	ax, di			 
		inc  	ax
		cmp  	bx, ax		; i가 low+1과 같은지 검사
		je   	d400
		dec  	bx		; 행을 1감소
		jmp  	d50

d400:	
		mov  	byte[dir], 0	; dir을 0으로 변경
		inc  	di		; low를 1증가
		inc  	dx		; 열을 1증가
		dec  	bp		; high를 1 감소

d50:	
		loop 	d10

		ret			; 호출된 곳으로 리턴

; arr 배열에 있는 정수값을 출력 outd에 아스키 숫자로 변환 후 출력하는 함수
; 정수를 아스키 숫자로 변환 할 때 1자리에서 시작하는 것이 다른 알고리즘과 
; 다른점 임. 변환은 나누셈을 이용하여 무조건 10으로 나누어 나머지는 아스키
; 숫자로 변환하여 outd 메모리에 저장하고 몫은 다시 ax에 저장하여 0이 될 때까지
; 나누셈을 계속 수행. 그리고 한줄에 입력된 n만큼 출력 후 줄바꿈을 수행해서
; 2차원 배열 완성

output:     
		mov  	si, outd+3	; 출력 문자 메모리 주소 저장 1자리부터 10, 100자리 계산
		mov  	di, arr		; 출력할 메모리 주소 저장
		mov  	al, [n]
		mul  	byte[n]
		mov  	cx, ax		; 반복 출력할 횟수 cx에 저장
		mov  	bl, 10		; 10진수 출력값을 만들기 위해 10으로 나눌 수 bl에 저장
		mov  	bh, [n]		; 줄 바꿈을 위한 n값을 bh에 저장 bh가 0이 되면 줄바꿈 수행
			
e10:	
		mov  	ax, [di]

e20:	
		div  	bl		; 1자리수 ah에 저장 됨
		xor  	ah, 30h		; 아스키 숫자로 변환
		mov  	[si], ah		; 출력값 메모리에 저장
		dec  	si
		movzx  	ax, al
		cmp  	ax, 0
		jne  	e20

		cmp  	bh, 0
		jne  	e30

		mov  	ah, 9			
		mov  	dx, enter		; 줄 바꿈
		int  	21h   
		mov  	bh, [n]

e30:	
		mov  	ah, 9
		mov  	dx, outd		; 정수 값으로 변환된 아스키 문자열 출력
		int  	21h

		dec  	bh				 
		inc  	di
		inc  	di
		mov  	si, outd+3
		mov  	[outd], byte " "	; 출력 후 다음 출력을 위해 출력 메모리 
		mov  	[outd+1], byte " "	; 초기화 작업 수행
		mov  	[outd+2], byte " "
		mov  	[outd+3], byte " " 
		loop 	e10			

		ret			; 호출된 곳으로 리턴