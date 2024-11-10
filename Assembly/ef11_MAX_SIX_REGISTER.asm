TITLE MYPROGRAM
DEDOMENA SEGMENT
     MSG DB "H megisth timh einai: $"
    
    
     DEKA DB 10                                                      
     DEKADA DB 0
     MONADA DB 0
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX
       
       mov AH,99
       MOV AL,10
       MOV BH,48
       MOV BL,71
       MOV CH,56
       MOV CL,8
    

     call max_six_register
   
     call print 
     
     
MOV AH,4CH
INT 21H
            
            
            
       max_six_register proc 
           
         MOV DL,AH
         
         PARTA:
         CMP DL,AL
         JA PARTB
         MOV DL, AL
         
         PARTB:
         CMP DL,BH
         JA PARTC
         MOV DL,BH
         
         PARTC:
         CMP DL,BL
         JA PARTD
         MOV DL,BL
         
         PARTD:
         CMP DL,CH
         JA PARTE
         MOV DL,CH
         
         PARTE:
         CMP DL,CL
         JA END_comparing
         MOV DL,CL  
           
        
        end_comparing:
        ret
        max_six_register endp
       
       
       

      print PROC
       
     MOV AL,DL
     MOV AH,0
     
     DIV deka
     
     MOV DEKADA,AL     
     MOV MONADA,AH  
       
     ADD DEKADA,30H    
     ADD MONADA,30H
     
     LEA DX,MSG        
     MOV AH,09
     INT 21H
      
   MOV DL,DEKADA        
   MOV AH,02          
   INT 21H
   
   MOV DL,MONADA        
   MOV AH,02
   INT 21H  
        
      RET    
    print ENDP

KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH