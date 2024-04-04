	cr equ 0dh
	lf equ 0ah
	
	segment stack stack
	resw 512
tos:
	
	segment data
	mess1 db "Enter decimal number - - $"
	mess2 db "Converted hexa number - - $"
	errm db "Invalid input number"
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
	mov dx, mess1
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
	
sam1 :
	mov al, [si]
	inc si
	cmp al, ' '
	je sam1
	cmp al, 09h
	je sam1
	
sam2 :
	cmp al, cr
	je sam4
	
	sub al, '0'
	jb samerr
	
	cmp al, 09h
	jbe sam3
	
samerr :
	mov dx, errm
	mov ah, 09h
	int 21h
	jmp start
	
sam3 :
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
	jmp sam2
	
sam4 :
	mov ax, di
	or ax, bp
	jne sam5
	
	mov ax, 4c00h
	int 21h
	
sam5 :
	mov dx, mess2
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
