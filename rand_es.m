<<"Soluzioni_guidate.m";

prendiACaso[esercizi_] := Module[{rand, es},
    rand = RandomInteger[{1, Length[esercizi]}];
    es = Extract[esercizi, rand];
    Return[es]]

mostraEsercizio[esercizi_] := Module[{esex, traccia, sugg, wolfram, tipo, sol},
    esex = prendiACaso[esercizi];
    traccia = Extract[esex, 1];
    sugg = Extract[esex, 2];
    (*wolfram = Extract[esex, 3];*)
    tipo = ToExpression[Extract[esex, Length[esex]]];
    sol := If[tipo == 1, stepIndefiniteFunction[traccia], stepDefiniteFunction[traccia]];
    Return[
        GridBox[
            {
                {
                    MaTeX[ToString[traccia], Magnification->2]
                },
                {
                    Framed[ Button[Style["Mostra il suggerimento!", FontSize->Larger], mostraSugg[sugg]]
                        Button[Style["Vedi la soluzione guidata!", FontSize->Larger], sol, Method->"Queued"], 
                        FrameStyle->Directive[Orange, 82], RoundingRadius->10, Alignment->Baseline]
                }
            }, RowSpacings->5] // DisplayForm
        ];
    ]

caricaEsercizi[] := Module[{exs},
    exs = {};
    f = OpenRead["test_es.txt"];
    While[True, 
        line = ReadLine[f];
        If[line == EndOfFile, Break[]];
        If[StringStartsQ[line, "%"], Continue[]];
        entries = StringSplit[line, "&"];
        AppendTo[exs, entries];
    ]
    Close[f];
    Return[exs];
]


mostraSugg[sugg_] := MessageDialog[Cell[Pane[sugg]]];