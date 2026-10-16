section .data
    newline db 10              ; ASCII code for "\n"

section .bss
    buffer  resb 20            ; 20 empty bytes to build our text in

section .text
    global _start

_start:
    mov rax, 1234              ; the number to convert
    mov rdi, buffer + 20       ; rdi = pointer to ONE PAST the buffer's end
    mov rbx, 10                ; rbx = divisor
    xor rcx, rcx               ; rcx = digit counter = 0

.convert_loop:
    xor rdx, rdx               ; clear rdx (div uses rdx:rax as the dividend)
    div rbx                    ; rax = rax / 10, rdx = rax % 10
    add dl, '0'                ; turn digit (0-9) into ASCII ('0'-'9')
    dec rdi                    ; move pointer one byte left
    mov [rdi], dl              ; store the character at that address
    inc rcx                    ; count this digit
    test rax, rax              ; is the quotient zero?
    jnz .convert_loop          ; if not, keep going

    ; --- print the digits ---
    mov rsi, rdi               ; rsi = address of first digit
    mov rdx, rcx               ; rdx = number of bytes to write
    mov rax, 1                 ; syscall number 1 = sys_write
    mov rdi, 1                 ; file descriptor 1 = stdout
    syscall

    ; --- print newline ---
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; --- exit ---
    mov rax, 60                ; syscall 60 = sys_exit
    xor rdi, rdi               ; exit code 0
    syscall
    
    
    
    
    ; command for installing the assembly for VSCode on my other PC | sudo apt update && sudo apt install -y nasm |
    ; terminal input to run 
    ; |  nasm -f elf64 itoa.asm -o itoa.o  |
    ; |  ld itoa.o -o itoa. |
    ; |  ./itoa  | 