<<"Soluzioni_guidate.m";

(*
Qui sono definite le funzioni per fornire esercizi casuali all'utente.
CaricaEsercizi si occupa di prendere gli esercizi da un file. Il file deve
essere composto da un esercizio per riga. 
Un esercizio è composta da: "traccia in latex" & "suggerimento" & "tipo"
La traccia viene usata per mostrare l'esercizio e per ottenere le soluzioni da WolframAlpha.
Il suggerimento è usato per aiutare l'utente e viene mostrato con un pulsante.
Il tipo è un numero (1 o 2) ed è usato internamente per capire se invocare WolframAlpha con gli integrali
indefiniti o definiti.
Il carattere '&' è utilizzato per separare traccia a suggerimento a tipo.
Inoltre il carattere '%' inserito all'inizio della riga fa ignorare la riga.
*)

prendiACaso::usage = "Funzione per ottenere un esercizio random da una lista di esercizi."
prendiACaso[esercizi_] := Module[{rand, es},
    rand = RandomInteger[{1, Length[esercizi]}]; (*Ottieni un numero random che va da 1 al totale degli esercizi*)
    es = Extract[esercizi, rand]; (*Estrai l'esercizio indicato dal numero random dalla lista di esercizi*)
    Return[es]]

mostraEsercizio::usage = "Funzione che data una lista di esercizi, ne estrae uno random e lo mostra all'utente insieme
a due bottoni. Il primo apre una finestra con il suggerimento per risolvere l'esercizio, il secondo apre una finestra
con la soluzione passo passo ottenuta da WolframAlpha. Serve una connessione ad internet attiva per questo."
mostraEsercizio[esercizi_] := CreateDialog[
    Module[{esex, traccia, wolfram, tipo, sol}, 
        esex = prendiACaso[esercizi]; (*Si prende un esercizio a caso con la funzione definita sopra. *)
        traccia = Extract[esex, 1]; (*L'esercizio preso è composto da traccia & suggerimento & tipo, qui si ottiene la traccia*)
        sugg = Extract[esex, 2]; (* Si ottiene il suggerimento *)
        tipo = ToExpression[Extract[esex, Length[esex]]]; (*Si ottiene il tipo*)
        sol := If[tipo == 1, stepIndefiniteFunction[traccia], stepDefiniteFunction[traccia]]; (* si invoca Wolfram in base al tipo*)
        Grid[ (*Griglia per formattare l'output visivo per l'utente*)
            {
                { MaTeX[ToString[traccia], Magnification -> 4], SpanFromLeft}, 
                { Framed[ButtonBar[{"Mostra il suggerimento!" :> MessageDialog[ (* Bottone che apre un MessageDialog per il suggerimento*)
                    Framed[sugg, BaseStyle -> 24, ImageSize -> {315, 125}, 
                        FrameStyle -> Red, RoundingRadius -> 10, Alignment -> Center]]}, 
                        ImageSize -> {300, 100}, Alignment -> Center, 
                        BaseStyle -> {Orange, 22, Italic, Bold, FontFamily -> "Times"}]],
                 "               ", 
                 Framed[Tooltip[ButtonBar[{"Soluzione guidata" :> MessageDialog[ (*Bottone per mostrare la soluzione di WolframAlpha*)
                    "Attendere il caricamento della soluzione."] sol}, Method -> "Queued", 
                    ImageSize -> {300, 100}, Alignment -> Center, 
                    BaseStyle -> {Orange, 22, Italic, Bold, FontFamily -> "Times"}], "Fammi vedere i passi!"], 
                    Alignment -> Center, RoundingRadius -> 5]
                },{},
                {DefaultButton["Close", DialogReturn[]], SpanFromLeft}
            }
        ]
    ]
]

caricaEsercizi::usage = "Funzione che carica esercizi dal file esercizi_misti.txt e ritorna una lista con gli esercizi.
Un esercizio è a sua volta una lista di 3 elementi. Il primo è una stringa contenente la traccia in latex, il secondo è la stringa
suggerimento, il terzo è il tipo di integrale. 1: indefinitio, 2: defintito. "
caricaEsercizi[] := Module[{exs},
    exs = {};
    f = OpenRead["esercizi_misti.txt"]; (*Apre il file*)
    While[True, 
        line = ReadLine[f]; (*Legge linea per linea*)
        If[line == EndOfFile, Break[]]; (*Si ferma se le righe sono finite*)
        If[StringStartsQ[line, "%"], Continue[]]; (*Se la linea inizia con % allora è un commento e viene ignorato*)
        entries = StringSplit[line, "&"]; (*Divide l'esercizio in 3 parti (traccia, sugg, tipo) *)
        AppendTo[exs, entries]; (*Mette l'esercizio nella lista*)
    ]
    Close[f]; (*Chiude il file*)
    Return[exs]; (*Restituisce la lista di esercizi*)
]
