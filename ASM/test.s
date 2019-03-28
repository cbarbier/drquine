extern	_sprintf
extern	_system
extern	_getenv
extern	_strrchr
extern	_strcmp
extern	_strlen
extern	_fprintf
extern	_fopen
extern	_fclose

extern	_printf

SECTION .data
fmt           db  "mama", 10, 0
lodash        db  "_", 0
mode          db  "w+", 0
progname      db  "Osully", 0
fmt_src       db  "Sully_%d.s", 0
fmt_exe       db  "Sully_%d", 0
fmt_cmd       db  "nasm -f macho64 %1$s && ld -macosx_version_min 10.8 -lSystem %2$.o && ./%2$s", 0
fmt_test      db  "src = %s", 10, "exe = %s", 10, "cmd = %s", 10, 0
src times 100 db 0
exe times 100 db 0
cmd times 300 db 0

fmt_str       db "%s", 10, 0
fmt_int       db "%d", 10, 0
fmt_char       db "%c", 10, 0

SECTION .bss
i   resq 1

SECTION   .text
global    _main

_main:
    enter 16, 0
    mov qword[rel i], 5
    cmp qword[rel i], 0
    jle ciao
    call build_strings
    call put
    call print
    call getpgm
    call ciao

ciao:
    mov rax, 0x02000001
    mov rdi, 0
    syscall

build_strings:
    enter 0, 0
    lea rdi, [rel src]
    lea rsi, [rel fmt_src]
    mov rdx, [rel i]
    call _sprintf
    lea rdi, [rel exe]
    lea rsi, [rel fmt_exe]
    mov rdx, [rel i]
    call _sprintf
    lea rdi, [rel cmd]
    lea rsi, [rel fmt_cmd]
    lea rdx, [rel src]
    lea rcx, [rel exe]
    call _sprintf
    leave
    ret

put:                        ;
    enter 0, 0              ;
    lea rdi, [rel fmt_test] ;
    lea rsi, [rel src]      ;
    lea rdx, [rel exe]      ;
    lea rcx, [rel cmd]      ;
    call _printf            ;
    leave                   ;
    ret                     ;

print:
    enter 0, 0
    lea rdi, [rel fmt]
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel fmt]
    call _printf
    leave
    ret

getpgm:
    enter 16, 0
    lea rdi, [rel lodash]
    call _getenv
    mov [rbp+32], rax       ;
    lea rdi, [rel fmt_str]  ;
    mov rsi, [rbp+32]       ;
    call _printf
    mov rdi, [rbp+32]
    mov rsi, 2Fh
    call _strrchr
    mov [rbp+32], rax
    lea rdi, [rel fmt_str]  ;
    mov rsi, [rbp+32]       ;
    call _printf            ;
    mov r12, [rbp+32]
    call strtolower
    mov r12, rax
    lea rdi, [rel fmt_str]  ;
    mov rsi, r12                ;
    call _printf            ;
    lea rdi, [rel progname]
    mov rsi, r12                ;
    call _strcmp
    mov r12, rax
    lea rdi, [rel fmt_int]  ;
    mov rsi, rax
    call _printf            ;
    cmp r12, 0
    je next
    dec qword[rel i]
next:
    call pgm
    leave
    ret

pgm:
    enter 16, 0
    lea rdi, [rel src]
    lea rsi, [rel mode]
    call _fopen
    mov qword[rbp+32], rax
    cmp rax, 0
    je ciao
    mov rdi, [rbp+32]
    lea rsi, [rel fmt]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel fmt] 
    call _fprintf
    mov rdi, [rbp+32]
    call _fclose
    cmp qword[rel i], 0
    jle ciao
    lea rdi, [rel cmd]
    call _system
quit:
    leave
    ret

strtolower:
    enter 0, 0
    mov rdi, r12
    call _strlen
    mov r13, rax
    lea rdi, [rel fmt_int]  ;
    mov rsi, r13            ;
    call _printf            ;
    mov r15, r12
for:
    dec r13
    mov rdi, [r12]
    add byte[r12], 32
    cmp r13, 0
    je end
    inc r12
    jmp for
end:
    mov rax, r15
    leave
    ret