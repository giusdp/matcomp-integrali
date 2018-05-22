<<"MaTeX`";
<<"Soluzioni_guidate.m";

(* il tipo di integrale è rappresentato da 1 e 2.
    1 : integrale indefinito
    2 : integrale definito
*)
esercizi = {
    {"\\int \\sin{x} dx", "Usa questa cosa", "sin(x)", 1},
    {"\\int \\cos{x} dx", "Usa quest'altra cosa", "cos(x)", 1},
    {"\\int x^2", "Usa il trucco pippo", "x^2 from a to b", 2}
};

prendiACaso[] := Module[{rand, es},
rand = RandomInteger[{1, Length[esercizi]}];
es = Extract[esercizi, rand];
Return[es]]

getList[] := Return[esercizi]
len[] := Return[Length[esercizi]]

buildSlide[] := For[i=0, i < 5,i++,Module[{esex, traccia, sugg, wolfram, tipo, sol}, 
    esex = prendiACaso[];
    traccia = Extract[esex, 1];
    sugg = Extract[esex, 2];
    wolfram = Extract[esex, 3];
    tipo = Extract[esex, Length[esex]];
    sol := If[tipo == 1, indefinitiStepByStep[wolfram], definitiStepByStep[wolfram]];
    Print[
        Grid[
            {
                {
                    Text["Esercizio " <> ToString[i+1]], MaTeX[traccia, Magnification->2]},{
                    PopupWindow[Button[Style["Mostra il suggerimento!", FontSize->Larger]], sugg]                    
                    PopupWindow[Button[Style["Guarda la soluzione!", FontSize->Larger]], sol]
                }
            }]
        ];
    ]
]
