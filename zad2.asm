ORG 100h

MOV AH, 09h         ; funkcja DOS: wypisz string zakończony znakiem $
LEA DX, tekst       ; załaduj adres tekstu do rejestru DX
INT 21h             ; wywołanie funkcji DOS

MOV DL, 0Ah         ; nowa linia w dół
MOV AH, 02h
INT 21h

MOV DL, 0Dh         ;  powrót kursora na początek linii
MOV AH, 02h
INT 21h

MOV AH, 09h         ; znowu funkcja do wypisywania tekstu
LEA DX, tekstSkrocony ; adres skróconego tekstu
INT 21h           

MOV AH, 4Ch         ; zakończ program
INT 21h

tekst DB 'mhyla to mega ziomek$'
tekstSkrocony DB 'mhy$'  ; pierwsze 3 znaki z tekstu
