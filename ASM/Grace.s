;
;comment1
;
SECTION .data
fmt    db    ";%1$c;comment1%1$c;%1$cSECTION .data%1$cfmt    db    %2$c%3$s%2$c, 0%1$cSECTION .text%1$cglobal _main%1$cextern	_printf%1$c_main:%1$cpush   rbp%1$ccall   _print%1$cxor    rax, rax%1$ccall   _printf%1$cpop    rbp%1$cret%1$c_print:%1$c;%1$c;comment2%1$c;%1$cmov    rdi, fmt%1$cmov    rsi, 10%1$cmov    rdx, 34%1$cmov    rcx, fmt%1$cret", 0

SECTION .text
global _main
extern	_printf
_main:
push   rbp
call   _print
xor    rax, rax
call   _printf
pop    rbp
ret
_print:
;
;comment2
;
mov    rdi, fmt
mov    rsi, 10
mov    rdx, 34
mov    rcx, fmt
ret

