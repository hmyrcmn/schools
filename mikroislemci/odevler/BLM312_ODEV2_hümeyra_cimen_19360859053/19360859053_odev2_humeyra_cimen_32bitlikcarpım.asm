  ORG 100 
; 0003,0003 * 0002,0002 = 0006,00006
                       ;6000,6
                      ; 0000,0600,000c,0006

start:                    
;sayi1 : 4 = 2 + 2 BAYT   bellekde yerlesim :low3 -0-0-0high  
;: sayi1 in low    
;100 :low   3
;101 :hight  0
MOV WORD PTR [0100h],0003H  
;sayi1 in  high  
;102 : low 3
;103 : hight 0 
MOV WORD PTR [0102h],0003H   


;sayi2 
;104: 02 low little
;105: 00 hight big 
; sayi2 low     bellekde yerlesim : low2 -0-0-0high
MOV WORD PTR [0104h],0002H   ;Carpilanin 16-0 bitini bellege yerlestirdim 
; sayi2 hight  
MOV WORD PTR [0106h],0002H   ;Carpilanin 32-16 bitini bellege yerlestirdim

;sonuc 64 bit 32x32 4 reg * 16 bit   
;200:00  low low 
;201: 00 hight
;206 : highest
MOV WORD PTR [0200h],0000h  ;low  last significant bit
MOV WORD PTR [0202h],0000h  
MOV WORD PTR [0204h],0000h  
MOV WORD PTR [0206h],0000h  ;hight most significant bit

SUB AX,AX
SUB BX,BX
SUB CX,CX
SUB DX,DX
SUB SI,SI
SUB DI,DI


MOV SI,20h       

tekrar:

MOV BX,[100h]  ;sayi1 low aktar bx:0003h
AND BX,01H 	; onemsiz biti elde etme 01 le and low haric hepsi sifir olacak low 0 and 1 =0 low 1 and 1 = 1 
XOR BX,01H	; if(low bit == 0) {zero set 0 }
JZ topla_kaydir ;else {zero set 1 }    ; topla kaydira git 
CLC


devam:  ; little endian low sign bit low bellek    
;saga kaydirma islemi
; with cary 
; 120-126 
MOV AX,[0206h]
RCR AX,1        
MOV [0206h],AX
MOV BX,[0204h]      
RCR BX,1        
MOV [0204h],BX
MOV CX,[0202h]
RCR CX,1        
MOV [0202h],CX	
MOV DX,[0200h]
RCR DX,1        
MOV [0200h],DX	  
MOV AX,[0102h]
SHR AX,1       
MOV [0102h],AX 
MOV BX,[0100h]
RCR BX,1        
MOV [0100h],BX 
   		
DEC SI		
CMP SI,0	 ;dongu dvm kosulu
JNZ tekrar	;else
JMP son		;if


topla_kaydir: 

MOV DX,[0104h]	;DX'E sayi2 low aktar
ADD [0204h],DX
MOV DX,[0106h]  
ADC [0206h],DX  ;yuksek bellek hucresine 2.sayinin high ini ata
JMP devam  


son:

HLT
