<<"Soluzioni_guidate.m";

prendiACaso[esercizi_] := Module[{rand, es},
    rand = RandomInteger[{1, Length[esercizi]}];
    es = Extract[esercizi, rand];
    Return[es]]

mostraEsercizi[esercizi_] := Module[{esex, traccia, sugg, wolfram, tipo, sol},
    esex = prendiACaso[esercizi];
    traccia = Extract[esex, 1];
    sugg = Extract[esex, 2];
    (*wolfram = Extract[esex, 3];*)
    tipo = ToExpression[Extract[esex, Length[esex]]];
    sol := If[tipo == 1, indefinitiStepByStep[traccia], definitiStepByStep[traccia]];
    Return[
        GridBox[
            {
                {
                    MaTeX[ToString[traccia], Magnification->2]
                },
                {
                    Framed[ Button[Style["Mostra il suggerimento!", FontSize->Larger], MessageDialog[sugg]] 
                        PopupWindow[Button[Style["Vedi la soluzione guidata!", FontSize->Larger]], Pane[sol, ScrollBars->True], WindowTitle->"Soluzione!",
                        WindowSize->{800, 440}, Editable->True],
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