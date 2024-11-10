TITLE MYPROGRAM
DEDOMENA SEGMENT
      
     MSG DB "H apoluth timh einai: $"
    

     ARRAY  DB 5,9
     DEKA   DB 10                                                      
     DEKADA DB 0
     MONADA DB 0  
     
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX
      
      LEA AX,array

      call abs_dataseg_reference
   
      call print
      
MOV AH,4CH
INT 21H

         
     abs_dataseg_reference proc
        PUSH DX
           MOV BP,AX
           MOV DL,DS:[BP]
           
           INC BP
           CMP DL,DS:[BP]
           JB lower
          
           SUB DL,DS:[BP]
           MOV BL,DL
           JMP END_ABS
           
           LOWER:
           SUB DS:[BP],DL
           MOV BL,DS:[BP]
           
        END_ABS:  
        POP DX
        ret
      abs_dataseg_reference endp    
         
         
         
         
         
         
         
    print PROC
        
        PUSH AX
       
     
     MOV AH,0
     MOV AL,BL
     
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
      
      POP AX  
      RET    
    print ENDP


KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH