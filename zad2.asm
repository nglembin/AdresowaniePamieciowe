ORG 100h

MOV AH, 09h           ; funkcja do wypisywania stringa
LEA DX, napis         ; adres stringa
INT 21h               ; wypisujemy aż do '$'

MOV AH, 02h           ; nowa linia – CR
MOV DL, 0Dh
INT 21h

MOV DL, 0Ah           ; nowa linia – LF
INT 21h

MOV AH, 02h           ; wypisujemy 3. znak stringa
MOV DL, napis[2]
INT 21h

MOV AH, 4Ch
INT 21h

napis DB 'mhyla to mega ziomek$', 0Dh, 0Ah  ; string z zakończeniem '$' i enterem