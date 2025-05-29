ORG 100h

MOV DX, OFFSET calyTekst
MOV AH, 09h       ; wypisujemy cały string (do '$')
INT 21h

MOV DX, OFFSET nowaLinia
MOV AH, 09h       ; wypisujemy znak nowej linii (0Dh 0Ah)
INT 21h

MOV DX, OFFSET do3znaku
MOV AH, 09h       ; wypisujemy tylko do trzeciego znaku, zakończonego '$'
INT 21h

INT 20h           ; koniec

; teksty
calyTekst  DB 'GLEMBIN$', 0
nowaLinia  DB 0Dh, 0Ah, '$'
do3znaku   DB 'GLE$', 0    ; tylko 3 znaki + '$'
