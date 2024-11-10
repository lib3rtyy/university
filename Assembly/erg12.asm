TITLE EXAM_12
DATA SEGMENT
    INPUT DB 0 ; ARITHMOS APO EISAGWGH
    X DW 0
    Y DW 0 
    L DW 0
    EMB DW 0
    NUM_P DB 0
    STR1 DB "EISAGETE X ","$"
    STR2 DB "EISAGETE Y ","$"
    STR3 DB "EISAGETE MHKOS ","$" 
    STR4 DB "PRESS ANY KEY TO CONTINIUE ","$" 
    NL DB 10,13,"$"
DATA ENDS

CODE SEGMENT
    START:
    MOV AX, DATA
    MOV DS, AX
    
    ; INPUT STAGE
    LEA DX, STR1
    MOV AH, 09H
    INT 21H
    CALL EISAGWGH
    MOV AL, INPUT
    MOV AH, 0
    MOV X, AX
    
    
    LEA DX, NL
    MOV AH, 09H
    INT 21H
    
    LEA DX, STR2
    MOV AH, 09H
    INT 21H
    CALL EISAGWGH
    MOV AL, INPUT
    MOV AH, 0
    MOV Y, AX

    LEA DX, NL
    MOV AH, 09H
    INT 21H
    
    LEA DX, STR3
    MOV AH, 09H
    INT 21H
    CALL EISAGWGH
    MOV AL, INPUT
    MOV AH, 0
    MOV L, AX          
    
    LEA DX, NL
    MOV AH, 09H
    INT 21H
    ; CALCULATE EMBADO
    MOV AX, X
    MOV BX, Y
    MUL BX
    
    MOV CX, 2
    DIV CX 
    MOV EMB, AX 
    
;    MOV DX, AX     PRINT 3 DIGIT
;    ADD DX, 30H
;    MOV AH, 02H
;    INT 21H 
    
    
    ; PERIMENW APO TON XRHSTH NA PATISEI ENA KOUMPI
    ; WSTE NA ALLAKSEI TO PARATHIRO
    ; GIA NA PROLABEI O XRHSTHS NA DEI TIS DIAFORES TIMES
    
    LEA DX, NL
    MOV AH, 09H
    INT 21H
    LEA DX, STR4 
    MOV AH, 09H
    INT 21H
    MOV AH, 08H
    INT 21H
          
    CALL DRAWING
           
    MOV AH, 4CH
    INT 21H
    
    
    
    
    
    
    ;----------- FUNTIONS ----------
    
    EISAGWGH PROC
    ; ME AUTON TON TROPO POU YLOPOIW EISAGWNTAI APOKLEISTIKA 2-DIGIT ARITHMOI
    ; DEN KANW ELEGXO
    PUSH AX
    PUSH BX
    PUSH CX
         
    MOV AH, 08H ; DEKADA
    INT 21H    
    MOV BL, AL  ; @BL 
    SUB BL, 30H
    
    MOV AH, 08H ; MONADA 
    INT 21H
    MOV BH, AL  ; @BH    
    SUB BH, 30H
    
    MOV AL, BL
    MOV CL, 10
    MOV AH, 0  
    MUL CL
    
    ADD AL, BH     
    MOV INPUT, AL
     
    MOV NUM_P, AL
    CALL PRINT 
     
        
    POP CX
    POP BX
    POP AX
    RET
    EISAGWGH ENDP
    
    
    DRAWING PROC
    ; KATW ARISTERA GWNIA TOY TRIGWNOY
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH ES
        PUSH SI
        
        
        
        MOV AH, 0 
        MOV AL, 13H
        INT 10H
        
        MOV AX, Y 
        MOV BX, X
        MOV CX, L ; MIKOS GRAMMIS 
        MOV DX, 320
        MUL DX   ; Y*360
        ADD AX, BX ; Y*360+X
        
        MOV SI, AX  ; THESI GIA PAINT STON SI
        MOV DX, 0A000H ; THESI 0 STON ES 
        MOV ES, DX 
        DRAW_RIGHT:
            MOV ES:[SI], 09H ; XROMA
            INC SI ; AUKSISI THEIS
        LOOP DRAW_RIGHT 
        
        MOV CX, L
        DRAW_DIAGONAL:
            MOV ES:[SI], 09H ; XROMA
            SUB SI, 320
            DEC SI
        LOOP DRAW_DIAGONAL
        
        MOV CX, L
        DRAW_DOWN:
            MOV ES:[SI], 09H
            ADD SI, 320
        LOOP DRAW_DOWN
        
        POP SI
        POP ES
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    DRAWING ENDP 
                 
                 
    PRINT PROC
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        
        MOV AL, NUM_P ; ETOIMASIA GIA DIAIRESI
        MOV BH, 10  ; TOPOTHETISI TOU DIAIRETI SE KATAXARITI
        MOV AH, 0  ; GIA KAPOIO LOGO TO KANOYNE AYTO
        DIV BH     ; DIAIRESI
        MOV CL, AL ; DEKADES
        MOV CH, AH ; MONADES        
        
        
        ; 3EXWRISTI TIPWSI TWN ANTISTIXWN AIRHMWN
        MOV DL, CL
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        
        MOV DL, CH
        ADD DL, 30H
        MOV AH, 02H
        INT 21H 
        
        
        
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    PRINT ENDP 
    

    
    
CODE ENDS 
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END START