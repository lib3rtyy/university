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

      MOV AX,9
      MOV BX,5
      
      PUSH AX
      PUSH BX
      
      call abs_stack
      
      MOV BP,SP
      MOV AX,[BP-10]
   
      call print

MOV AH,4CH
INT 21H

      abs_stack PROC 
          PUSH BP
          PUSH CX
          PUSH DX 
          
          MOV BP,SP
          MOV CX,[BP+8]
          MOV DX,[BP+10]
          
          CMP CX,DX
           JB cx_lower
            
           SUB CX,DX
           MOV [BP-2],CX
            
            JMP  cx_lower_ENDP
            
           cx_lower:
           SUB DX,CX
           
           MOV [BP-2],DX 
            
           cx_lower_ENDP:
           
           POP DX
           POP CX
           POP BP 
           RET
        abs_stack ENDP 
       
       
       
       
       
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