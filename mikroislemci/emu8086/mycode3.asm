
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here 
MOV BX,0200H

 MOV BYTE PTR [bx],55h
 MOV BYTE PTR [bx+1],66H
 MOV BYTE PTR [bx+2],54H
 MOV BYTE PTR [bx+3],11H
 MOV BYTE PTR [bx+4],87H
 MOV BYTE PTR [bx+5],33H
 MOV BYTE PTR [bx+6],75H
 MOV BYTE PTR [bx+7],05H
 MOV BYTE PTR [bx+8],5FH
 MOV BYTE PTR [bx+9],23H

 J2:


         org 100h
         MOV BX,0200H
         MOV SI,1
        
         MOV DL,[BX] ;en kusuck sayiyi tutan register
         MOV DH,00 ;en kusuck sayiyinin dizideki sirasini tutan register
        J1:
         MOV AL,[BX+SI] ; 0700:0200 taban adresindeki (SI ile indekslenmi�) ilgili byte al�r
        
         CMP AL,DL
         JAE devam ;ele al�nan say� daha k���k de�ilse
        
         MOV DX,SI
         MOV DH,DL ;yeni en k���k say�n�n indisi kopyalan�r
         MOV DL,AL ;yeni en kucuk sayi kopyalanir
        devam:
         INC SI
        
         CMP SI,10
         JNZ J1
        
         HLT 
         
   

ret




