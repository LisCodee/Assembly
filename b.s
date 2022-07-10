
.global arr,main

.section .data
arr:
    .int 2,4,1,5,9,8,6,7,3,0
s:  
    .ascii "Sort complete\n"
.section .text

outer:
    movl $arr, %esi
    movl $0, %edx # inner loop counter
inner:
    cmpl %edx, %ecx
    je   to_outer
    movl (%esi),%eax
    cmpl %eax,4(%esi)
    jge skip
    xchg %eax, 4(%esi)
    movl %eax, (%esi)
skip:
    incl %edx
    addl $4, %esi
    jmp inner

to_outer:
    decl %ecx
    cmpl $0, %ecx
    je exit
    jmp outer
exit:
    movl $4, %eax
    movl $14,%edx
    movl $s, %ecx
    movl $1, %ebx
    int $0x80

    movl $1, %eax
    movl $0, %ebx
    int $0x80
    
main:
    movl $10, %ecx  # outer loop counter
    jmp outer
