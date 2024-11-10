TITLE MYPROGRAM
DEDOMENA SEGMENT
    protropimsg DB "Dwse arithmo x:",10,13," $" 
    apotelesmamsg db 10,13,"To apotelesma einai:",10,13,"$" 
     
    
    x_number db 0 
    f_result db 0
    z_result db 10
    dekada db 0 
    monada db 0
    
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX     
      
   LEA DX,protropimsg
   MOV AH,09
   INT 21H 
      
     
       MOV AH,01H  ;eisagwgh xarakthrea apo to plhktrologio
       INT 21H  
       
       SUB AL,30H  ;metatroph se ASCII
       
       MOV x_number,AL   ;metafora apo kataxwthth se dieuthhnsh mnhmhs
      
       ADD AL,x_number   ;2x
       
       SUB AL,3         ;2x-3
       MOV BL,AL 
       
       MOV CH,x_number
       MOV AL,x_number
       
       MUL CH          ;poll/me al me ch (x^2)
       MOV CH,AL       ;sto AL exw to x^2 kai to metaferw sto CH
       ADD BL,CH       ;x^2 + 2x-3
      
       MOV f_result,BL
       MOV DH,f_result  ;metafora apotelesmatos sto Dh
       MOV AL,DH        ;metafora sto AL
       MOV AH,0
         
         
       ;ektupwsh dipshfiou  
         
         
       DIV z_result     
       MOV dekada,AL
       MOV monada,AH
                              
      
   LEA DX,apotelesmamsg  ;mhnuma
   MOV AH,09
   INT 21H                 
    
      ADD dekada,30H      ;ASCII
      ADD monada,30H
                     
                     
    ;ektupwsh arithmwn                 
                     
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