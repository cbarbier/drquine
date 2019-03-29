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
SECTION .data
fmt           db  "extern	_sprintf%1$cextern	_system%1$cextern	_getenv%1$cextern	_strrchr%1$cextern	_strcmp%1$cextern	_strlen%1$cextern	_fprintf%1$cextern	_fopen%1$cextern	_fclose%1$cextern	_tolower%1$cSECTION .data%1$cfmt           db  %2$c%3$s%2$c, 0%1$clodash        db  %2$c_%2$c, 0%1$cmode          db  %2$cw+%2$c, 0%1$cprogname      db  %2$c/sully%2$c, 0%1$cfmt_src       db  %2$cSully_%%d.s%2$c, 0%1$cfmt_exe       db  %2$cSully_%%d%2$c, 0%1$cfmt_cmd       db  %2$cnasm -f macho64 %%1$s && ld -macosx_version_min 10.8 -lSystem %%2$s.o -o %%2$s && ./%%2$s%2$c, 0%1$csrc times 100 db 0%1$cexe times 100 db 0%1$ccmd times 300 db 0%1$cSECTION .bss%1$ci   resq 1%1$cSECTION   .text%1$cglobal    _main%1$c_main:%1$c    enter 0, 0%1$c    mov qword[rel i], %4$d%1$c    cmp qword[rel i], 0%1$c    jl ciao%1$c    call getpgmname%1$c    call build_strings%1$c    call pgm%1$cciao:%1$c    leave%1$c    ret%1$c%1$cpgm:%1$c    enter 16, 0%1$c    lea rdi, [rel src]%1$c    lea rsi, [rel mode]%1$c    call _fopen%1$c    mov qword[rsp+32], rax%1$c    cmp rax, 0%1$c    je ciao%1$c    mov rdi, [rsp+32]%1$c    lea rsi, [rel fmt]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel fmt]%1$c    mov r9, qword[rel i]%1$c    call _fprintf%1$c    mov rdi, [rsp+32]%1$c    call _fclose%1$c    cmp qword[rel i], 0%1$c    jle ciao%1$c    lea rdi, [rel cmd]%1$c    call _system%1$c    leave%1$c    ret%1$c%1$cgetpgmname:%1$c    enter 16, 0%1$c    lea rdi, [rel lodash]%1$c    call _getenv%1$c    mov [rsp+32], rax%1$c    mov rdi, [rsp+32]%1$c    mov rsi, 2Fh%1$c    call _strrchr%1$c    mov [rsp+32], rax%1$c    mov r12, [rsp+32]%1$c    call strtolower%1$c    mov r12, rax%1$c    lea rdi, [rel progname]%1$c    mov rsi, r12%1$c    call _strcmp%1$c    cmp al, 0%1$c    je mama%1$c    dec qword[rel i]%1$cmama:%1$c    %1$c    leave%1$c    ret%1$c%1$cstrtolower:%1$c    enter 0, 0%1$c    mov rdi, r12%1$c    call _strlen%1$c    mov r13, rax%1$c    mov r15, r12%1$cfor:%1$c    dec r13%1$c    mov rdi, 0%1$c    mov dil, byte[r12]%1$c    call _tolower%1$c    mov byte[r12], al%1$c    cmp r13, 0%1$c    je end%1$c    inc r12%1$c    jmp for%1$cend:%1$c    mov rax, r15%1$c    leave%1$c    ret%1$c%1$cbuild_strings:%1$c    enter 0, 0%1$c    lea rdi, [rel src]%1$c    lea rsi, [rel fmt_src]%1$c    mov rdx, [rel i]%1$c    call _sprintf%1$c    lea rdi, [rel exe]%1$c    lea rsi, [rel fmt_exe]%1$c    mov rdx, [rel i]%1$c    call _sprintf%1$c    lea rdi, [rel cmd]%1$c    lea rsi, [rel fmt_cmd]%1$c    lea rdx, [rel src]%1$c    lea rcx, [rel exe]%1$c    call _sprintf%1$c    leave%1$c    ret", 0
lodash        db  "_", 0
mode          db  "w+", 0
progname      db  "/sully", 0
fmt_src       db  "Sully_%d.s", 0
fmt_exe       db  "Sully_%d", 0
fmt_cmd       db  "nasm -f macho64 %1$s && ld -macosx_version_min 10.8 -lSystem %2$s.o -o %2$s && ./%2$s", 0
src times 100 db 0
exe times 100 db 0
cmd times 300 db 0
SECTION .bss
i   resq 1
SECTION   .text
global    _main
_main:
    enter 0, 0
    mov qword[rel i], 5
    cmp qword[rel i], 0
    jl ciao
    call getpgmname
    call build_strings
    call pgm
ciao:
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
    call _system
    leave
    ret

getpgmname:
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