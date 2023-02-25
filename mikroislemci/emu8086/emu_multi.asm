  ORG 100

start:
;sayi1 : 4 = 2 + 2 BAYT
;: sayi1 in low    
;120 :low
;121 :hight
MOV WORD PTR [0100h],0003H  ;Carpanin 16-0 bitini bellege yerlestirdim
;sayi1 in  high  
;122 : low ee
;123 : hight ff
MOV WORD PTR [0102h],0000H   ;Carpanin 32-16 bitini bellege yerlestirdim  


;sayi2 
;124: dd low little
;125: ee hight big 
; sayi2 low
MOV WORD PTR [0104h],0002H   ;Carpilanin 16-0 bitini bellege yerlestirdim 
; sayi2 hight
MOV WORD PTR [0106h],0000H   ;Carpilanin 32-16 bitini bellege yerlestirdim

;sonuc 64 bit 32x32   
;200:00 low 
;201: 00 hight
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


MOV SI,32       ;Dongu sayacimiz Dec olarak 32      

tekrar:

MOV BX,[100h]  ;sayi1 low aktar bx:ffff
AND BX,01H 	; CARPANÝN LSB'SI DIÞINDA DÝÐER BÝTLERÝ 0LA ANDLE YANÝ 0 YAP (LSBYÝ 1 LE ANDLE YANÝ LSB ONCEDEN NEYSE SONRADAN DA O OLACAK)
XOR BX,01H	; CARPANÝN LSB BÝTÝ 0 MI DÝYE KONTROL ET 0 SA ZERO FLAG 0  A EÞÝTLENÝR
JZ topla_kaydir ; CARPANÝN LSB BÝTÝ 1 ÝSE ZERO FLAG 1 E EÞÝTLENÝR VE JZ DEKÝ FONKSÝYONA GÝT
CLC	; CARPANÝN LSB BÝTÝ 1 DEGÝLDÝR ZERO FLAG 0 DIR CARRYÝ TEMÝZLE


devam:

MOV AX,[0206h]
RCR AX,1        ;CARPIM SONUCUNUN 64-48 BÝTÝNÝ BÝR SAGA KAYDIR
MOV [0136h],AX
MOV BX,[0204h]      
RCR BX,1        ;CARPIM SONUCUNUN 48-32 BÝTÝNÝ BÝR SAGA KAYDIR
MOV [0134h],BX
MOV CX,[0202h]
RCR CX,1        ;CARPIM SONUCUNUN 32-16 BÝTÝNÝ BÝR SAGA KAYDIR
MOV [0132h],CX	
MOV DX,[0200h]
RCR DX,1        ;CARPIM SONUCUNUN 16-0  BÝTÝNÝ BÝR SAGA KAYDIR
MOV [0130h],DX	  
MOV AX,[0102h]
SHR AX,1        ;CARPANÝ BÝR BÝT SAGA KAYDIR
MOV [0122h],AX 
MOV BX,[0100h]
RCR BX,1        ;CARPANÝ BÝR BÝT SAGA KAYDIR AMA CARRY ÝLE BÝRLÝKTE GELÝRSE YANÝ CARPANÝN 32-16 BÝTÝNDEN GELEN ELDEYÝ DE KULLANARAK
MOV [0120h],BX 
   		
DEC SI		;DONGU DEGÝSKENÝNÝ AZALT
CMP SI,0	;DEGÝSKEN 0 MI DÝYE BAK	
JNZ tekrar	;SIFIR DEGÝ, KONTROLCUYE GÝT
JMP son		;UYGULAMAYI BÝTÝRMEYE GÝT 


topla_kaydir: 

MOV DX,[0104h]	;DX'E sayi2 low aktar
ADD [0204h],DX  ;CARPIMIN 48-32 BITINE BURADA CARRY ONEMLI DEGIL
MOV DX,[0106h]  ;DX'E CARPILANIN 32-16 BITINI KOPYALA
ADC [0106h],DX  ;CARPIMIN 64-48 BITINE CARRY I GOZ ONUNE ALARAK ATA
JMP devam  


son:

HLT		;SONUCLAR MSB DEN LSB YE 0136H-0130H BELLEK GOZLERINDE TUTULMAKTADIR
