 TITLE MYPROGRAM
DEDOMENA SEGMENT
      
     ARRAY  DB 10,1,4,90,6,67,8,9,43,44  
     keno db 10,13,"$"
     DEKA   DB 10                                                      
     DEKADA DB 0
     MONADA DB 0  
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX

       LEA AX,array

      call bubble_sort
     
     MOV CX,10
     MOV SI,0
     
     LOOP2:
     CALL PRINT
     
     INC SI
      
     lea dx,keno
     mov ah,09
     int 21h
     
     LOOP LOOP2
     
      
      
MOV AH,4CH
INT 21H

        bubble_sort proc 
         PUSHA
            
            MOV BP,AX
            MOV CX,9
              
            LOOP1:
            MOV SI,0 
            
            PARTA:
            MOV AH,DS:[BP+SI]
            MOV AL,DS:[BP+SI+1]  
              
              
            CMP AH,AL
            JL PARTB
            
            MOV DS:[BP+SI],AL
            MOV DS:[BP+SI+1],AH
              
            PARTB:
            INC SI
            CMP SI,CX
            JB PARTA 
            
            LOOP LOOP1  
              
              
           POPA 
            ret
        bubble_sort endp   
        
        
        
        
        
        

    print PROC
        MOV AX,0
        MOV AL,ARRAY[SI]
     
     DIV deka
     
     MOV DEKADA,AL     
     MOV MONADA,AH  
       
     ADD DEKADA,30H    
     ADD MONADA,30H
     
   
      
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