TITLE MYPROGRAM
DEDOMENA SEGMENT
     protropimsg DB "Parakalw doste 0-9:",10,13,"$"  
     msg db 10,13,"Dekadiko Apotelesma:",10,13,"$" 
     msg1 db 10,13,"Dekaexadiko Apotelesma:",10,13,"$"
    
     x_number DB 0
     f_result db 0
     dec_number db 10 
     dekada db 0 
     monada db 0 
     hex_number db 16
     hex_dekada db 0
     hex_monada db 0
       
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX  
      
        PART1:
    LEA DX,protropimsg 
    MOV AH,09
    INT 21H
      
       MOV AH,08     ;eisodos xwris emfanish
       INT 21H
       SUB AL,30H     
       
       MOV x_number,AL
       
         CMP AL,0
         JB PART1       ;an einai mikrotero tou 0 epestrepse sthn eisagwgh
       
         CMP AL,9 
         JA PART1       ;an einai megalutero tou 9 epestrepse sthn eisagwgh
       
       MOV DL,x_number 
       ADD DL,30H       ;ASCII
       MOV AH,02        ;ektupesh arithmou
       INT 21H    
       
       MOV AL,x_number
       MUL x_number      ;x^2
       ADD AL,x_number   ;x^2+x
       
       MOV f_result,AL
       
       MOV DH,f_result
       MOV AL,DH
       MOV AH,0
         
         
         ;ektupwsh dekadikou
         
          DIV dec_number 
          MOV dekada,AL
          MOV monada,AH
       
  
       
   LEA DX,msg 
   MOV AH,09
   INT 21H
       
       ADD  monada,30H
       ADD  dekada,30H
          
       MOV DL,dekada
       MOV AH,02
       INT 21H  
       
       MOV DL,monada
       MOV AH,02
       INT 21H  
          
       MOV DH,f_result   
       MOV AL,DH 
      
      
      ;eltupwsh dekaeksadiko
      
       
         DIV hex_number
         MOV hex_dekada,AL
         MOV hex_monada,AH 
       
       ADD  hex_dekada,16
       ADD  hex_monada,30h 
       
         CMP AH,9 
         JA PART2
         JMP PRINT:
       
       PART2: 
       ADD  hex_monada,7  
    
    
       
    PRINT: 

    
    LEA DX,msg1
    MOV AH,09
    INT 21H
       
       MOV DL,hex_dekada
       MOV AH,02
       INT 21H 
       
       MOV DL,hex_monada
       MOV AH,02
       INT 21H
            
        
MOV AH,4CH      
INT 21H
KODIKAS ENDS
END ARXH