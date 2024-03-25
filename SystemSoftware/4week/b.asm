segment stack      stack ; stack 영역
resw 256
tos:
segment data ; 데이터 세그먼트 시작점
prompt1 db ' input1 : $' ; 입력화면 설계
prompt2 db 0dh, 0ah, " output : $" ; 줄바꿈과 출력화면 설계
segment code ; 코드 세그먼트 시작점
..start: ; 프로그램 진입점
mov ax, data ; 프로그램 골격
mov ds, ax ; 프로그램 골격
mov es, ax ; 프로그램 골격
cld ; 프로그램 골격
cli ; 프로그램 골격
mov ax, stack ; 프로그램 골격
mov ss, ax ; 프로그램 골격
mov sp, tos ; 프로그램 골격
sti ; 프로그램 골격
mov ah, 09h ; 설계된 입력화면 출력을 위한 MS-DOS 기능
mov dx, prompt1  ; 문자열의 화면 출력을 위한 주소 셋팅
int 21h ; MS-DOS 호출
mov ah, 01h ; 한 문자를 키보드로부터 입력받는 기능
int 21h ; MS-DOS  호출
mov bl, al ; 키보드로부터 입력 받은 문자를 bl에 저장
mov ah, 09h
mov dx, prompt2
int 21h
mov ah, 02h ; 한 문자를 화면에 출력하기 위한 기능
mov dl, bl ; 출력할 문자를 dl에 저장
int 21h ; MS-DOS 호출
mov ax, 4c00h ; 프로그램 골격
int 21h ; 프로그램 골격
