TITLE MYPROGRAM
DEDOMENA SEGMENT
       x1 db 5
       x2 db 2
       addresult db 0
       subresult db 0
        addmsg db  "Addition result is",10,13,"$"
        submsg db 10,13,"Substraction result is",10,13,"$"
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX     

     MOV AL,x1        ;apothhkeush se kataxwrhtes
     MOV BL,x2 
       
     ADD AL,BL 
     
     MOV addresult,AL  
     
     MOV AL,x1        ;apothhkeush se kataxwrhtes
     MOV BL,x2  
     
     SUB AL,BL   
     
     MOV subresult,AL 
     
     LEA DX,addmsg ;ektupwsh mhnumatos
     MOV AH,09
     INT 21H
     
     MOV DL,addresult
     ADD DL,30H       ;metatroph se ASCII
     
     MOV AH,02 ;ektypwsh apotelesmatos
      INT 21H
      
     LEA DX,submsg  ;ektupwsh mhnumatos
     MOV AH,09
     INT 21H 
      
      MOV DL,subresult
     ADD DL,30H         ;metatroph se ASCII
     
     MOV AH,02   ;ektypwsh apotelesmatos
      INT 21H
  
MOV AH,4CH
INT 21H
KODIKAS ENDS
END ARXH