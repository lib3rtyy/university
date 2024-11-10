TITLE MYPROGRAM
Data SEGMENT
 printprompt1 db "Parakalw eisagete keimeno, pathste # gia termatismo",10,13,"$"    
 printinputchar1 db 10,13,"Parakalw dwste to xarakthra poy thelete na brw",10,13,"$" 
 printdec1 db  10,13, "Oi fores pou brethhke to stoixeio pou zhthsate einai:",10,13,"$"
 buffer    db 80 dup(0)  
 chartosearch db 0  
 dec_number db 10 
 dekada db 0 
 monada db 0 
Data ENDS
Code SEGMENT
Start: MOV AX,Data
      MOV DS,AX
         ;klhsh sunarthsewn
       CALL  printprompt 
       
       CALL  inputtex   
       
       CALL  printinputchar
        
       CALL  inputchar 
       
       CALL searchchar
       
       CALL printdec
       
       
         MOV AH,4CH
         INT 21H  
         
    ;sunarthsh gai ektupwsh mhnumatos        
            
    printprompt PROC 
   
    LEA DX, printprompt1 
    MOV AH,09
    INT 21H  
    RET  
    printprompt endp
       
       
        
        
    inputtex PROC
    MOV SI,0
       
       STARTLOOP1:
       MOV AH,01H ;eisagwgh me emfanish
       INT 21H     
         CMP AL,35   ;elegxos xarakthra #
         JE ENDLOOP1
         
       
       MOV buffer[SI] ,AL   ;metafora xatrakthra sto buffer
       INC SI               ;aukshsh metrhth SI
       
       CMP SI,80            ;sugkrish metrhth me to 80
       JB STARTLOOP1
       
       ENDLOOP1:
       RET
    inputtex endp 
           
        
        
           
    printinputchar PROC 
    LEA DX, printinputchar1 
    MOV AH,09
    INT 21H  
    RET     
    printinputchar endp    
       
       
        
    inputchar PROC   ;eisagwgh xarakthra anazhthshs 
       MOV AH,01H
       INT 21H 
       MOV chartosearch,AL 
       RET
    inputchar endp 
    
    
    
    
   searchchar PROC
    MOV SI,0
    MOV DI,0
     
     MOV CX,80  ;loupa gia 80 fores
     SLOOP1:
     MOV DL,chartosearch
     CMP DL,buffer[SI]
     JNE INCSI         ;an den einai isa n aukshthei to si
     INC DI            ;alliws to di
     
     INCSI:
      INC SI
      
     LOOP SLOOP1 
 
    RET 
    searchchar endp 
   
   printdec PROC
     LEA DX, printdec1 
    MOV AH,09
    INT 21H
     MOV AX,DI
     
      DIV dec_number 
          MOV dekada,AL
          MOV monada,AH
    
       ADD  monada,30H
       ADD  dekada,30H
          
       MOV DL,dekada
       MOV AH,02
       INT 21H  
       
       MOV DL,monada
       MOV AH,02
       INT 21H
    RET
   printdec endp 

Code ENDS
END Start