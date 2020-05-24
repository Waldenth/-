;.586
INOUT MACRO X,Y
	PUSH AX
	PUSH DX
	LEA DX,X
	MOV AH,Y
	INT 21H
	POP DX
	POP AX
	ENDM
DATAS SEGMENT
    ;�˴��������ݶδ���  
    TIPS1 DB 'PLEASE INPUT NUMBER',13,10,'$'
	TIPS2 DB 'THE RESULTS ARE AS FOLLOWS:',13,10,'$'
	TAB  DB 20 DUP(?)
	HBPX   DB 20 DUP(?)
	FIRST DW 5AH
	S1 DB " 0-99: $"
	S2 DB " 100-199: $"
	S3 DB " 200-299: $"
	S4 DB " 300-399: $"
	S5 DB " 400-499: $"
	S6 DB " 500-599: $"
	S7 DB " 600-699: $"
	S8 DB " 700-799: $"
	S9 DB " 800-899: $"
	S10 DB "900-999: $"
	PX DB "XSCJSC: $"
	MAX DB 0
	C1 DB 0              ; ͳ��0-9�֡�
	C2 DB 0              ; ͳ��10-19������
	C3 DB 0              ; ͳ��20-29������
	C4 DB 0              ; ͳ��30-39������
	C5 DB 0              ; ͳ��40-49������
	C6 DB 0              ; ͳ��50-59������
	C7 DB 0              ; ͳ��60-69������
	C8 DB 0              ; ͳ��70-79������
	C9 DB 0              ; ͳ��80-89������
	C10 DB 0              ; ͳ��90-100�����������
	firs   DB  20				    ;Ԥ����20�ֽڵĿռ�
       		DB  ?				    ;��������ɺ�,�Զ����������ַ�����
       		DB  20  DUP(0)
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    INOUT TIPS1,9
	LEA SI,TAB  
    CALL INPUT           ; ����INPUT�ӳ��򣨴Ӽ��̽���ѧ���ɼ���
    LEA SI,TAB
    INOUT TIPS2,9
	CALL COUNT           ; ����COUNT�ӳ���ͳ�Ƹ�����÷ֵ�������
    LEA SI,TAB
    ;CALL LAST            
    MOV AH,4CH
    INT 21H
    

INPUT PROC NEAR            ; ����ѧ���ɼ����ӳ���
MOV CX,10				   ;10������
LP:  PUSH CX
     MOV AH,1              ; 1�Ź��ܵ���
     INT 21H
     MOV CL,4
     SHL AL,CL             ; �߼����ƣ�ȡʮλ�ϵ���
     MOV BH,AL             ; ��ʮλ�ϵ�������BH
     MOV AH,1              ; 1�Ź��ܵ���
     INT 21H
     AND AL,0FH            ; ȡ��λ�ϵ���
     OR AL,BH              ; �õ�����
     MOV [SI],AL
     INC SI
     MOV AH,1              ; 1�Ź��ܵ���
     INT 21H
     POP CX
     
	 
     CALL CRLF

     LOOP LP
     RET
INPUT ENDP

CALL CRLF


COUNT PROC NEAR           ; ͳ�Ƹ�����÷��������ӳ���
LEA SI,TAB
MOV CX,10
LOP:  MOV AL,[SI]         ; ȡ����
	  CMP AL,10H
      JB  T1
      CMP AL,20H
      JB  T2  
	  CMP AL,30H
      JB  T3              ; 60�����£�ת��T1
      CMP AL,40H
      JB  T4              ; 70�����£�ת��T2
      CMP AL,50H        
      JB  T5              ; 80�����£�ת��T3
      CMP AL,60H        
      JB  T6              ; 90�����£�ת��T4
      CMP AL,70H
      JB  T7              ; 60�����£�ת��T1
      CMP AL,80H
      JB  T8              ; 70�����£�ת��T2
      CMP AL,90H        
      JB  T9              ; 80�����£�ת��T3
      
  
T10:   INC C10              ; 90-100������������1
      JMP NEXT
      
T9:   INC C9              ; 80-89������������1
      JMP NEXT
T8:   INC C8              ; 70-79������������1
      JMP NEXT
T7:   INC C7              ; 60-69������������1
      JMP NEXT
T6:   INC C6              ; 50-59������������1
	  JMP NEXT
T5:   INC C5              ; 40-49������������1
      JMP NEXT
T4:   INC C4              ; 30-39������������1
      JMP NEXT
T3:   INC C3              ; 20-29������������1
      JMP NEXT
T2:   INC C2              ; 10-19������������1
      JMP NEXT
T1:   INC C1              ; 0-9��������1

NEXT: INC SI              ; ��һ����
      LOOP LOP

CALL CRLF                 ; �س�����
MOV DX,OFFSET S10          ; ���100-90�����������
MOV AH,09H
INT 21H

MOV DL,C10
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF

MOV DX,OFFSET S9         ; ���89-90�����������
MOV AH,09H
INT 21H

MOV DL,C9
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF

MOV DX,OFFSET S8          ; ���79-70�����������
MOV AH,09H
INT 21H

MOV DL,C8
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF

MOV DX,OFFSET S7          ; ���69-60�����������
MOV AH,09H
INT 21H

MOV DL,C7
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF

MOV DX,OFFSET S6          ; ���60���������������
MOV AH,09H
INT 21H
MOV DL,C6
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF
              
MOV DX,OFFSET S5          ; ���100-90�����������
MOV AH,09H
INT 21H

MOV DL,C5
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF

MOV DX,OFFSET S4          ; ���89-90�����������
MOV AH,09H
INT 21H

MOV DL,C4
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF

MOV DX,OFFSET S3          ; ���79-70�����������
MOV AH,09H
INT 21H

MOV DL,C3
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF

MOV DX,OFFSET S2          ; ���69-60�����������
MOV AH,09H
INT 21H

MOV DL,C2
ADD DL,30H
MOV AH,02H
INT 21H
CALL CRLF

MOV DX,OFFSET S1          ; ���60���������������
MOV AH,09H
INT 21H

MOV DL,C1
ADD DL,30H
MOV AH,02H
INT 21H

CALL CRLF
RET
COUNT ENDP




CRLF PROC NEAR           ; �س�����
MOV DL,0AH
MOV AH,02H
INT 21H
MOV DL,0DH
MOV AH,02H
INT 21H
RET
CRLF ENDP

    
CODES ENDS
    END START
