[BITs 16]
[ORG 0x7000]  ;where can it find the code and where to load it into memory
MOV SI, BOOTLOADERSTR   ;sets the register SI = BOOTLOADSTR
CALL PrintString  ;Call the function PrintString
JMP $

printCharacter:
MOV AH, 0x0E
MOV BH, 0x00
MOV BL, 0x07

INT 0x10
RET ;Return 

PrintString
nex_Character:
Mov AL, [SI]  ;store the contents of SI into the AL register 
INC SI ;move the pointer of SI to the next character in the string 
OR AL, AL ; check if the value of AL is 0 meaning end of the string
JZ exit_function ; exit the function 
Call printCharacter ; fetch the next character from the string 
RET ;Return 

;DATA
BOOTLOADERSTR db 'F.C.E. 365 Boot loader for carme 5.1,' 0
;bootloaders have to be 510 bytes in size 
TIMES 510 - ($-$$) db 0 
DW 0x55AA



