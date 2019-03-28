extern	_sprintf
extern	_printf
extern	_system
extern	_getenv
extern	_strrchr
extern	_strcmp
extern	_tolower

SECTION .data
fmt           db  "file...", 10, 0
lodash        db  "_", 0
progname      db  "/sully", 0
fmt_src       db  "Sully_%d.s", 0
fmt_exe       db  "Sully_%d", 0
fmt_cmd       db  "nasm -f macho64 %1$s && ld -macosx_version_min 10.8 -lSystem %2$.o && ./%2$s", 0
fmt_test      db  "src = %s", 10, "exe = %s", 10, "cmd = %s", 10, 0
src times 100 db 0
exe times 100 db 0
cmd times 300 db 0

fmt_str       db "%s", 10, 0
fmt_int       db "%d", 10, 0

SECTION .bss
i   resq 1

SECTION   .text
global    _main

_main:
    enter 0, 0
    mov qword[rel i], 5
    call build_strings
    call put
    call print
    call getpgm
    leave
    ret

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
    call strtolower
    lea rdi, [rel progname]
    mov rsi, [rbp+32]
    call _strcmp
    lea rdi, [rel fmt_int]  ;
    mov rsi, rax            ;
    call _printf            ;
    
    leave
    ret

    strtolower:
        enter 0, 0

        leave
        ret
