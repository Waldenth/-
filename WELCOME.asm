DATAS SEGMENT
    ;�˴��������ݶδ���  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
	;��ӡWELCOME!
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    STRING DB 'WElCOME!' ',13,10,' '$'	;13ʹ���ص�����(ODH),10��ʾ����(0AH)
    	MOV AX,SEG STRING
    	MOV DS,AX
    	LEA DX,STRING
    	MOV AH,9
    	INT 21H
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
