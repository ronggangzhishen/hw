BUBBLESORT:
	;NUM为双字有符号数开始处
	;N为数字个数
	;for i=	1 to N-1
	;	for j=N-1 to i
	;		if NUM[j-1] > NUM[j]
	;			exchange NUM[j-1],NUM[j]
	;
	XOR DX,DX       
	MOV DL,N
	ADD DX,DX		;DX=N
	SUB DX,1
	MOV SI,0000H	
LOOPI:
	INC SI
	INC SI
	MOV DI,DX
	DEC DI
	MOV CX,SI
	DEC CX		;CX=i-1
LOOPJ:
	MOV AX,NUM[DI]
	DEC DI
	DEC DI
	MOV BX,NUM[DI]
	CMP BX,AX
	JG EXCHANGE
	JMP CMPJ
EXCHANGE:
	MOV NUM[DI],AX
	MOV NUM[DI+0002H],BX
CMPJ:
	CMP DI,CX
	JG LOOPJ
CMPI:
	CMP SI,DX
	JL LOOPI
	
	RET
	
	