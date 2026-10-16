section .data
    newline db 10            

section .bss
    buffer  resb 20           

section .text
    global _start

_start:
    mov rax, 1234            
    mov rdi, buffer + 20      
    mov rbx, 10                
    xor rcx, rcx               

.convert_loop:
    xor rdx, rdx               
    div rbx                 
    add dl, '0'       
    dec rdi                   
    mov [rdi], dl             
    inc rcx                   
    test rax, rax             
    jnz .convert_loop         

    ; print the digits
    mov rsi, rdi              
    mov rdx, rcx               
    mov rax, 1               
    mov rdi, 1                 
    syscall

    ; print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; exit
    mov rax, 60            
    xor rdi, rdi             
    syscall
    
    
    
    
    ; command for installing the assembly for VSCode on my other PC | sudo apt update && sudo apt install -y nasm |
    ; terminal input to run 
    ; |  nasm -f elf64 itoa.asm -o itoa.o  |
    ; |  ld itoa.o -o itoa. |
    ; |  ./itoa  | 