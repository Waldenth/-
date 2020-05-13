;从键盘循环输入一字符存入X字节变量，
;若(X)为十进制数则将显示‘decimalism！’
;若(X)为大写字母则显示‘capital letter！'
;若(X)为小写字母则显示‘small letter！’
;若(X)为其它字符的ASCII码则退出。
OUTPUT MACRO X,Y
	MOV AH,X
	LEA DX,Y
	INT 21H
	ENDM

DATAS SEGMENT
	MESSAGE DB 'PLEASE INPUT: ','$'
	DXCIMAL DB 13,10,'decimalism!',13,10,'$'
	UPPERCASE DB 13,10,'capital letter!',13,10,'$'
	LOWERCASE DB 13,10,'small letter!',13,10,'$'
	X DB ' '
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
	DB 256 DUP(0)
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
	
L:	
	LEA DX,MESSAGE
	MOV AH,9
	INT 21H
	MOV AH,1
	INT 21H
	MOV X,AL
	CMP X,'0'
	JB EXIT	;不为规定输入
    CMP X,'9'
  	JA NEXT1;不为0-9
  	OUTPUT 9,DXCIMAL
  	JMP L
NEXT1:  	  
    CMP X,'A'
    JB EXIT
    CMP X,'Z'
    JA NEXT2
    OUTPUT 9,UPPERCASE
    JMP L
NEXT2:    
    CMP X,'a'
    JB EXIT
    CMP X,'z'
    JA EXIT
    OUTPUT 9,LOWERCASE
    JMP L

EXIT:  
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START