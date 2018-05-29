<<MaTeX`
Sol1::usage = "Mostra la soluzione passo passo in una nuova finestra dell'esempio 1."
Sol2::usage = "Mostra la soluzione passo passo in una nuova finestra dell'esempio 2"
stepIndefiniteFunction::usage = "Utilizza WolframAlpha per mostrare la soluzione dell'integrale indefinito passato
in input. La soluzione viene mostrata in una nuova finestra. Serve una connessione ad internet attiva."
stepDefiniteFunction::usage = "Utilizza WolframAlpha per mostrare la soluzione dell'integrale definito passato
in input. La soluzione viene mostrata in una nuova finestra. Serve una connessione ad internet attiva."

(* Sol1 è la finestra con la soluzione del primo esempio a cui vogliamo mostrare passo passo la soluzione.
E' costituita da una PopupWindow aperta tramite il Button "Vuoi vedere la soluzione?". Ed apre una TabView
dove ogni tab è un passo della soluzione con qualche informazione su come ci si è arrivati. *)
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

(* Sol2 è la finestra con la soluzione del primo esempio a cui vogliamo mostrare passo passo la soluzione.
E' costituito da una popup window aperta tramite il Button "Vuoi vedere la soluzione?". Ed apre una TabView
dove ogni tab è un passo della soluzione con qualche informazione su come ci si è arrivati. *)
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

(* Funzione step-by-step a cui passare stringa per integrali indefiniti *)
stepIndefiniteFunction[integrand_] := CreateDialog[
   Column[{WolframAlpha[integrand, {{"IndefiniteIntegral", 2}, "Content"},
    PodStates -> {"IndefiniteIntegral__Step-by-step solution"}], 
     DefaultButton["Close", DialogReturn[]]}], WindowTitle -> "Soluzione Guidata!", 
     WindowSize -> {500, 700}, Modal -> True, WindowElements -> "VerticalScrollBar"];

(* Funzione step-by-step a cui passare stringa per integrali definiti *)
stepDefiniteFunction[integrand_] := CreateDialog[
   Column[ { 
     Pane[WolframAlpha[integrand, {{"Input", 2}, "Content"}, 
       PodStates -> {"Input__Step-by-step solution"}] ], 
     DefaultButton["Close", DialogReturn[]]}], WindowTitle -> "Soluzione Guidata!", WindowSize -> {500, 700}, Modal -> True, 
   WindowElements -> "VerticalScrollBar"];