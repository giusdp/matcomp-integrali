<<MaTeX`

Sol1 = PopupWindow[
    Button[Style["Vuoi vedere la soluzione?", FontSize->Large]],
    TabView[{Text[Style[" Trucco >>> ", 36, Orange, Bold]] -> Text[Style["\n Seguire i passi per vedere la soluzione passo dopo passo...\n\n", 44]],
    Text[Style["Primo Passo", 36, Orange, Bold]] -> Text["Dobbiamo quindi risolvere:\n\n" Framed[MaTeX["\\int f(x) \,dx=\\int\\left[ 3e^x+2x^2-\\frac{1}{2}\\cos x \\right] \, dx", Magnification->3], BaseStyle->{Orange}], BaseStyle->{FontSize->32}],
    Text[Style["Secondo Passo", 36, Orange, Bold]] -> Text["Usiamo la II proprieta' di linearita' per portare fuori le varie costanti dagli integrali:\n\n" Framed[MaTeX["3\\int_{1}^{e} x^2 \, dx-2\\int_{1}^{e}\\frac{1}{x} \, dx", Magnification->3],BaseStyle->{Orange}], BaseStyle->{FontSize->32}],
    Text[Style["Terzo Passo", 36, Orange, Bold]] -> Text["Risolviamo separatamente i due integrali fondamentali e quindi:\n\n" Framed[MaTeX["3\\int_{1}^{e} x^2 \,dx=3((\\frac{1}{3}e^3)-\\frac{1}{3}1^3) \\quad e \\quad -2\\int_{1}^{e} \\frac{1}{x} \,dx= -2\\log (\\frac{e}{1})", Magnification->3], BaseStyle->{Orange}], BaseStyle->{FontSize->32}], 
    Text[Style["Quarto Passo", 36, Orange, Bold]] -> Text["Rimettendoli insieme avremo: \n\n" Framed[MaTeX["3((\\frac{1}{3}e^3)-\\frac{1}{3}1^3)-2\\log (\\frac{e}{1})=e^3-3", Magnification->3], BaseStyle->{Orange}], BaseStyle->{FontSize->32}]}, Appearance->Large],
    WindowTitle->"Soluzione Guidata", WindowSize->All
]

Sol2 = PopupWindow[ 
    Button[Style["Vuoi vedere la soluzione?", FontSize->Large]],
    TabView[{Text[Style[" Trucco >>> ", 36, Orange, Bold]] -> Text[Style["\n Seguire i passi per vedere la soluzione passo dopo passo...\n\n", 44]],
    Text[Style["Primo Passo", 36, Orange, Bold]] -> Text["Utilizzando la proprieta' di linearita' vado a spezzare l'integrale in due pezzi:\n\n" Framed[MaTeX["\\int_{1}^{e} 3x^2+\\int_{1}^{e}-\\frac{2}{x} \, dx", Magnification->3], BaseStyle->{Orange}], BaseStyle->{FontSize->32}],
    Text[Style["Secondo Passo", 36, Orange, Bold]] -> Text["Usiamo la II proprieta' di linearita' per portare fuori le varie costanti dagli integrali:\n\n" Framed[MaTeX["3\\int_{1}^{e} x^2 \, dx-2\\int_{1}^{e}\\frac{1}{x} \, dx", Magnification->3],BaseStyle->{Orange}], BaseStyle->{FontSize->32}],
    Text[Style["Terzo Passo", 36, Orange, Bold]] -> Text["Risolviamo separatamente i due integrali fondamentali e quindi:\n\n" Framed[MaTeX["3\\int_{1}^{e} x^2 \,dx=3((\\frac{1}{3}e^3)-\\frac{1}{3}1^3) \\quad e \\quad -2\\int_{1}^{e} \\frac{1}{x} \,dx= -2\\log (\\frac{e}{1})", Magnification->3], BaseStyle->{Orange}], BaseStyle->{FontSize->32}], 
    Text[Style["Quarto Passo", 36, Orange, Bold]] -> Text["Rimettendoli insieme avremo: \n\n" Framed[MaTeX["3((\\frac{1}{3}e^3)-\\frac{1}{3}1^3)-2\\log (\\frac{e}{1})=e^3-3", Magnification->3], BaseStyle->{Orange}], BaseStyle->{FontSize->32}]}, Appearance->Large],
    WindowTitle->"Soluzione Guidata", WindowSize->All
    ];