SECTION .data
fmt      db  "10 = %c 34 = %c", 10, 0
filename db  "Grace_kid.s", 0

global    _main
extern	_dprintf
extern	_printf

SECTION   .text
_main:
push rbp
call print
xor rax, rax
call _printf
pop rbp
call func
push rbp
call openwritefile
;xor rax, rax
;call _dprintf
pop rbp
mov rax, 0x02000001
mov rdi, 0
syscall

func:
mov rbp, rsp
sub rsp, 6
mov [rsp], byte'H'
mov [rsp+1], byte'i'
mov [rsp+2], dword 0x0a2a220b
mov rax, 0x02000004
mov rdi, 1
mov rsi, rsp
mov rdx, 6
syscall
mov rsp, rbp
ret

openwritefile:
mov rax, 0x02000005
mov rdi, filename
syscall
push rax
mov rax, 0x02000004
pop rdi
mov    rsi, fmt
mov    rdx, 10
syscall
ret

print:
mov    rdi, fmt
mov    rsi, 10
mov    rdx, 34
ret


