TITLE MYPROGRAM
DEDOMENA SEGMENT
    
    
    
        MSG DB "H megisth timh einai: $"
    

     ARRAY  DB 5,91,28,7,39,48
     DEKA   DB 10                                                      
     DEKADA DB 0
     MONADA DB 0  
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX

       LEA AX,array

      call max_six_stack_reference
      call print
      
      
MOV AH,4CH
INT 21H

        max_six_stack_reference proc 
          push cx  
           push bp 
            
          
            MOV CX,5
            MOV BP,AX
            MOV BX,[BP+6]
            MOV DX,[BP+8]
            
            againl:
            MOV DL,DS:[BP]
            MOV BL,DS:[BP+1]
            CMP DL,BL 
            JA DX_LOWER
            
            JMP END_ABS 
            
            MOV DL,BL
            
            
            DX_LOWER:
            MOV [BP-4],BL
            
            
 
            
           END_ABS:
           pop bp 
           pop cx 
            ret
        max_six_stack_reference endp

    print PROC
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
      
       
      RET    
    print ENDP
            
            
            
KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH