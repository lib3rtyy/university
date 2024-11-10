TITLE MYPROGRAM
DEDOMENA SEGMENT
     point dw 0
     colour db 0
     height db 0   
     height1 dw 0
     length dw 0
     x dw 0
     y dw 0
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX

     CALL  setgraphicsmode 
     

     ;CALL  print_color_palette
       
     
     
     mov dl,9
     mov bx,80
     mov ax, 28
     mov cx,40
     mov dh,20
     call print_a_box            
      CALL print_a_box_with_fill        
    
MOV AH,4CH
INT 21H

   setgraphicsmode PROC
      PUSH AX 
      PUSH DX
       
       MOV AH,0
       MOV AL,13H
       INT 10H 
       
      POP DX
      POP AX 
      
      RET
   setgraphicsmode endp
     
    print_color_palette PROC 
            
         PUSH BX
         PUSH DX
         PUSH DI
         PUSH ES
         MOV DL,1   
            
            
          MOV CX,255 
           _external_loop:
           PUSH CX

             mov CX,160 
           _internal_loop:
            MOV BX,0A000H
             MOV ES,BX 
              MOV ES:[SI],DL   
               MOV ES:[SI+320],DL

         loop _internal_loop
          pop CX
          inc dl 


            mov CX,160 
           _internal_loop2:
             MOV BX,0A000H
             MOV ES,BX 
              MOV ES:[SI],DL   
               MOV ES:[SI+320],DL 
               
               
             INC SI
         loop _internal_loop2
           pop CX
         inc dl 
        add si,320 
         loop _external_loop  
            
            
    
          POP ES 
          POP DI
           POP DX
           POP BX  
        RET
        print_color_palette ENDP
 
     
    print_a_box PROC
        
          MOV X,BX
          MOV Y,AX
          MOV LENGTH ,CX
          MOV HEIGHT,DH
          MOV COLOUR,DL
          MOV BX,AX
          SHL AX,6
          SHL BX,8
          ADD AX,BX
          ADD AX,X
          MOV DI,AX
          MOV POINT,DI
          MOV DL,DH
          MOV DH,0
          MOV AX,320
          MUL DX
          MOV HEIGHT1,AX
          MOV BX,0A000H
          MOV ES,BX
            
            AGAIN1:
            MOV DI,POINT
            ADD DI,CX
            MOV ES:[DI],9
            MOV DI,POINT
            SUB DI,CX
            MOV ES:[DI],9
            MOV DI,POINT
            SUB DI,AX
            ADD DI,CX
             MOV ES:[DI],9
             MOV DI,POINT
            SUB DI,AX
            SUB DI,CX
            MOV ES:[DI],9
            INC DI
            LOOP AGAIN1
            
            
            MOV DH,0
            MOV DL,HEIGHT
            MOV CX,DX
            MOV DI,POINT
            SUB DI,LENGTH
            MOV POINT,DI
            
              AGAIN2:
              MOV ES:[DI],9
              PUSH DI  
              MOV DX,LENGTH
              SHL DX,1
              ADD DI,DX
              MOV ES:[DI],9
              POP DI
              SUB DI,320
              LOOP AGAIN2
             
            

          
          RET
        print_a_box ENDP  
                                   
                                   
                                   
         print_a_box_with_fill PROC
              PUSH BX
              PUSH DX
              PUSH SI
              PUSH ES
         mov si,41
         mov dl,40
         mov cx,19  
            
            
          
           _external_loop1:
           PUSH CX

             MOV CX,80 
           _internal_loop1:
            MOV BX,0A0A0H
             MOV ES,BX 
              MOV ES:[SI],DL   
               MOV ES:[SI+320],DL
               INC SI
         loop _internal_loop1
          pop CX
          inc dl
          add si,240 

             
         loop _external_loop1  
           POP ES 
           POP SI
           POP DX
           POP BX
            
            RET
            print_a_box_with_fill ENDP
      
     

KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH