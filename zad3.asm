ORG 100h

; bufor na dane
buf:
DB 100             ; maksymalna długość stringa (może być duży)
DB 0               ; tutaj DOS zapisze faktyczną długość
dane DB 100 DUP(0) ; miejsce na dane od użytkownika

MOV DX, buf        ; ustawiamy bufor
MOV AH, 0Ah        ; funkcja 0Ah – wczytaj ciąg znaków
INT 21h

; wypisujemy nową linię
MOV DX, OFFSET newline
MOV AH, 09h
INT 21h

; teraz dokładamy znak '$' na końcu stringa
MOV SI, buf + 1    ; SI wskazuje długość wpisanego ciągu
MOV CL, [SI]       ; CL = długość wpisanego ciągu
MOV SI, buf + 2    ; SI wskazuje na pierwszy znak danych
ADD SI, CX         ; przesuwamy się na koniec stringa
MOV BYTE [SI], '$' ; tam wstawiamy kończący znak '$'

MOV DX, buf + 2    ; DX wskazuje na początek wpisanego stringa
MOV AH, 09h        ; wypisujemy string zakończony '$'
INT 21h

INT 20h            ; koniec
newline DB 0Dh, 0Ah, '$'
