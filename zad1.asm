ORG 100h

; struktura bufora do funkcji 0Ah
buf:
DB 20             ; maksymalna długość – 20 znaków
DB 0              ; faktyczna długość wpisanego tekstu (uzupełnia DOS)
buf_dane DB 20 DUP(0) ; tutaj będą wpisane znaki – od trzeciego bajtu

MOV DX, buf       ; ustawiamy adres bufora do rejestru DX
MOV AH, 0Ah       ; funkcja 0Ah – wczytaj string
INT 21h           ; uruchamiamy – użytkownik wpisuje dane

MOV SI, buf + 2   ; pierwszy znak stringa jest w buf + 2
ADD SI, 2         ; przesuwamy się do trzeciego znaku (czyli bajt nr 4)
MOV AL, [SI]      ; ładujemy ten trzeci znak do AL

MOV DL, AL        ; kopiujemy znak do DL (bo int 21h / AH=02h używa DL)
MOV AH, 02h       ; funkcja: wypisz pojedynczy znak
INT 21h           ; wypisujemy

INT 20h           ; zakończ program
