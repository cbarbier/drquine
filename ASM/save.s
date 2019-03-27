SECTION .data
fmt      db  "arg passed = %d", 10, 0

global    _main
extern	_printf

SECTION   .text
_main:
push 42
push rbp
call print
call _printf
pop rbp
mov rax, 0x02000001
mov rdi, 0
syscall

print:
mov    rdi, fmt
mov rsi,  [rbp + 8]
xor rax, rax
ret



