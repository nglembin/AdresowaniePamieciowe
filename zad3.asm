ORG 100h

MOV AH, 0Ah
LEA DX, bufor
INT 21h               ; wczytujemy string

MOV SI, bufor + 2     ; początek tekstu
MOV CL, bufor[1]      ; długość tekstu
MOV CH, 0
ADD SI, CX            ; przesuwamy się na koniec tekstu
MOV BYTE PTR [SI], '$' ; dodajemy '$' na koniec

MOV AH, 09h
LEA DX, bufor + 2
INT 21h               ; wypisujemy cały string zakończony '$'

MOV AH, 4Ch
INT 21h

bufor DB 20, ?, 20 DUP(?)
