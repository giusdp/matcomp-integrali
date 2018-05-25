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
    Print[MaTeX[ToString[traccia], Magnification->4]];
    Print[
        Grid[{
            {
                Framed[Tooltip[ButtonBar[{"Mostra il suggerimento!" :> MessageDialog["\t\t\tSuggerimento:\n"
                    Framed[sugg, BaseStyle-> u24, ImageSize->{315, 125}, FrameStyle->Red, 
                    RoundingRadius->10, Alignment->Center]]}, ImageSize->{300, 100}, Alignment->Center, 
                    BaseStyle->{Orange, 22, Italic, Bold, FontFamily->"Times"}], "Fammi vedere il suggerimento!"],
                    Alignment->Center, RoundingRadius->5], 
                "               ",
                Framed[
                    Tooltip[
                        ButtonBar[
                            {"Soluzione guidata" :> MessageDialog["Attendere il caricamento della soluzione."] sol},
                            Method->"Queued", ImageSize->{300, 100}, Alignment->Center, BaseStyle->{Orange, 22, Italic, Bold, FontFamily->"Times"}
                        ], "Fammi vedere i passi!"], 
                    Alignment->Center, RoundingRadius->5
                ]
            }
            }
        ]
    ]
]

caricaEsercizi[] := Module[{exs},
    exs = {};
    f = OpenRead["esercizi_misti.txt"];
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
