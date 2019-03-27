SECTION .data

format: db "%d", 10, 0
SECTION .bss

SECTION .text

     extern _printf
     global _main
_main:
    call mama
    ret

mama:
mov rcx, 10
call for1
ret

for1:
push rcx
mov qword rdx, 0
mov rax, rcx
mov rdi, 2
idiv rdi
cmp rdx, 0
jz next
mov qword rdi, format
mov qword rsi, rcx
mov qword rax, 0
call _printf
next:
pop rcx
loop for1
ret