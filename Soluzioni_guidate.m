<<MaTeX`

Sol1 = PopupWindow[
    Button[Style["Vuoi vedere la soluzione?", FontSize->Large]],

    TabView[
            {
                (*Text[Style[" Trucco >>> ", 28, Orange, Bold]] 
                    -> Text[Style["\n Seguire i passi per vedere la soluzione ->", 24]],*)
                Text[Style["Primo Passo", 28, Orange, Bold]] 
                    -> Text["Dobbiamo quindi risolvere:\n" 
                        Framed[MaTeX["\\int f(x) \,dx=\\int\\left[ 3e^x+2x^2-\\frac{1}{2}\\cos x \\right] \, dx", Magnification->3], 
                        BaseStyle->{Orange}], BaseStyle->{FontSize->24}],
                Text[Style["Secondo Passo", 28, Orange, Bold]]
                    -> Text["Utilizziamo la 1° proprietà di linearità per spezzare l'integrale \nin tre pezzi, facendolo diventare uguale a \n" 
                        Framed[MaTeX["\\int 3e^x\, dx+\\int 2x^2\, dx-\\int \\frac{1}{2}\\cos x\, dx", Magnification->3],BaseStyle->{Orange}], 
                        BaseStyle->{FontSize->24}],
                Text[Style["Terzo Passo", 28, Orange, Bold]] 
                    -> Text["Utilizziamo poi la 2° proprietà di linearità per portar fuori le varie \ncostanti dai tre integrali, quindi avremo\n"
                        Framed[MaTeX["3\\int e^x\, dx+2\\int x^2\, dx-\\frac{1}{2}\\int \\cos x\, dx", Magnification->3], BaseStyle->{Orange}], 
                        BaseStyle->{FontSize->24}], 
                Text[Style["Quarto Passo", 28, Orange, Bold]]
                    -> Text["Ora, dalla tabella degli integrali fondamentali ricaviamo \nil risultato finale:\n" 
                        Framed[MaTeX["3e^x+\\frac{2}{3}x^3-\\frac{1}{2}\\sin x + C", Magnification->3], BaseStyle->{Orange}], 
                        BaseStyle->{FontSize->24}]
            },
            Appearance->Large
        ],

    WindowTitle->"Soluzione Guidata", WindowSize->All]

Sol2 = PopupWindow[ 
    Button[Style["Vuoi vedere la soluzione?", FontSize->Large]],

    TabView[
        {
            (*Text[Style[" Trucco >>> ", 28, Orange, Bold]] 
                -> Text[Style["\n Seguire i passi per vedere la soluzione passo dopo passo...\n", 24]],*)
            Text[Style["Primo Passo", 28, Orange, Bold]] 
                -> Text["Utilizzando la proprieta' di linearità vado a spezzare l'integrale in due pezzi:\n"
                    Framed[MaTeX["\\int_{1}^{e} 3x^2+\\int_{1}^{e}-\\frac{2}{x} \, dx", Magnification->3], BaseStyle->{Orange}],
                    BaseStyle->{FontSize->24}],
            Text[Style["Secondo Passo", 28, Orange, Bold]]
                -> Text["Usiamo la 2° proprieta' di linearità per portare fuori le varie costanti \ndagli integrali:\n" 
                    Framed[MaTeX["3\\int_{1}^{e} x^2 \, dx-2\\int_{1}^{e}\\frac{1}{x} \, dx", Magnification->3],BaseStyle->{Orange}], 
                    BaseStyle->{FontSize->24}],
            Text[Style["Terzo Passo", 28, Orange, Bold]] 
                -> Text["Risolviamo separatamente i due integrali fondamentali e quindi:\n" 
                    Framed[MaTeX["3\\int_{1}^{e} x^2 \,dx=3((\\frac{1}{3}e^3)-\\frac{1}{3}1^3) \\quad e \\quad -2\\int_{1}^{e} \\frac{1}{x} \,dx= -2\\log (\\frac{e}{1})", Magnification->3], 
                    BaseStyle->{Orange}], BaseStyle->{FontSize->24}], 
            Text[Style["Quarto Passo", 28, Orange, Bold]] 
                -> Text["Rimettendoli insieme avremo: \n" 
                    Framed[MaTeX["3((\\frac{1}{3}e^3)-\\frac{1}{3}1^3)-2\\log (\\frac{e}{1})=e^3-3", Magnification->3], 
                    BaseStyle->{Orange}], BaseStyle->{FontSize->24}]}, Appearance->Large],
    
    WindowTitle->"Soluzione Guidata", WindowSize->All];


(*
indefinitiStepByStep[integrand_] := WolframAlpha[StringJoin["integrate ", integrand], {{"IndefiniteIntegral", 2}, "Content"},
 PodStates -> {"IndefiniteIntegral__Step-by-step solution"}];

definitiStepByStep[integrand_] := WolframAlpha[StringJoin["integrate ", integrand], {{"Input", 2}, "Content"}, PodStates -> {"Input__Step-by-step solution"}];

definitiStepByStepNascosto[integrand_] := WolframAlpha[StringJoin["integrate ",integrand], IncludePods -> "Input", AppearanceElements -> {"Pods"}, PodStates -> {"Show steps"}];
*)


(* Funzione step-by-step a cui passare stringa per integrali indefiniti *)
stepIndefiniteFunction[integrand_] := CreateDialog[
   Column[{WolframAlpha[integrand, {{"IndefiniteIntegral", 2}, "Content"},
    PodStates -> {"IndefiniteIntegral__Step-by-step solution"}], 
     DefaultButton["Close", DialogReturn[]]}], WindowTitle -> "Soluzione Guidata!", 
     WindowSize -> {600, 700}, Modal -> True, WindowElements -> "VerticalScrollBar"];

(* Funzione step-by-step a cui passare stringa per integrali definiti *)
stepDefiniteFunction[integrand_] := CreateDialog[
   Column[ { 
     Pane[WolframAlpha[integrand, {{"Input", 2}, "Content"}, 
       PodStates -> {"Input__Step-by-step solution"}] ], 
     DefaultButton["Close", DialogReturn[]]}], WindowTitle -> "Soluzione Guidata!", WindowSize -> {600, 700}, Modal -> True, 
   WindowElements -> "VerticalScrollBar"];