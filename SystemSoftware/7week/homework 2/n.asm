CR equ 0dh
LF equ 0ah

segment stack stack
resw 512

tos:
segment data

message1 db "Enter a Number lower than 26656: $"
message2 db "The number is: $"
errorMessage db "Invalid Number! $"

CRLF db CR, LF, '$'

linput db 6
db 0
resb 6


segment code

..start:
mov ax, data
mov ds, ax

cli

mov ax, stack
mov ss, ax
mov sp, tos

sti

start:
; print(message1)
mov dx, message1
mov ah, 09h
int 21h

; input(linput)
mov dx, linput
mov ah, 0ah
int 21h

; print(CRLF)
mov dx, CRLF
mov ah, 09h
int 21h

; bp = 0, di = 0
xor bp, bp
xor di, di

; *si = linput + 2
mov si, linput + 2

skipWhites:
; next character
mov al, [si] ; al = *si
inc si       ; si++

; if al == ' ' goto skipWhites
cmp al, ' '
je skipWhites

; if al == 09h goto skipWhites
cmp al, 09h
je skipWhites

stoi:
; if al == CR goto print
cmp al, CR
je print

; if (al -= '0') < 0 goto throwError
sub al, '0'
jb throwError

; next character
mov al, [si] ; al = *si
inc si       ; si++

; continue to stoi
jmp stoi

throwError:
; print(errorMessage)
mov dx, errorMessage
mov ah, 09h
int 21h

; continue to start
jmp start

print:
; print(message2)
mov dx, message2
mov ah, 09h
int 21h

; print number
mov dx, linput + 2
mov ah, 09h
int 21h

; print(CRLF)
mov dx, CRLF
mov ah, 09h
int 21h

; continue to start
jmp start