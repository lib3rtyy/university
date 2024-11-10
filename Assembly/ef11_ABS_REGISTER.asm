TITLE MYPROGRAM
DEDOMENA SEGMENT  
    
    
     MSG DB "H apoluth timh einai: $"
    
    
    
    
     DEKA DB 10                                                      
     DEKADA DB 0
     MONADA DB 0
     
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX

      MOV CH,5
      MOV CL,9  
      
      
      call abs_register
   
      call print
   
   
   

MOV AH,4CH
INT 21H

   
                      
                      
    abs_register PROC
         
       CMP CH,CL 
       JB lower
       
         SUB CH,CL
         MOV DH,CH
        
        JMP abs_register_END
        
       lower:
       SUB CL,CH
       MOV DH,CL 
        
       abs_register_END: 
        
       RET
    abs_register ENDP 
   
   
       
       
       
       
       
    print PROC
       
     MOV AL,DH
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