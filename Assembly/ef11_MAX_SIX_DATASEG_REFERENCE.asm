 TITLE MYPROGRAM
DEDOMENA SEGMENT
    
    
        MSG DB "H megisth timh einai: $"
    

     ARRAY  DB 8,85,36,2,41,5
     DEKA   DB 10                                                      
     DEKADA DB 0
     MONADA DB 0 
      
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX

       LEA AX,array

      call max_six_dataseg_reference
      call print
      
      
MOV AH,4CH
INT 21H

        max_six_dataseg_reference proc 
           push cx  
           push bp 
            
            MOV BP,AX
            MOV CX,5
            MOV DL,DS:[BP]
            
             COMPUTE:
             INC BP
             CMP DL,DS:[BP] 
             
             
             JA NEXT
             MOV DL,DS:[BP]
                 
                 
                 
             NEXT:
              LOOP COMPUTE


           pop bp 
           pop cx 
            ret
        max_six_dataseg_reference endp

    print PROC
    MOV AX,DX
     
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