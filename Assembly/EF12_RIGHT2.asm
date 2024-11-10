TITLE MYPROGRAM
DEDOMENA SEGMENT

DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX

     CALL  setgraphicsmode 
      
     
       MOV AX,100
       MOV BX,160 
       MOV CX,40
     
     CALL drawline_horizontal_right2
     
       MOV AX,100
       MOV BX,160 
       MOV CX,40 
       
     

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
     
   putpixel PROC 
      PUSH AX
      PUSH DX
      PUSH BX 
      PUSH SI
      PUSH ES
      
      
     MOV DX,320
     
     MOV AX,DX
     SHL AX,6
     MOV BX,DX
     SHL BX,8
     ADD AX,BX
     MOV SI, AX
     MOV BX,0A000H
     MOV ES,BX
     MOV ES:[SI],09H
     
     POP ES
     POP SI     
     POP BX
     POP DX
     POP AX
     RET
   putpixel endp 
     
      
    


       drawline_horizontal_right2 proc 
        
           PUSH AX
      PUSH BX
      PUSH CX
      PUSH DX  
      PUSH SI
      PUSH ES  
        
       MOV DX,320
        MOV AX,DX
     SHL AX,6
     MOV BX,DX
     SHL BX,8
     ADD AX,BX 
       ADD AX,BX 
       MOV SI, AX 
     MOV BX,0A000H
     MOV ES,BX 
        
        drawline_horizontal_right_2_again: 
         MOV ES:[SI],0909H
         INC SI
         inc si
        LOOP drawline_horizontal_right_2_again
        
      POP ES
      POP SI  
      POP DX  
      POP CX    
      POP BX
      POP AX  
        RET
        ret  
        
       drawline_horizontal_right2 endp
          
          
          
          
          

KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH