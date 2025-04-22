ORG 100h              ; standardowy offset dla plików COM

MOV AH, 0Ah           ; funkcja do wczytania stringa
LEA DX, bufor         ; adres bufora
INT 21h               ; wczytujemy dane

MOV AH, 02h           ; funkcja do wypisywania znaku
MOV DL, bufor[4]      ; trzeci znak stringa (bo dane od bufor+2)
INT 21h               ; wypisujemy go

MOV AH, 4Ch           ; zakończenie programu
INT 21h

bufor DB 10, ?, 10 DUP(?)  ; struktura bufora: max, faktyczna liczba, miejsce na dane