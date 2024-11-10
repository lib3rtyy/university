TITLE MYPROGRAM
DEDOMENA SEGMENT
             MSG DB " Na eisaxtoyn 8bit: $"
             MSG1 DB 10,13," O xarakthras pou exei thn parapanw ascii timh sto duadiko susthma einai o: $"
             
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX

    CALL printprompt 
    
    MOV CX,8
    sloop1:
    CALL getbinarydigit 
    CALL constructbinary
    LOOP sloop1 
    
     LEA DX, MSG1
     MOV AH,09
     INT 21H
     
     MOV DL,BH 
     MOV AH,02
     INT 21H
     
MOV AH,4CH
INT 21H

     printprompt PROC 
      PUSH DX  
     LEA DX, MSG
     MOV AH,09
     INT 21H      
            
      POP DX      
     RET
     printprompt  endp 
     
        
        
        
     getbinarydigit PROC 
         PUSH AX 

         
         LOOP1:
         MOV AH,08
         INT 21H     
         
         CMP AL,"1"
         JE END 
         
         CMP AL,"0"
         JE END  
         
         JMP LOOP1
           
          END:
           MOV DL,AL
           MOV AH,02
           INT 21H  
           
            SUB AL,30H 
            MOV BL,DL
      
           
         POP AX
        RET 
     getbinarydigit endp 
     
     
     constructbinary PROC 
        PUSH AX 
        
         SHR BL,1
         RCL BH,1
         
        
        POP AX
         RET
        constructbinary endp
        

KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH