	ORG 000H
START: MOV DPTR,#TABLE
	MOV R3,#OK-TABLE+1
LOOP: MOV R2,#1
SCAN: ACALL SCAN1
	DJNZ R2,SCAN

	INC DPTR
	DJNZ R2,SCAN
	AJMP START

SCAN1:
	MOV R1,#00H
	MOV R5,#11111110B
	MOV R4,#08

LOOP1:
	MOV A,R1
	MOVC A,@A+DPTR
	CPL A
	MOV P0,A		;matrix LED
	MOV P1,R5		;transistor

	MOV R6,#5
DL1: MOV R7,#50
DL2: DJNZ R7,DL2
	DJNZ R6,DL1

	ORL P1,#11111111B
	MOV A,R5
	RL A
	MOV R5,A
	INC R1
	DJNZ R4,LOOP1
	RET

TABLE:
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
;W
	DB 00111111B
	DB 01000000B
	DB 00111000B
	DB 01000000B
	DB 00111111B
	DB 00000000B
	DB 00000000B
	DB 00000000B

	DB 00000000B
	DB 00000000B
;E
	DB 01111111B
	DB 01001001B
	DB 01001001B
	DB 01001001B
	DB 01000001B
	DB 00000000B
	DB 00000000B
	DB 00000000B

	DB 00000000B
	DB 00000000B
;L
	DB 01111111B
	DB 01000000B
	DB 01000000B
	DB 01000000B
	DB 01000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B

	DB 00000000B
	DB 00000000B
;C
	DB 00111110B
	DB 01000001B
	DB 01000001B
	DB 01000001B
	DB 00100010B
	DB 00000000B
	DB 00000000B
	DB 00000000B

	DB 00000000B
	DB 00000000B
;O
	DB 00111110B
	DB 01000001B
	DB 01000001B
	DB 01000001B
	DB 00111110B
	DB 00000000B
	DB 00000000B
	DB 00000000B

	DB 00000000B
	DB 00000000B
;M
	DB 01111111B
	DB 00000010B
	DB 00001100B
	DB 00000010B
	DB 01111111B
	DB 00000000B
	DB 00000000B
	DB 00000000B

	DB 00000000B
	DB 00000000B
;E
	DB 01111111B
	DB 01001001B
	DB 01001001B
	DB 01001001B
	DB 01000001B
	DB 00000000B
	DB 00000000B
	DB 00000000B

OK:	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B
	DB 00000000B

	END
