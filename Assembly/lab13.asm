 TITLE MYPROGRAM
Data SEGMENT
     promptmsg db "Eisagete keimeno:",10,13,"$"
     alfar     dW "TaapaTajAAaavam koralaTaTTe aaTTpotaATa nkTTatAsktTtTap SvaTa",0
     search    db 10,13,"Eisagete ton xarakthra pou thelete na breite poses fores uparxei: $" 
     print     db  10,13, "Oi fores pou brethhke to stoixeio pou zhthsate einai:",10,13,"$"
     AEM       db 10,13,"1540 $"
     dec_number db 10 
     dekada db 0 
     monada db 0 
  Data ENDS
Code SEGMENT
Start: MOV AX,Data
       MOV DS,AX
      
    LEA DX,promptmsg     ;ektupwsh munhmatos eisagwghs
    MOV AH,09
    INT 21H   
     
   
     STARTLOOP:         ;etiketa 
      
       MOV AH,08        ;eisagwgh xarakthrwn xwris emfanish 
       INT 21H 
       
      CMP AL,97          ;sugkrish xarakthrwn
      JB STARTLOOP      ;kai an einai mikrotero tou 'a' epistrefei sthn etiketa
 
      CMP AL,122         ;sugkrish xarakthrwn
      JB STORELOOP      ;kai an einai mikrotero tou 'z' to apothikeuei
       
      
      CMP AL,90          ;sugkrish xarakthrwn
      JBE STARTLOOP      ;kai an einai iso h mikrotero tou 'Z' epistrefei sthn etiketa 
       

       
      STORELOOP:        ;etiketa apothikeushs xarakthrwn
      
       MOV DL,AL        ;ektupwsh xarakthrwn pou exoume eisagei
       MOV AH,02
       INT 21H  
       
                     
       MOV BL , AL      ;apothikeush tou xarakthra se parametro 
        
       
       
       CALL sunarthsh
       
       CALL printdec
         
       LEA DX,AEM     
       MOV AH,09
       INT 21H 
       
        
  
  

     
      
MOV AH,4CH
INT 21H



    sunarthsh PROC
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
     
     MOV DI,0   
     MOV BH,BL
     MOV BP,alfar
     MOV CL,DS:[BP]
     INC BP
     

    LEA DX,search     ;ektupwsh munhmatos eisagwghs
    MOV AH,09
    INT 21H   
     
    MOV AH,01H
    INT 21H 
    MOV CH,AL  
     
     
       
     MOV CX,80  ;loupa gia 80 fores
     SLOOP1:
     MOV DL,CL
     CMP DL,DS:[BP]
     JNE INCBP         ;an den einai isa n aukshthei to si
     INC DI            ;TO APOTELESMA APOTHIKEYETAI STO METRHTH DI
     
     INCBP:
      INC BP 
      
      LOOP SLOOP1  
       
     POP DX
     POP CX
     POP BX
     POP AX  
     
    RET
    sunarthsh ENDP



     printdec PROC       ;ektupwsh se dekadiko
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        
        
     LEA DX, print 
     MOV AH,09
     INT 21H
     MOV AX,DI
     
      DIV dec_number 
          MOV dekada,AL
          MOV monada,AH
    
       ADD  monada,30H
       ADD  dekada,30H
          
       MOV DL,dekada
       MOV AH,02
       INT 21H  
       
       MOV DL,monada
       MOV AH,02
       INT 21H
       
     POP DX
     POP CX
     POP BX
     POP AX 
     
    RET
   printdec endp 







  
  
  

Code ENDS
END Start     
     
    