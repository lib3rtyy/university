 TITLE MYPROGRAM
DEDOMENA SEGMENT
    MSG DB "H apoluth timh einai: $"
      
      fisrt_parameter  db 5
      second_parameter db 9
      result           db 0
      
      
     DEKA DB 10                                                      
     DEKADA DB 0
     MONADA DB 0
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX
      
      call abs_dataseg
   
      call print
     

MOV AH,4CH
INT 21H
      
      abs_dataseg proc
        
        
         
        push  cx
         MOV CH,fisrt_parameter
         MOV CL,second_parameter
         CMP CH,CL
         JB CH_LOWER
         SUB CH,CL
         MOV result,CH
         
         JMP  abs_dataseg_end 
          
          CH_LOWER:
          SUB CL,CH
          MOV RESULT,CL
          
          
          
           abs_dataseg_end:
        pop cx  
        
        
        ret
      abs_dataseg endp

    
    print PROC
       
     MOV AL,result
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