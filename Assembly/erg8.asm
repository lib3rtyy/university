TITLE MYPROGRAM
DEDOMENA SEGMENT
   msg1 DB "Dwse arithmo x:",10,13," $" 
   msg2 DB 10,13,"Dwse arithmo y:",10,13," $"
   msg3 db 10,13,"To apotelesma einai:",10,13,"$" 
   msg4 DB 10,13,"1540",10,13,"$"
   x db 0
   y db 0 
   result db 0
   ekato_number db 100
   ekatontada db 0 
     dekada db 0 
     monada db 0 
   

DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX
       
       STARTLOOP:
   LEA DX,msg1
   MOV AH,09
   INT 21H 
       
       MOV AH,08
       INT 21H  
       
       SUB AL,30H
        
         MOV x,AL
         
         CMP AL,0
         JB STARTLOOP
         
         CMP AL,9
         JA STARTLOOP
         
         MOV DL,x
         ADD DL,30H
         MOV AH,02
         INT 21H       
         
         MOV AL,x
         MUL x
         MUL x
         ADD AL,x 
         
         MOV CL,x
         MUL x
         ADD AL,CL
         
         MOV result,DL
         
         STARTLOOP2:
   LEA DX,msg2
   MOV AH,09
   INT 21H 
          
       MOV AH,08
       INT 21H  
       
       SUB AL,30H
       MOV y,AL 
       
         
         CMP AL,0
         JB STARTLOOP2
         
         CMP AL,9
         JA STARTLOOP2 
         
         MOV BL,y
         ADD DL,30H
         MOV AH,02
         INT 21H   
         
        MOV DH,result
        MOV AL,DH
        DIV y  
        
        div ekato_number  
        MOV ekatontada,DL
        MOV dekada,AL
        MOV monada,AH
        
         LEA DX,msg3
         MOV AH,09
         INT 21H    
         
          ADD dekada,30H
          ADD monada,30H
          ADD ekatontada,30H   
          
          
           MOV DL,ekatontada
           MOV AH,02
           INT 21H
   
 
          
          MOV DL,dekada
          MOV AH,02
          INT 21H 
          
     MOV DL,monada
     MOV AH,02
     INT 21H          
          
          
          
          CALL PRINT       
          
          
MOV AH,4CH
INT 21H


      PRINT  PROC 
       LEA DX, msg4 
    MOV AH,09
    INT 21H  
    RET  
    PRINT endp










KODIKAS ENDS
END ARXH