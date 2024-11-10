 TITLE MYPROGRAM
DEDOMENA SEGMENT
   MSG DB 10,13,"PRESS THE FOLLLOWING KEYS", 10,13,"1 FORWARD ",10 ,13,"2 LEFT",10,13,"3 RIGHT",10,13,"4 EXAMINE",10,13,"5 ON LAMP",10,13,"6 OFF LAMP",10,13,"$"      
   ERRORMSG DB 10,13,"ERROR",10,13,"$" 
   wallmsg DB 10,13,"WALL",10,13,"$"
   offlampmsg DB 10,13,"switched-off lamp",10,13,"$"
   onlampmsg db 10,13," switched-on lamp",10,13,"$"
   
   COMMAND db 0
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX 

   CALL check_ready
   
   CALL print_menu
   
   CALL input_command
    
   CALL send_command
  
  
  JMP ARXH
   
  MOV AH,4CH
  INT 21H
             
             
             
             
  check_ready PROC
        PUSH AX
         
         
         
        againcheck:
        IN AL,11
        AND AL,00000010b
        CMP AL,2
        JE againcheck
        
        
        POP AX
        RET
        check_ready endp
               
               
               
               
            
        print_menu PROC 
            
           
            PUSH DX
             LEA DX, MSG
             MOV AH,09
             INT 21H
            
          
            POP DX
            RET
            print_menu endp    
          
          
          
            
        input_command PROC 
           PUSH AX
           STARTLOOP1: 
           MOV AH,08
           INT 21H
           CMP AL,"6"
           JA STARTLOOP1
           CMP AL,"1"
           JB STARTLOOP1
           
          SUB AL,30H
           MOV COMMAND,AL
           
            POP AX
           
            RET
            input_command endp   
                   
                   
                   
                   
                   
                   
                   
            
            send_command PROC 
                PUSH AX
                
                CALL check_ready
                
                MOV AL,0
                OUT 9, AL 
                 
                 MOV AL,COMMAND
                CALL check_ready 
                 OUT 9, AL    
                 
                 CALL check_command_execution
                 
                 CMP AL,4
                 JE examine1
                 JMP END2
                 
                 examine1: 
                 CALL examine 
                 
                 
                 END2:
                POP AX
                RET
                send_command endp
            
            check_command_execution PROC    
                PUSH AX 
                PUSH DX
                CALL check_ready
                 IN AL,11
                 AND AL,00000100b
                 
                 CMP AL,4 
                 JE ERROR  
                 JMP END
                 
                 ERROR:
                 LEA DX, ERRORMSG
                 MOV AH,09
                 INT 21H    
                 
                 
                 END:
                 POP DX
                 POP AX
                RET
                check_command_execution endp
                
                
                examine PROC
                    PUSH AX
                    PUSH DX
                     
                     
                     CALL check_ready 
                     
                     
                      MOV AL,0
                      IN AL,10 
                      
                      COMPARE1:
                      CMP AL,255
                      JE WALL
                      JMP COMPARE2
                     
                      WALL:
                      LEA DX, wallmsg
                      MOV AH,09
                      INT 21H
                      JMP TELOS
                      
                     COMPARE2:
                     CMP AL,7
                     JE ONLAMP
                     JMP COMPARE3 
                     
                      ONLAMP:
                      LEA DX, onlampmsg
                      MOV AH,09
                      INT 21H 
                      JMP TELOS
                     
                     COMPARE3:
                     CMP AL,8
                     JE OFFLAMP 
                     JMP COMPARE4
                      
                      OFFLAMP:  
                      LEA DX, offlampmsg
                      MOV AH,09
                      INT 21H 
                      JMP TELOS 
                      
                     COMPARE4:
                     CMP AL,0 
                     JMP TELOS
      
                      
                     
                      
                    TELOS:
                    POP AX
                    POP DX
                    RET
                    examine endp
            

KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH 
 
 
 
  
  
  

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


