org 100h         


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
 ; 200h den baslayarak memory yerleþtirildi



MOV BX,0200H    ; memory dekilerin baslangici
MOV DI,0        ; sayac1
MOV SI,0        ; sayac2


J1:            ; loop
MOV DL,[BX+DI] ; min deger oyle sayildi kontrol den sonra degistiriliyor
MOV SI,DI      
INC SI         ; SI ++

        J2:            ; LOOP
        MOV AL,[BX+SI]  
        CMP AL,DL      ; kosul buyukmu  
        
        JB fonk           ; kosul saglandi ise  buyukse FONK CAGRILDI
        INC SI         ; SI ++
        CMP SI,09      ; if kontrol
        JBE J2         ; ELSE DURUMU
                 
    INC DI         ; DI++
    CMP DI,09      ;if kontrol L1 devam kosulu 
    JB J1          ; else DEVAM ET
    HLT            ; if BITIR
        
    
    fonk:   ;DEGER DESÝÞTÝRME ÝSLEMÝ
    MOV CL,AL ; TEMP
    MOV AL,DL ; DL MÝN ELEMAN 
    MOV DL,CL  
            
            ; INDIS DEGISTIRME ADRES
MOV CL ,[BX+SI]         ; TEMP
MOV BYTE PTR [BX+SI],AL ; AL MIN ELEMAN ARTIK 
MOV BYTE PTR [BX+DI],CL ; ADRESLER DEGISTI



INC SI          ; IC DONGU DEGISKENINI YANI WALKERI 1 ARTTIR    
CMP SI,9       ; KONTROL SAYAC KAC   0-9 ARASI 10KONTROL YAPILIR
JBE J2          ;ELSE:  IC J2 DONGUYE DALLAN
JA J1           ; ÝF: DIS DONGUYE J1 DALLAN 





