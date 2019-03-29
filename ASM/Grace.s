section .data
    fmt db "section .data%1$c    fmt db %2$c%3$s%2$c, 0%1$c    mode db %2$cw+%2$c, 0%1$c    file db %2$cGrace_kid.s%2$c, 0%1$c    %%DEFINE A 10%1$c    %%DEFINE B 34%1$c%%MACRO GRACE 1%1$csection .text%1$c    global _main%1$c    extern	_fprintf%1$c    extern	_fopen%1$c    extern	_fclose%1$c_main:%1$c    enter 16, 0%1$c    lea rdi, [rel file]%1$c    lea rsi, [rel mode]%1$c    call _fopen%1$c    mov rdi, rax%1$c    mov qword[rbp+32], rax%1$c    cmp rax, 0%1$c    je ciao%1$c    lea rsi, [rel fmt]%1$c    mov rdx, A%1$c    mov rcx, B%1$c    lea r8, [rel fmt] %1$c    call _fprintf%1$c    mov rdi, [rbp+32]%1$c    call _fclose%1$cciao:%1$c    leave%1$c    ret%1$c;%1$c;comment1%1$c;%1$c%%ENDMACRO%1$cGRACE(∆)", 0
    mode db "w+", 0
    file db "Grace_kid.s", 0
    %DEFINE A 10
    %DEFINE B 34
%MACRO GRACE 1
section .text
    global _main
    extern	_fprintf
    extern	_fopen
    extern	_fclose
_main:
    enter 16, 0
    lea rdi, [rel file]
    lea rsi, [rel mode]
    call _fopen
    mov rdi, rax
    mov qword[rbp+32], rax
    cmp rax, 0
    je ciao
    lea rsi, [rel fmt]
    mov rdx, A
    mov rcx, B
    lea r8, [rel fmt] 
    call _fprintf
    mov rdi, [rbp+32]
    call _fclose
ciao:
    leave
    ret
;
;comment1
;
%ENDMACRO
GRACE(∆)