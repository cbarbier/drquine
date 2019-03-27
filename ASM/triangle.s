SECTION .data
fmt      db  "arg passed = %d %d", 10, 0
%DEFINE A 10
%DEFINE B 34
%MACRO  C 1
         _main:
            enter %1, 0
            mov qword[rbp+16], A
            mov qword[rbp+24], B
            call print
            leave
            ret
%ENDMACRO

global    _main
extern	_printf

SECTION   .text

C 16

print:
enter 0,0
mov rdi, fmt
mov rsi,  [rbp + 48]
mov rdx,  [rbp + 56]
xor rax, rax
call _printf
leave
ret