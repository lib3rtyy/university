TITLE MYPROGRAM
DEDOMENA SEGMENT
    protropimsg DB "Dwse arithmo x:",10,13," $" 
    apotelesmamsg db "To apotelesma einai",10,13,"$" 
    KENO DB 10,13,"$"   
    ;thetoume tis metablhtes
    x_number db 0 
    f_result db 0
    z_result db 10
    dekada db 0 
    monada db 0
    
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX     
    ;kaloume to mhnuma protropimsg  
   LEA DX,protropimsg
   MOV AH,09
   INT 21H 
      
       ;metaferoyme ton arithmo pou eisagame ston kataxwrhth AL
       MOV AH,01H
       INT 21H
       SUB AL,30H
       
       MOV x_number,AL
       
       ;dhmiourgoume to 4x
       ADD AL,x_number 
       MOV BL,AL 
       ADD BL,AL
       
       MOV CH,x_number
       MOV AL,x_number
       
       ;dhmiourgoume to x^2
       MUL CH
       MOV CH,AL
       ADD BL,CH
      
       MOV f_result,BL
       MOV DH,f_result
       MOV AL,DH
       MOV AH,0
       
       ;xwrizoume to apotelesma se dekada kai monada
       DIV z_result 
       MOV dekada,AL
       MOV monada,AH
                
                    
   LEA DX,KENO
   MOV AH,09
   INT 21H               
   
   ;emfanoizoume to mhnuma tou apotelesmatos   
   LEA DX,apotelesmamsg
   MOV AH,09
   INT 21H                 
    
      ADD dekada,30H
      ADD monada,30H
           
   MOV DL,dekada
   MOV AH,02
   INT 21H
   
   MOV DL,monada
   MOV AH,02
   INT 21H          
                       
MOV AH,4CH
INT 21H
KODIKAS ENDS
END ARXH