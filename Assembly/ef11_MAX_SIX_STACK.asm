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
         
         
         MOV AX,8
         MOV BX,3
          
         PUSH AX 
         PUSH BX
         
       call max_six_stack
        MOV BP,SP
        MOV AX,[BP-10]
        
        
        MOV AX,2
        MOV BX,9 
        
         PUSH AX 
         PUSH BX
         
       call max_six_stack
          MOV BP,SP
          MOV AX,[BP-10]
       
       
       MOV AX,99
       MOV BX,36
       
       PUSH AX
       PUSH BX
        
        call max_six_stack
        MOV BP,SP
        MOV AX,[BP-10]
         
   
     call print 
     

MOV AH,4CH
INT 21H

       max_six_stack PROC 
          PUSH BP
          PUSH CX
          PUSH DX 
          
          MOV BP,SP
          MOV CX,[BP+8]
          MOV DX,[BP+10]
          
          CMP DX,CX
           JA cx_lower
            
           MOV DX,CX
          
            
           cx_lower:
           
           
           MOV [BP-2],DX 
            
          
           
           POP DX
           POP CX
           POP BP 
           RET
        max_six_stack ENDP  
        
        
        
        print PROC
      PUSH AX
      PUSH DX
     
     MOV BL,[BP-10]  
     MOV AL,BL
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
      
      POP DX
      POP AX  
      RET    
    print ENDP


KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH