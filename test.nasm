bits 64

global modulo, vals_divisible


modulo:
;;;;;;;;;;;;;;;;;;
; This function takes two
; parameters: 
; 
; Parameter 1: An Integer Value (4 bytes)
;
; Parameter 2: An Integer Value (4 bytes)
;
; Return: The remainder of the first integer divided by the second, e.g., val1 % val2
;
;	Remember, check input! What does division by 0 give us? Return 0 if the input provided
;	is bad.
;
; int modulo(int val1, int val2);
;
; BEGIN STUDENT CODE
;;;;;;;;;;;;;;;;;;;;
xor rdx, rdx
mov rax, rdi
mov r8, rsi
cmp r8, 0
jz .err
div r8
mov rax, rdx
jmp .end
.err:
mov rax, 0
.end:
;;;;;;;;;;;;;;;;;;;;
; END STUDENT CODE
;;;;;;;;;;;;;;;;;;;;
	ret



vals_divisible:
;;;;;;;;;;;;;;;;;;;;
; This method takes one parameter:
;
; Parameter 1: An integer value (4 bytes)
; 
;
; It should return: A count of all values from 1-N (where N is Parameter 1) that are divisible by 3 or 5
;
; int vals_divisible(int n);
;
; BEGIN STUDENT CODE
;;;;;;;;;;;;;;;;;;;;
xor rsi, rsi ; will contain the count
mov rcx, rdi ; counter for the loop
mov r8, 3    ; ... 3
mov r9, 5    ; ... 5
.test
	mov rax, rcx
	xor rdx, rdx
	div r8
	cmp rdx, 0
	jz .inc
	mov rax, rcx
	xor rdx, rdx
	div r9
	cmp rdx, 0
	jz .inc
	jnz .end
	.inc:
	inc rsi
	.end:
loop .test
mov rax, rsi
;;;;;;;;;;;;;;;;;;;;
; END STUDENT CODE
;;;;;;;;;;;;;;;;;;;;
	ret

