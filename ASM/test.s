extern	_sprintf
extern	_system
extern	_getenv
extern	_strrchr
extern	_strcmp
extern	_strlen
extern	_fprintf
extern	_fopen
extern	_fclose
extern	_tolower
extern  _exit
SECTION .data
fmt           db  "", 0
lodash        db  "_", 0
mode          db  "w+", 0
progname      db  "/sully", 0
fmt_src       db  "Sully_%d.s", 0
fmt_exe       db  "Sully_%d", 0
fmt_cmd       db  "nasm -f macho64 %1$s && ld -macosx_version_min 10.8 -lSystem %2$s.o -o %2$s && ./%2$s", 0
src times 100 db 0
exe times 100 db 0
cmd times 300 db 0
extern _printf
fint db "i= %d", 10, 0
fstr db "i= %s", 10, 0
SECTION .bss
i   resq 1
SECTION   .text
global    _main
_main:
    enter 0, 0
    mov qword[rel i], 5
    cmp qword[rel i], 0
    jl ciao
    call getpgm
    leave
    ret
    
ciao:
    mov rdi, 0
    call _exit

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
getpgm:
    enter 16, 0
    lea rdi, [rel lodash]
    call _getenv
    mov [rsp+32], rax
    mov rdi, [rsp+32]
    mov rsi, 2Fh
    call _strrchr
    mov [rsp+32], rax
    mov r12, [rsp+32]
    call strtolower
    mov r12, rax
    lea rdi, [rel progname]
    mov rsi, r12
    call _strcmp
    cmp al, 0
    je mama
    dec qword[rel i]
mama:
    call build_strings
    call pgm
    leave
    ret
pgm:
    enter 16, 0
    lea rdi, [rel src]
    lea rsi, [rel mode]
    call _fopen
    mov qword[rsp+32], rax
    cmp rax, 0
    je ciao
    mov rdi, [rsp+32]
    lea rsi, [rel fmt]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel fmt]
    mov r9, qword[rel i]
    call _fprintf
    mov rdi, [rsp+32]
    call _fclose
    cmp qword[rel i], 0
    jle ciao
    lea rdi, [rel cmd]
    ;call _system
    lea rdi, [rel fstr]
    lea rsi, [rel progname]
    call _printf
    leave
    ret
strtolower:
    enter 0, 0
    mov rdi, r12
    call _strlen
    mov r13, rax
    mov r15, r12
for:
    dec r13
    mov rdi, 0
    mov dil, byte[r12]
    call _tolower
    mov byte[r12], al
    cmp r13, 0
    je end
    inc r12
    jmp for
end:
    mov rax, r15
    leave
    ret
