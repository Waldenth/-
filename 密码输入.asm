DATAS SEGMENT
    ;�˴��������ݶδ���  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    ;�����������,����һ������,��ʾ*
    MOV AX,DATAS
    MOV DS,AX
    
    PASSWORD DB 10 DUP(0)
    	MOV CX,6	;���ñ��ܿ�����Ҫ���ַ�����
    	MOV SI,0	;����SIԴ��ַ����ֵ,���鿪ͷ[0]
    AGAIN:	MOV AH,7;�����ܺ�����Ϊ7,������ʾ
    		INT 21H
    		MOV PASSWORD[SI],AL
    		MOV DL,'*'	;��DL�Ĵ�������Ϊ*,
    		MOV AH,2	;��DOS���ù��ܺ���Ϊ2
    		INT 21H		;����DOS����
    		INC SI		;SI++
    		LOOP AGAIN    
    
    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

