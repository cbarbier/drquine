;
;comment1
;
SECTION .data
filename db "Grace_kid.s", 0
mode     db "w+", 0
txt     db "mama it works %u", 0
error_mess   db "eroor", 10, 0

SECTION .text
global _main
extern	_dprintf

_main:
enter 0, 0
mov rax, 0x02000005 ;open
mov rdi, filename
mov rsi, 202h
mov rdx, 3ffh
syscall
;cmp rax, 0
;jl error
mov rdi, 1 ; _dprintf
mov rsi, txt
mov rdx, 42
mov rax, rax
call _dprintf
mov r11, rax
call exit

exit:
mov rax, 0x02000001 ;exit
mov rdi, r11
syscall

error:
mov rax, 0x02000004 ;write
mov rdi, 1
mov rsi, error_mess
mov rdx, 6
syscall
call exit