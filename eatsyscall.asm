        ;;  Executable name : EASTSYSCALL
        ;;  Version : 1.0
        ;;  Description : A simple assembly app for linux, using NASM
        ;;  demonstrating the use of Linux INT 80H syscalls to display text
        ;;  Compile with: nasm -f elf -g -F stabs eatsyscall.asm
        ;;  ld -o eatsyscall eatsyscall.o (optional -m elf_i386 on 64-bit machines)

        SECTION .data           ; Section containing initialized data

EatMsg: db "Eat at Joe's!",10
EatLen: equ $-EatMsg

        Section .bss            ; Section containing uninitialized data

        Section .text           ; Section containing code

        global _start           ; Linker needs this to find the entry point!

_start:
        nop                      ; This no-op keeps gdb happy
        mov eax, 4               ; Specify sys_write syscall
        mov ebx, 1               ; Specify file descriptor 1: Standard Output
        mov ecx, EatMsg          ; Pass offset of the message
        mov edx, EatLen          ; Pass the length of the message
        int 80H                  ; Make syscall to output the text to stdout
        mov eax, 1               ; Specify Exit syscall
        mov ebx, 0               ; Return a code of zero
        int 80H                  ; Make syscall to terminate the program
        
        