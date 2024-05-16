; 이 어셈블리 코드는 16비트 x86 아키텍처를 대상으로 작성되었습니다.
; 사용자로부터 10진수를 입력받아 16진수로 변환하는 프로그램입니다.

cr equ 0dh ; 캐리지 리턴 문자의 ASCII 코드
lf equ 0ah ; 개행 문자의 ASCII 코드

segment stack stack ; 스택 세그먼트 정의
resw 512 ; 스택 메모리 공간 할당

tos: ; 스택의 최상위 주소

segment data ; 데이터 세그먼트 정의
message1 db "Enter decimal number - - $" ; 사용자에게 10진수 입력을 요청하는 메시지
message2 db "Converted hexa number - - $" ; 16진수로 변환된 숫자를 출력하는 메시지
errorMessage db "Invalid input number" ; 잘못된 입력 숫자에 대한 오류 메시지
crlf db cr, lf, "$" ; 캐리지 리턴과 개행 문자를 포함한 문자열
linput db 80 ; 사용자 입력을 저장할 버퍼의 크기
db 0 ; 사용자 입력의 길이를 저장하는 변수
resb 80 ; 사용자 입력을 저장할 버퍼

segment code ; 코드 세그먼트 정의

..start: ; 프로그램 시작 지점
mov ax, data ; 데이터 세그먼트의 주소를 AX 레지스터에 저장
mov ds, ax ; DS 레지스터에 데이터 세그먼트 주소를 로드

cli ; 인터럽트 비활성화

mov ax, stack ; 스택 세그먼트의 주소를 AX 레지스터에 저장
mov ss, ax ; SS 레지스터에 스택 세그먼트 주소를 로드
mov sp, tos ; SP 레지스터에 스택의 최상위 주소를 로드

sti ; 인터럽트 활성화

start: ; 프로그램 시작

mov dx, message1 ; mess1의 주소를 DX 레지스터에 저장
mov ah, 09h ; 09h는 문자열 출력을 위한 인터럽트 서비스 번호
int 21h ; DX 레지스터에 저장된 문자열을 출력

mov dx, linput ; linput의 주소를 DX 레지스터에 저장
mov ah, 0ah ; 0ah는 키 입력을 위한 인터럽트 서비스 번호
int 21h ; 사용자로부터 키 입력을 받아 DX 레지스터에 저장

mov dx, crlf ; crlf의 주소를 DX 레지스터에 저장
mov ah, 09h ; 09h는 문자열 출력을 위한 인터럽트 서비스 번호
int 21h ; DX 레지스터에 저장된 문자열을 출력

xor bp, bp ; BP 레지스터를 0으로 초기화
xor di, di ; DI 레지스터를 0으로 초기화

mov si, linput + 2 ; linput + 2의 주소를 SI 레지스터에 저장

skipWhites: ; 입력된 문자열에서 공백 문자나 탭 문자를 건너뛰기 위한 루프
mov al, [si] ; SI 레지스터가 가리키는 주소의 값을 AL 레지스터에 저장
inc si ; SI 레지스터 증가
cmp al, ' ' ; AL 레지스터의 값과 공백 문자를 비교
je skipWhites ; 공백 문자일 경우 sam1로 점프
cmp al, 09h ; AL 레지스터의 값과 탭 문자를 비교
je skipWhites ; 탭 문자일 경우 sam1로 점프

stoi: ; 입력된 문자열을 10진수로 변환하는 루프
cmp al, cr ; AL 레지스터의 값과 캐리지 리턴 문자를 비교
je printHex1 ; 캐리지 리턴 문자일 경우 sam4로 점프

sub al, '0' ; AL 레지스터의 값을 '0'의 ASCII 코드 값으로 뺌
jb throwError ; AL 레지스터의 값이 '0'보다 작으면 samerr로 점프

cmp al, 09h ; AL 레지스터의 값과 '9'의 ASCII 코드 값을 비교
jbe itoh ; AL 레지스터의 값이 '9'보다 작거나 같으면 sam3으로 점프

throwError: ; 잘못된 입력 숫자에 대한 오류 처리
mov dx, errorMessage ; errm의 주소를 DX 레지스터에 저장
mov ah, 09h ; 09h는 문자열 출력을 위한 인터럽트 서비스 번호
int 21h ; DX 레지스터에 저장된 문자열을 출력
jmp start ; start로 점프하여 다시 입력을 받음

itoh: ; 10진수를 16진수로 변환하는 과정
add di, di ; DI 레지스터를 2배로 증가
adc bp, bp ; BP 레지스터를 2배로 증가

mov cx, di ; DI 레지스터의 값을 CX 레지스터에 저장
mov dx, bp ; BP 레지스터의 값을 DX 레지스터에 저장

add di, di ; DI 레지스터를 2배로 증가
adc bp, bp ; BP 레지스터를 2배로 증가
add di, di ; DI 레지스터를 2배로 증가
adc bp, bp ; BP 레지스터를 2배로 증가

add di, cx ; CX 레지스터의 값을 DI 레지스터에 더함
adc bp, dx ; DX 레지스터의 값을 BP 레지스터에 더함

xor ah, ah ; AH 레지스터를 0으로 초기화
add di, ax ; AX 레지스터의 값을 DI 레지스터에 더함
adc bp, 0 ; CF 플래그 값을 BP 레지스터에 더함

mov al, [si] ; SI 레지스터가 가리키는 주소의 값을 AL 레지스터에 저장
inc si ; SI 레지스터 증가
jmp stoi ; sam2로 점프하여 다음 문자를 처리

printHex1: ; 16진수로 변환된 숫자를 출력하는 과정
mov ax, di ; DI 레지스터의 값을 AX 레지스터에 저장
or ax, bp ; AX 레지스터와 BP 레지스터를 OR 연산하여 0인지 확인
jne printhex2 ; 0이 아니면 sam5로 점프

mov ax, 4c00h ; 프로그램 종료를 위한 인터럽트 서비스 번호
int 21h ; 인터럽트 호출

printhex2: ; 변환된 16진수를 출력
mov dx, message2 ; mess2의 주소를 DX 레지스터에 저장
mov ah, 09h ; 09h는 문자열 출력을 위한 인터럽트 서비스 번호
int 21h ; DX 레지스터에 저장된 문자열을 출력

xor bh, bh ; BH 레지스터를 0으로 초기화

mov ax, bp ; BP 레지스터의 값을 AX 레지스터에 저장
call ascii ; AX 레지스터의 값을 ASCII 코드로 변환하여 출력

mov ax, di ; DI 레지스터의 값을 AX 레지스터에 저장
call ascii ; AX 레지스터의 값을 ASCII 코드로 변환하여 출력

mov dx, crlf ; crlf의 주소를 DX 레지스터에 저장
mov ah, 09h ; 09h는 문자열 출력을 위한 인터럽트 서비스 번호
int 21h ; DX 레지스터에 저장된 문자열을 출력

jmp start ; start로 점프하여 다시 입력을 받음

ascii: ; 10진수를 ASCII 코드로 변환하는 서브루틴
push ax ; AX 레지스터를 스택에 저장
mov al, ah ; AH 레지스터의 값을 AL 레지스터에 복사
call asciib ; asciib 서브루틴 호출
pop ax ; 스택에서 AX 레지스터로 복원

asciib: ; 10진수를 ASCII 코드로 변환하는 서브루틴
push ax ; AX 레지스터를 스택에 저장
shr al, 4 ; AL 레지스터를 오른쪽으로 4비트 시프트
call asciin ; asciin 서브루틴 호출
pop ax ; 스택에서 AX 레지스터로 복원

asciin: ; 10진수를 ASCII 코드로 변환하는 서브루틴
and al, 0fh ; AL 레지스터와 0fh를 AND 연산하여 하위 4비트만 유지
or bh, al ; BH 레지스터와 AL 레지스터를 OR 연산하여 결과를 BH 레지스터에 저장
je ascii2 ; AL 레지스터가 0이면 ascii2로 점프

add al, 30h ; AL 레지스터에 30h를 더하여 ASCII 코드로 변환
cmp al, 3ah ; AL 레지스터의 값과 3ah를 비교
jb ascii1 ; AL 레지스터의 값이 3ah보다 작으면 ascii1로 점프
add al, 07h ; AL 레지스터에 07h를 더하여 ASCII 코드로 변환

ascii1: ; ASCII 코드를 출력
mov dl, al ; AL 레지스터의 값을 DL 레지스터에 저장
mov ah, 02h ; 02h는 문자 출력을 위한 인터럽트 서비스 번호
int 21h ; DL 레지스터에 저장된 문자를 출력

ascii2: ; 서브루틴 종료
ret
cr equ 0dh
lf equ 0ah

segment stack stack
resw 512
tos:

segment data
message1 db "Enter decimal number - - $"
message2 db "Converted hexa number - - $"
errorMessage db "Invalid input number"
crlf db cr, lf, "$"
linput db 80
db 0
resb 80

segment code
..start :
mov ax, data
mov ds, ax
cli

mov ax, stack
mov ss, ax
mov sp, tos
sti

start :
mov dx, message1
mov ah, 09h
int 21h

mov dx, linput
mov ah, 0ah
int 21h

mov dx, crlf
mov ah, 09h
int 21h

xor bp, bp
xor di, di

mov si, linput + 2

skipWhites :
mov al, [si]
inc si
cmp al, ' '
je skipWhites
cmp al, 09h
je skipWhites

stoi :
cmp al, cr
je printHex1

sub al, '0'
jb throwError

cmp al, 09h
jbe itoh

throwError :
mov dx, errorMessage
mov ah, 09h
int 21h
jmp start

itoh :
add di, di
adc bp, bp

mov cx, di
mov dx, bp

add di, di
adc bp, bp
add di, di
adc bp, bp

add di, cx
adc bp, dx

xor ah, ah
add di, ax
adc bp, 0

mov al, [si]
inc si
jmp stoi

printHex1 :
mov ax, di
or ax, bp
jne printhex2

mov ax, 4c00h
int 21h

printhex2 :
mov dx, message2
mov ah, 09h
int 21h

xor bh, bh

mov ax, bp
call ascii

mov ax, di
call ascii

mov dx, crlf
mov ah, 09h
int 21h
jmp start

ascii :
push ax
mov al, ah
call asciib
pop ax

asciib :
push ax
shr al, 4
call asciin
pop ax

asciin :
and al, 0fh
or bh, al
je ascii2

add al, 30h
cmp al, 3ah
jb ascii1
add al, 07h

ascii1 :
mov dl, al
mov ah, 02h
int 21h

ascii2 :
ret
