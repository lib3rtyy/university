TITLE MYPROGRAM
DEDOMENA SEGMENT

DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
MOV DS,AX

     CALL  setgraphicsmode 
     
       ;MOV AX,10
       ;MOV BX,150 
       ;MOV CX,35
       
    ; CALL  drawline1 
     
       MOV AX,100
       MOV BX,160 
       MOV CX,40
     
     CALL drawline_horizontal_right
     
       MOV AX,100
       MOV BX,160 
       MOV CX,40 
       
     CALL drawline_horizontal_left
     
       MOV AX,100
       MOV BX,160 
       MOV CX,40  
                 
    CALL  drawline_vertical_top 
    
       MOV AX,100
       MOV BX,160 
       MOV CX,40
       
    CALL drawline_vertical_bottom           
    
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
     MUL DX 
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
     
      
     drawline1 PROC
      PUSH AX
      PUSH BX
      PUSH CX

       
       drawline1_loop:
         CALL  putpixel
         INC   BX
       
       LOOP drawline1_loop
       
      POP CX    
      POP BX
      POP AX
     RET
     drawline1 endp
      
     
    drawline_horizontal_right PROC 
      PUSH AX
      PUSH BX
      PUSH CX
      PUSH DX  
      PUSH SI
      PUSH ES  
        
       MOV DX,320
       MUL DX 
       ADD AX,BX 
       MOV SI, AX 
     MOV BX,0A000H
     MOV ES,BX 
        
        drawline_horizontal_right_again: 
         MOV ES:[SI],09H
         INC SI
        LOOP drawline_horizontal_right_again
        
      POP ES
      POP SI  
      POP DX  
      POP CX    
      POP BX
      POP AX  
        RET
    drawline_horizontal_right ENDP 
    
     
     
     
      drawline_horizontal_left PROC
        
        
      PUSH AX
      PUSH BX
      PUSH CX
      PUSH DX  
      PUSH SI
      PUSH ES  
        
       MOV DX,320
       MUL DX 
       ADD AX,BX 
       MOV SI, AX 
     MOV BX,0A000H
     MOV ES,BX 
        
        drawline_horizontal_left_again: 
         MOV ES:[SI],09H
         DEC SI
        LOOP drawline_horizontal_left_again
        
      POP ES
      POP SI  
      POP DX  
      POP CX    
      POP BX
      POP AX 
         

        RET
      drawline_horizontal_left ENDP
     
     
      
      drawline_vertical_top  PROC 
        
      PUSH AX
      PUSH BX
      PUSH CX
      PUSH DX  
      PUSH SI
      PUSH ES  
        
       MOV DX,320
       MUL DX 
       ADD AX,BX 
       MOV SI, AX 
     MOV BX,0A000H
     MOV ES,BX 
        
        drawline_vertical_top_again: 
         MOV ES:[SI],09H
         SUB SI,320
        LOOP drawline_vertical_top_again
        
      POP ES
      POP SI  
      POP DX  
      POP CX    
      POP BX
      POP AX
        
        
       RET
      drawline_vertical_top ENDP 
      
      
      
      drawline_vertical_bottom proc
        
            PUSH AX
      PUSH BX
      PUSH CX
      PUSH DX  
      PUSH SI
      PUSH ES  
        
       MOV DX,320
       MUL DX 
       ADD AX,BX 
       MOV SI, AX 
       MOV BX,0A000H
       MOV ES,BX 
        
        drawline_vertical_bottom_again: 
         MOV ES:[SI],09H
         ADD SI,320
         LOOP drawline_vertical_bottom_again
        
      POP ES
      POP SI  
      POP DX  
      POP CX    
      POP BX
      POP AX
        
        
       RET 
        
      drawline_vertical_bottom endp
      
      
      
      
      
     

KODIKAS ENDS
SOROS SEGMENT STACK
db 256 dup(0)
SOROS ENDS
END ARXH