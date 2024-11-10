TITLE MYPROGRAM
Data SEGMENT
     promptmsg db "Eisagete keimeno:",10,13,"$"                       ;munhma eisagwghs keimenou
     metatrmsg db 10,13,"To keimeno meta tin metatropi:",10,13,"$"    ;munhma metatrophs
     nochars   db  "Den dwsate xarakthres",10,13,"$"                  ;munhma lathous
     msg       db 10,13,"O arithmos twn xarakthrwn einai:",10,13,"$"  ;teliko  mhnuma arithmwn xarakthrwn
     
     buffer    db 40 dup(0)                                           ;dhlwsh buffer 
                                                                  
     DEKA DB 10                                                       ;dhlwsh metavlhtwn
     DEKADA DB 0
     MONADA DB 0
Data ENDS
Code SEGMENT
Start: MOV AX,Data
       MOV DS,AX
      
    LEA DX,promptmsg     ;ektupwsh munhmatos eisagwghs
    MOV AH,09
    INT 21H
      
      MOV SI,0           ;arxikopoihsh tou SI
      
            STARTLOOP1:  ;etiketa 
      
       MOV AH,08         ;eisagwgh xarakthrwn xwris emfanish
       INT 21H
         
      
      CMP AL,13          ;sugkrish xarakthrwn
      JE ENDLOOP1        ;kai an einai iso me enter phgainei sto telos ths loupas 
      
      CMP AL,33          ;sugkrish xarakthrwn
      JE STORELOOP1      ;kai an einai iso me ! to apothikeuei 
      
      CMP AL,32          ;sugkrish xarakthrwn
      JE STORELOOP1      ;kai an einai space to apothikeuei
      
      CMP AL,46          ;sugkrish xarakthrwn
      JE STORELOOP1      ;kai an einai teleia(.) to apothikeuei
      
      CMP AL,65          ;sugkrish xarakthrwn
      JB  STARTLOOP1     ;kai an einai mikrotero tou 'A' epistrefei sthn arxh ths loupas
      
      CMP AL,90          ;sugkrish xarakthrwn
      JB STORELOOP1      ;kai an einai mikrotero tou 'Z' to apothikeuei
 	
      CMP AL,97          ;sugkrish xarakthrwn
      JB STARTLOOP1      ;kai an einai mikrotero epistrefei sthn arxh ths loupas
 
      CMP AL,122         ;sugkrish xarakthrwn
      JB STORELOOP1      ;kai an einai mikrotero tou 'z' to apothikeuei


    JMP STARTLOOP1       ;metaphdhsh sthn etiketa
   
                                                                                          
             STORELOOP1: ;etiketa apothikeushs xarakthrwn
      
       MOV DL,AL         ;ektupwsh xarakthrwn pou exoume eisagei
       MOV AH,02
       INT 21H 
       
     MOV buffer[SI] , AL ;apothikeusei twn xarakthrwn se bouffer 
     INC SI              ;aukshsh tou counter SI kata 1
       
      CMP SI,40          ;sugkrish xarakthrwn pou exoume eisagei
      JB STARTLOOP1      ;kai an einai mikrotero tou 40 epistrefei sthn arxh ths loupas
      
             ENDLOOP1:   ;etiketa gia to telos ths loupas
             
         CMP SI,0        ;sugkrish xarakthrwn pou exoume eisagei
         JE NOCHAR       ;an einai iso ME 0 phgainei sthn etiketa nochar
         
      LEA DX,metatrmsg   ;ektypwsh mhnumatos metatrmsg 
      MOV AH,09
      INT 21H  
           
        
            STARTLOOP2:  ;etiketa 
   MOV AL, buffer [ DI ] ;apothikeush xarakthrwn sto buffer 
   INC DI                ;aukhsh counter DI kata 1
               
               
      CMP AL,33          ;sugkrish xarakthrwn
      JE PRINTCHAR       ;kai an einai iso me ! metaphdaei sthn etiketa printchar
      
      CMP AL,32          ;sugkrish xarakthrwn
      JE PRINTCHAR       ;kai an einai iso me space metaphdaei sthn etiketa printchar 
      
      CMP AL,46          ;sugkrish xarakthrwn
      JE PRINTCHAR       ;kai an einai iso me teleia(.)  metaphdaei sthn etiketa printchar
               
      CMP AL,90          ;sugkrish xarakthrwn
      JBE LOWER          ;kai an einai mikrotero h iso tou 'Z' metaphdaei sthn etiketa lower
      
      SUB AL,32          ;alliws an megalutero tou 'Z' afairei 32
      JMP PRINTCHAR      ;phgainei sthn etiketa printchar
                
                
              LOWER:     ;etiketa metatrophs pezwn se kefalaia
       ADD AL,32         ;prosthetoume 32 ston xarakthra
       JMP PRINTCHAR     ;phgainei sthn etiketa printchar
       
          PRINTCHAR:     ;etiket
       
       MOV DL,AL         ;ektupwsh xarakthrwn
       MOV AH,02
       INT 21H
               
        CMP SI,DI        ;sugkrish twn counter SI,DI
        JA  STARTLOOP2   ;an einai megalutero epistrefei sthn arxh ths etiketas
       
       JMP TELOS
          
               NOCHAR:  ;etiketa se periptwsh pou o xrhsths den exei eisagei xarakthres
      LEA DX,nochars    ;ektupwsh munhmatos nochars
      MOV AH,09
      INT 21H 
      
        TELOS:          ;etiketa 
      MOV AX,SI         ;metafora tou si sto ax
      DIV DEKA          ;diairesh me 10
      
      MOV DEKADA,AL     ;metafora tou al sth dekada
      MOV MONADA,AH     ;metafora tou ah sth monada
      
      ADD DEKADA,30H    ;metatroph se ascii
      ADD MONADA,30H    ;metatroph se ascii
      
      LEA DX,msg        ;ektupwsh munhmatos msg
      MOV AH,09
      INT 21H
      
   MOV DL,DEKADA        ; ektupwh dekadas
   MOV AH,02          
   INT 21H
   
   MOV DL,MONADA        ;ektupwsh monadas
   MOV AH,02
   INT 21H
      
      
MOV AH,4CH
INT 21H
Code ENDS
END Start