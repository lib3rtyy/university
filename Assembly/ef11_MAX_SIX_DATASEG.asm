TITLE MYPROGRAM
DEDOMENA SEGMENT 
    
    
     MSG DB "H megisth timh einai: $"
       one   db 55
       two   db 9
       three db 73
       four  db 21
       five  db 88
       six   db 30
       result db 0
       
       
     DEKA DB 10                                                      
     DEKADA DB 0
     MONADA DB 0
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX
      

     call max_six_dataseg:
   
     call print 
     
     
MOV AH,4CH
INT 21H
            
            
            
       max_six_dataseg proc 
         MOV AH,one
         MOV AL,two
         MOV BH,three
         MOV BL,four
         MOV CH,five
         MOV CL,six

           
         MOV result,AH
         
         PARTA:
         CMP result,AL
         JA PARTB
         MOV result,AL
         
         PARTB:
         CMP result,BH
         JA PARTC
         MOV result,BH
         
         PARTC:
         CMP result,BL
         JA PARTD
         MOV result,BL
         
         PARTD:
         CMP result,CH
         JA PARTE
         MOV result,CH
         
         PARTE:
         CMP result,CL
         JA END_comparing
         MOV result,CL  
           
        
        end_comparing:
        ret
        max_six_dataseg endp
       
         
         
         
         
         
       

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