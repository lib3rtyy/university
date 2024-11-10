     TITLE MYPROGRAM
DEDOMENA SEGMENT
    x1 db 7
    x2 db 9
    x3 db 6
    x4 db 2
   result db 0
    msg db "The result is: $"
DEDOMENA ENDS
KODIKAS SEGMENT
ARXH: MOV AX,DEDOMENA
      MOV DS,AX    
      MOV AL,x1
      MOV BL,x2
      MOV CL,x3
      MOV DL,x4
      
      ADD AL,BL
      SUB AL,CL
      SUB AL,DL
      MOV result,AL   
      
      LEA DX,msg 
      ADD DX,30H
      MOV AH,02
      INT 21H

MOV AH,4CH
INT 21H
KODIKAS ENDS
END ARXH