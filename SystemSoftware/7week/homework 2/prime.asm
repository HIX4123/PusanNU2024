section .data
  input_msg db "Enter a number: ", 0
  output_msg db "The largest prime number smaller than the input is: ", 0

section .bss
  input resb 2  

section .text
  global _start

_start:
  ; Display input message
  mov eax, 4
  mov ebx, 1
  mov ecx, input_msg
  mov edx, 17
  int 0x80

  ; Read input number
  mov eax, 3
  mov ebx, 0
  mov ecx, input
  mov edx, 2
  int 0x80

  ; Convert input to integer
  movzx eax, byte [input]
  sub eax, '0'

  ; Find the largest prime number smaller than the input
  dec eax
  mov ebx, eax

check_prime:
  mov ecx, 2
  cmp ecx, ebx
  jg print_result

  mov edx, 0
  div ecx
  cmp edx, 0
  je not_prime

  inc ecx
  jmp check_prime

not_prime:
  dec ebx
  jmp check_prime

print_result:
  ; Display output message
  mov eax, 4
  mov ebx, 1
  mov ecx, output_msg
  mov edx, 43
  int 0x80

  ; Convert result to string
  add ebx, '0'
  mov byte [input], bl

  ; Display result
  mov eax, 4
  mov ebx, 1
  mov ecx, input
  mov edx, 1
  int 0x80

exit:
  ; Exit the program
  mov eax, 1
  xor ebx, ebx
  int 0x80