(*grafico1 - Grafico degli logaritmi*)
grafico1::usage = "Visualizza i tre grafici della funzione logaritmica, f(x)=log(x)"
(* definisco i tre punti di rifferimento ossia sinistra, centro e desta*)

align[Right] = {1, 0};
align[Center] = {0, 0}; 
align[Left] = {-1, 0};

(* definisco lo stile del testo che voglio scrivere *)

lText = Text[Style["a", Blue, Bold, FontSize->20], {1.8, -0.1}, align[Left]];
cText = Text[Style["Area", Blue, Bold, Underlined, FontSize->26], {5.0, 0.7}, align[Center]];
rText = Text[Style["b", Blue, Bold, FontSize->20], {8.3, -0.1}, align[Right]];
(* testo da disegnare nel grafico *)
txt = Graphics[{lText, cText, rText}];
(* definizione della fuzione logaritmo *)
f[x_]:=Log[x]

(* costruisco i grafi in tre passi diversi *)

plot0=Plot[f[x], {x, 1, 10}, AxesOrigin->{0,0},PlotLabel->Style[Framed["Fig.1: Funzione logaritmica f(x) =" Log[x]], 22, Bold, Blue, Background->Lighter[Pink]], AxesLabel->Automatic, Ticks->None];
plot0; 
(* la funzione logaritmica nel intervalo [0, 10]*)

plot1=Plot[f[x], {x, 1, 10}, AxesOrigin->{0,0}, Filling->Axis, PlotLabel->Style[Framed["Fig.2: Area sotto la curva di funzione f(x) =" Log[x]], 22, Bold, Blue, Background->Lighter[Pink]], 
GridLines->{{{2, Blue}, {8, Blue}}, None}, PlotRange -> {{0, 10}, All}, AxesLabel->Automatic, Ticks->None];
Show[plot1, txt];
(* la funzione e i punti x=a e x=b *)

plot2=Plot[f[x], {x, 2, 8}, AxesOrigin->{0,0}, Filling->Axis, PlotLabel->Style[Framed["Fig.3: Area delimitata da f(x) = log(x) in [a,b]"], 22, Bold, Blue, Background->Lighter[Pink]], 
  
PlotRange -> {{0, 10}, All}, AxesLabel->Automatic, Ticks->None];

plot2a=Plot[f[x], {x, 1, 10}, AxesOrigin->{0,0}, 
  
PlotRange -> {{0, 10}, All}, AxesLabel->Automatic, Ticks->None];

(* visualizza i tre grafici creati prima in una unica riga utilizzando GraphicsRow*)
grafico1 = GraphicsRow[{plot0, Show[plot1, txt], Show[plot2, plot2a,txt]}, ImageSize->Full];

(* ********************************************************************************* *)

(* grafico2 - Grafico di una funzione costante *)
grafico2::usage = "Visualizza i tre grafici della funzione costante f(x) = 4"

(* definisco i tre punti di rifferimento ossia sinistra, centro e desta*)
lText = Text[Style["a", Blue, Bold, FontSize->20], {0.7, -0.3}, align[Left]];
cText = Text[Style["Area", Blue, Bold, Underlined, FontSize->26], {2.0, 1.7}, align[Center]];
rText = Text[Style["b", Blue, Bold, FontSize->20], {3.3, -0.3}, align[Right]];
(* il testo da inserire nei grafici, cioe' i punti a,b, Area *)
txt2 = Graphics[{lText, cText, rText}];
(* variabili che rappresentano i limiti di nella funzione Plot[] *)
funlim1 = -1;
funlim2 = 6;
(* definizione della funzione costante f(x)=4 *)
f[x_]:=4
(* creazione delle plot per il primo e il secondo grafico*)
plot3=Plot[f[x], {x, funlim1, funlim2}, PlotLabel->Style[Framed["Fig.4: Funzione costante f(x) = 4"], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic, AspectRatio->1, Ticks->{{1, 3},{0, 4}}, TicksStyle->Directive[Black, 20]];
plot4=Plot[y=4, {x, funlim1, funlim2}, PlotLabel->Style[Framed["Fig.5: Area sotto la funzione costante f(x) = 4"], 22, Bold, Blue, Background->Lighter[Pink]], Filling->Axis, GridLines->{{{1, Blue}, {3, Blue}}, None},
AxesOrigin->{0,0}, AxesLabel->Automatic, AspectRatio->1, Ticks->{{1, 3},{0, 4}}, TicksStyle->Directive[Black, 20]];
(* limiti dell'area da calcolare *)
inlimit1 = 1;
inlimit2 = 3;
(* plot del terzo grafico con l'area selezionata *)
g1 = Plot[f[x], {x, funlim1, funlim2}, PlotLabel->Style[Framed["Fig.6: Area delimitata da f(x) = 4, a = 1 e b = 2"], 22, Bold, Blue, Background->Lighter[Pink]], AspectRatio->1, Ticks->{{1, 3},{0, 4}}, TicksStyle->Directive[Black, 20]];
g2 = Plot[f[x], {x, inlimit1, inlimit2}, 
   Filling -> 0, AspectRatio->1, TicksStyle-> {Thick, Black}];

(* visualizzazione dei tre grafici in una riga*)
grafico2 = GraphicsRow[{plot3, Show[plot4, txt2], Show[g1, g2, txt2]}, ImageSize->Full]

(* ************************************************************************************* *)

(* grafico3 - Grafico della funzione lineare f(x) = x+1 *)
grafico3::usage = "Vizualizza i tre grafici della funzione lineare f(x) = x+1"

lText = Text[Style["a", Blue, Bold, FontSize->20], {0.7, -0.2}, align[Left]];
cText = Text[Style["Area", Blue, Bold, Underlined, FontSize->26], {2.9, 2}, align[Center]];
rText = Text[Style["b", Blue, Bold, FontSize->20], {5.3, -0.2}, align[Right]];

txt2 = Graphics[{lText, cText, rText}];
(* limiti per la Plot[] *)
funlim1 = 0;
funlim2 = 6;
(* dfinizione della funzione da plotare *)
f1[x_]:=x
plot3=Plot[f1[x], {x, funlim1, funlim2}, PlotLabel->Style[Framed["Fig.7: Funzione lineare f(x) = x "], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic, TicksStyle->Directive[Black, 20]];
plot4=Plot[f1[x], {x, funlim1, funlim2}, PlotLabel->Style[Framed["Fig.8: Area sotto la funzione f(x) = x "], 22, Bold, Blue, Background->Lighter[Pink]], Filling->Axis, GridLines->{{{1, Blue}, {5, Blue}}, None},
AxesOrigin->{0,0}, AxesLabel->Automatic, TicksStyle->Directive[Black, 20]];
(* limiti della area colorata da calcolare l'area *)
inlimit1 = 1;
inlimit2 = 5;

g1 = Plot[f1[x], {x, funlim1, funlim2}, PlotLabel->Style[Framed["Fig.9: Area delimitata da f(x) = x, a = 1 e b = 5"], 22, Bold, Blue, Background->Lighter[Pink]], TicksStyle->Directive[Black, 20]];
g2 = Plot[f1[x], {x, inlimit1, inlimit2}, 
   Filling -> 0, TicksStyle->Directive[Black, 20]];
(* visualizzazione dei tre grafici in una riga *)
grafico3 = GraphicsRow[{plot3, Show[plot4, txt2], Show[g1, g2, txt2]}, ImageSize->Full]

(* ************************************************************************************ *)

(* grafico4 - aree delle curve *)
grafico4::usage = "Visualizza i grafici di due curve"

(* definizione della prima funzione f(x) = e^x *)
f2[x_]:= E^x;
(* definizone della seconda funzione f(x) = 100 - 8x^2 = x^3 *)
f3[x_]:= 100-8*x^2+x^3;
(* i limit utilizzati per visualizzare i grafici *)
funlim3 = -1;
funlim4 = 3;
funl1=1;
funl2=7;

plot5=Plot[f2[x], {x, funlim3, funlim4}, PlotLabel->Style[Framed["Fig.10: Funzione esponenziale f(x) = \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(x\)]\)"], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic];
plot6=Plot[f3[x], {x, funl1, funl2}, PlotLabel->Style[Framed["Fig.11: Funzione f(x) = \!\(\*SuperscriptBox[\(x\), \(3\)]\) - 8\!\(\*SuperscriptBox[\(x\), \(2\)]\) + 100"], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic];

(* visualizzazione dei due grafici *)
grafico4 = GraphicsRow[{plot5, plot6}, ImageSize->Full]

(* ************************************************************************************ *)

(*  grafico5 - procedimento di calcolare l'area sotto la curva dividendola in 4 rettangoli *)
grafico5::usage = "Visualizza il procedimento per calcolare l'area sotto la curva dividendola in 4 rettangoli"

lText = Text[Style["a", Blue, Bold, FontSize->20], {0.8, -0.7}, align[Left]];
lTextt = Text[Style["x1", Blue, Bold, FontSize->20], {1.55, 0.4}, align[Left]];
cText = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {1.25, 2.7}, align[Center]];
cText2 = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {1.75, 2.7}, align[Center]];
cText3 = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {2.25, 2.7}, align[Center]];
cText4 = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {2.75, 2.7}, align[Center]];
rText = Text[Style["b", Blue, Bold, FontSize->20], {2.9, -0.7}, align[Right]];

lText1 = Text[Style["a", Blue, Bold, FontSize->20], {0.8, -0.7}, align[Left]];
cText1 = Text[Style["", Blue, Bold, Underlined, FontSize->26], {2.9, 2.7}, align[Center]];
rText1 = Text[Style["b", Blue, Bold, FontSize->20], {2.9, -0.7}, align[Right]];

txt3 = Graphics[{lText,lTextt, cText, cText2,cText3,cText4, rText}];

txt4 = Graphics[{lText1, cText1, rText1}];

plott=Plot[f2[x], {x, -1, 3}, PlotLabel->Style[Framed["Fig.12: Funzione esponenziale f(x) = \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(x\)]\)"], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic,  TicksStyle->Directive[Black, 20]]; (**)
plott0=Plot[f2[x], {x, -1, 3}, PlotLabel->Style[Framed["Fig.13: Divisione del segmento [a, b] in 4 parti uguali"], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic,  TicksStyle->Directive[Black, 20],
(*  utilizzo Epilog per creare le linee verticali e dividere il grafico in 4 aree larghi dx*)
Epilog->{
InfiniteLine[{1, 0}, {1, 1000}], 
InfiniteLine[{1.5, 0}, {1.5, 1000}],
InfiniteLine[{2, 0}, {2, 1000}],
InfiniteLine[{2.5, 0}, {2.5, 1000}],
InfiniteLine[{3, 0}, {3, 1000}]}];
plott1=Plot[f2[x], {x, -1, 3}, PlotLabel->Style[Framed["Fig.14: Calcoliamo la somma delle aree dei rettangoli"], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic,  TicksStyle->Directive[Black, 20],
Epilog->{Line[{{1, 0}, {1, 2.8}, {1.5, 2.8}, {1.5, 0}, {1.5, 4.4}, {2, 4.4}, {2, 0}, {2, 7.2}, {2.5, 7.2}, {2.5, 0}, {2.5, 12}, {3, 12}, {3, 0}}]}];
g2 = Plot[f2[x], {x, 1, 3}, 
   Filling -> 0,  TicksStyle->Directive[Black, 20]];

   (* visualizzazione dei tre grafici *)
grafico5 = GraphicsRow[{plott,Show[plott0, txt3], Show[plott1, g2, txt4]}, ImageSize->Full];

(* ************************************************************************************************ *)

(*  grafico6 - mostra due grafici, nel primo ce la divisione del grafico in 10 segmenti uguali
    - nel secondo grafico abbiamo la divisone dell'area sottostante alla curva in 10 rettangoli *)
grafico6::usage = "Visualizza il processo di calcolo dell'area sotto la curva dividentola in 10 rettangoli"

Clear[txt3];
Clear[txt4];

lText = Text[Style["a", Blue, Bold, FontSize->20], {0.9, -0.4}, align[Left]];
lTextt = Text[Style["x1", Blue, Bold, FontSize->20], {1.55, -0.4}, align[Left]];
lTexttA = Text[Style["x1", Blue, Bold, FontSize->20], {1.25, -0.4}, align[Left]];
cText = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {1.25, 2.7}, align[Center]];
cTextA = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {1.125, 2.7}, align[Center]];
cText2 = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {1.75, 2.7}, align[Center]];
cText3 = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {2.25, 2.7}, align[Center]];
cText4 = Text[Style["\!\(\*OverscriptBox[\(\[LongLeftRightArrow]\), \(dx\)]\)", Blue, Bold, FontSize->26], {2.75, 2.7}, align[Center]];
rText = Text[Style["b", Blue, Bold, FontSize->20], {2.98, -0.4}, align[Right]];

lText1 = Text[Style["a", Blue, Bold, FontSize->20], {0.9, -0.4}, align[Left]];
cText1 = Text[Style["", Blue, Bold, Underlined, FontSize->26], {2.9, 2.7}, align[Center]];
rText1 = Text[Style["b", Blue, Bold, FontSize->20], {2.97, -0.4}, align[Right]];

txt3 = Graphics[{lText, lTexttA, cTextA, rText}];

txt4 = Graphics[{lText1, cText1, rText1}];
plott0=Plot[f2[x], {x, -1, 3}, PlotLabel->Style[Framed["Fig.15: Divisione del segmento [a, b] in 10 parti uguali"], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic,
Epilog->{
InfiniteLine[{1, 0}, {1, 1000}],
InfiniteLine[{1.2, 0}, {1.2, 1000}], 
InfiniteLine[{1.4, 0}, {1.4, 1000}],
InfiniteLine[{1.6, 0}, {1.6, 1000}],
InfiniteLine[{1.8, 0}, {1.8, 1000}],
InfiniteLine[{2, 0}, {2, 1000}],
InfiniteLine[{2.2, 0}, {2.2, 1000}],
InfiniteLine[{2.4, 0}, {2.4, 1000}],
InfiniteLine[{2.6, 0}, {2.6, 1000}],
InfiniteLine[{2.8, 0}, {2.8, 1000}],
InfiniteLine[{3, 0}, {3, 1000}]}];
plott1=Plot[f2[x], {x, -1, 3}, PlotLabel->Style[Framed["Fig.16: Calcoliamo la somma delle aree dei rettangoli costruiti"], 22, Bold, Blue, Background->Lighter[Pink]], AxesOrigin->{0,0}, AxesLabel->Automatic,
Epilog->{Line[{{1, 0}, {1, 2.8}, {1.2, 2.8}, {1.2, 0}, {1.2, 3.3}, {1.4, 3.3}, {1.4, 0}, {1.4, 4}, {1.6, 4}, {1.6, 0}, {1.6, 4.9}, {1.8, 4.9}, {1.8, 0}, {1.8, 6}, {2, 6}, {2, 0}, 
{2, 7.3}, {2.2, 7.3}, {2.2, 0}, {2.2, 9}, {2.4, 9}, {2.4, 0}, {2.4, 11}, {2.6, 11}, {2.6, 0}, {2.6, 13.5}, {2.8, 13.5}, {2.8, 0}, {2.8, 16.5}, {3, 16.5}, {3, 0}}]}];
g2 = Plot[f2[x], {x, 1, 3}, 
   Filling -> 0];
   (* visualizzazione dei grafici *)
grafico6 = GraphicsRow[{Show[plott0, txt3], Show[plott1, g2, txt4]}, ImageSize->Full]

(* ********************************************************************************************** *)

(* grafico dinamico della funzione f(x) = e^x *)
plotMyChart::usage = "Funzione che visualizza il processo di calcolo dell'area sotto la curva dividendola in rettangoli sempre piu piccoli"

(* definizione della funzione f(x) *)
f[x_]:= E^x

(*  definizione della funzione plotMyChart[]  che permette di cambiare il numero di rettangoli 
    per approssimare l'area sottostante la funzione
    plotMyChart[], pernde in input un numero che rappresenta il numero di rettangoli da dividere l'area sotto la funzione *)

plotMyChart[nrettangoli_] := Module[{}, low = 0; high = 2;
delta = (high - low)/nrettangoli;
colsum = Graphics[{FaceForm[{Opacity[0.7]}], Table[{Hue[1, 0.6, 0.8], EdgeForm[Thin],
Rectangle[{low + n * delta, 0}, {low + (n + 1) * delta, f[low + n * delta]}]}, {n, 1, nrettangoli}]}, ImageSize->500, AspectRatio->1];
curve=Plot[f[x], {x, low, high}, PlotStyle->Thick, ImageSize->60];];
Manipulate[plotMyChart[nrettangoli];
(* Visualizza il grafico *)
Show[{colsum, curve}], {{nrettangoli,4}, 2, 80}]

(* ************************************************************************************************ *)

(*  grafico7 - grafico della funzione f(x) = x^2, [il mio primo integrale] 
    visualizzazione del grafico della funzione con l'area da calcolare colorata e delimitata dalle costant a e b *)
    grafico7::usage = "Mostra come si calcola graficamente l'area per la funzione f(x) = x^2 in due punti a e b"

leftText = Text[Style["a", Blue, Bold, FontSize->20], {0.85, -0.4}, align[Left]];
centerText = Text[Style["Area", Blue, Bold, FontSize->26], {1.5, 1.2}, align[Center]];
rightText = Text[Style["b", Blue, Bold, FontSize->20], {2.15, -0.4}, align[Right]];
(* genero il testo da mettere nel grafico *)

txt5 = Graphics[{leftText, centerText, rightText}];

fu[x_]:=x^2;
go1 = Plot[fu[x], {x, 0, 3}, PlotLabel->Style[Framed["Fig.17: Area delimitata da f(x)=\!\(\*SuperscriptBox[\(x\), \(2\)]\), a = 1 e b = 2"], 22, Bold, Blue, Background->Lighter[Pink]], TicksStyle->Directive[Black, 20], Ticks->{{1, 2}, {1, 4}}];
go2 = Plot[fu[x], {x, 1, 2}, 
   Filling -> 0];

   (* Visualizza il grafico *)
grafico7 = Show[go1, go2, txt5]

(* ********************************************************************************************************* *)
(*  grafico8 - Visualizza 4 funzioni e permette di cambiare gli estremi di integrazione i modo dinamico
    sono dati le funzioni Sin(x), Cos(x), Exp(x) e Radice quadrata di x *)

(**************************************************************************)

(* Primo grafico per la funzione Sin(x) *)
d1 = DynamicModule[{pts = {{0, 0}, {Pi, 0}}}, 
   LocatorPane[Dynamic[pts, (pts[[1]] = {#[[1, 1]], 0};
       pts[[2]] = {#[[2, 1]], 0}) &], 
    Dynamic[Framed@Show@{Plot[Sin@x, {x, 0, Pi},
         PlotLabel -> 
          ToString@
            StandardForm[
             Integrate[sin[x], {x, pts[[1, 1]], pts[[2, 1]]}]] <> 
           " = " <> 
           ToString[Integrate[Sin@x, {x, pts[[1, 1]], pts[[2, 1]]}]], 
         ImageSize -> 800],
        Plot[Sin@x, {x, pts[[1, 1]], pts[[2, 1]]}, Filling -> 0]}]]];
(**************************************************************************)

(* Secondo grafico per la funzione Cos(x) *)
d2 = DynamicModule[{pts = {{- Pi/2, 0}, {Pi/2, 0}}}, 
   LocatorPane[
    Dynamic[pts, (pts[[1]] = {#[[1, 1]], 0}; 
       pts[[2]] = {#[[2, 1]], 0}) &], 
    Dynamic[Framed@Show@{Plot[Cos@x, {x, -Pi/2, Pi/2},
         PlotLabel -> 
          ToString@
            StandardForm[
             Integrate[cos[x], {x, pts[[1, 1]], pts[[2, 1]]}]] <> 
           " = " <> 
           ToString[Integrate[Cos@x, {x, pts[[1, 1]], pts[[2, 1]]}]],
         ImageSize -> 800],
        Plot[Cos@x, {x, pts[[1, 1]], pts[[2, 1]]}, Filling -> 0]}]]];
(****************************************************************************)

(* Terzo grafico per la funzione Exp(x) *)
g[x_] := E^x;
d3 = DynamicModule[{pts = {{0, 1}, {1, E}}}, 
   LocatorPane[
    Dynamic[pts, (pts[[1]] = {#[[1, 1]], 0}; 
       pts[[2]] = {#[[2, 1]], 0}) &], 
    Dynamic[Framed@Show@{Plot[g@x, {x, 0, 1},
         PlotLabel -> 
          ToString@
            StandardForm[
             Integrate[f[x]@x, {x, pts[[1, 1]], pts[[2, 1]]}]] <> 
           " = " <> 
           ToString@
            StandardForm[
             Integrate[g@x, {x, pts[[1, 1]], pts[[2, 1]]}]],
         ImageSize -> 800],
        Plot[g@x, {x, pts[[1, 1]], pts[[2, 1]]}, Filling -> 1]}]]];
(****************************************************************************)

(* Quarto grafico per la funzione RadiceQuadrata(x) *)
h[x_] := Sqrt[x];
d4 = DynamicModule[{pts = {{0, 0}, {4, 2}}}, 
   LocatorPane[
    Dynamic[pts, (pts[[1]] = {#[[1, 1]], 0}; 
       pts[[2]] = {#[[2, 1]], 0}) &], 
    Dynamic[Framed@Show@{Plot[h@x, {x, 0, 4},
         PlotLabel -> 
          ToString@
            StandardForm[
             Integrate[H[x], {x, pts[[1, 1]], pts[[2, 1]]}]] <> 
           " = " <> 
           ToString@
            StandardForm[
             Integrate[h@x, {x, pts[[1, 1]], pts[[2, 1]]}]],
         ImageSize -> 800],
        Plot[h@x, {x, pts[[1, 1]], pts[[2, 1]]}, Filling -> 0]}]]];
(****************************************************************************)

(* Visualizza i grafici creare prima in una TabView *)
grafico8::usage = "Crea una TabView per visualizzare le funzione Sin(x), Cos(x), Exp(x) e Sqrt(x)"
grafico8 = TabView[{Seno[x] -> d1, Coseno[x] -> d2, Esponenziale[x] -> d3, 
  RadiceQuadrata[x] -> d4}, BaseStyle->{Orange, Bold, FontFamily->"Times"}, ImageSize->Automatic]

(****************************************************************************)

(*  showMeInfo - un comando che visualizza la data e il tempo corrente*)
showMeInfo::usage = "Una piccola funzione che visualizza informazioni riguardanti l'ora e la data"

showMeInfo = Dynamic[Refresh[DateString[], UpdateInterval -> 1]];

(*****************************************************************************)

(*  whereAmI - comando che setta le variabili di sistema $GeoLocationCity e $GeoLocationCountry per visualizzare dove ci si trova*)
whereAmI::usage = "Comando che visualizza la locazione dove ci si trova"

(*whereAmI = Print[$GeoLocationCity, ":" $GeoLocationCountry];*)

(***********************************************************************************)
(*tabViewInt - funzione che visualizza una tabella in forma di tab di integrali notevoli*)
tabViewInt::usage = "Visualizza una piccola tabella di integrali notevoli"
Clear[x]
tabViewInt = Framed[TabView[{HoldForm[
     TraditionalForm[\[Integral]2 \[DifferentialD]x]] -> 
    TraditionalForm[
     HoldForm[
      "Se f(x) = 2, allora una primitiva è " Framed["F(x) = 2x", 
        BaseStyle -> Red] "perchè la derivata di F(x) è 2x"]] ,
   HoldForm[TraditionalForm[\[Integral]Sin[x] \[DifferentialD]x]] -> 
    TraditionalForm[
     HoldForm[
      "Se f(x) = sin(x), allora una primitiva è " Framed[
        "F(x) = " - Cos[x], 
        BaseStyle -> Red] "perchè la derivata di F(x) è" (-Cos[x])]], 
   HoldForm[TraditionalForm[\[Integral]Cos[x] \[DifferentialD]x]] -> 
    TraditionalForm[
     HoldForm[
      "Se f(x) = cos(x), allora una primitiva è " Framed[
        "F(x) = " Sin[x], 
        BaseStyle -> Red] "perchè la derivata di F(x) è " Sin[x]]],
   HoldForm[TraditionalForm[\[Integral]2 x \[DifferentialD]x]] -> 
    HoldForm[
     "Se f(x)= 2x, allora una primitiva è" Framed[ "F(x) = " x^2, 
       BaseStyle -> Red]  "perchè la derivata di F(x) è " x^2], 
   HoldForm[TraditionalForm[\[Integral]Sqrt[x] \[DifferentialD]x]] -> 
    HoldForm[
     "Se f(x) = \!\(\*SqrtBox[\(x\)]\), allora una primitiva è" Framed[
       "F(x) = \!\(\*FractionBox[\(2 \*SuperscriptBox[\(x\), \
FractionBox[\(3\), \(2\)]]\), \(3\)]\)", 
       BaseStyle -> 
        Red] "perchè la derivata di F(x) è  \!\(\*FractionBox[\(2 \
\*SuperscriptBox[\(x\), FractionBox[\(3\), \(2\)]]\), \(3\)]\)"], 
   HoldForm[TraditionalForm[\[Integral]x^n \[DifferentialD]x]] -> 
    HoldForm[
     "Se f(x) = \!\(\*SuperscriptBox[\(x\), \(n\)]\), allora una \
primitiva è" Framed[
       "F(x) =  \!\(\*FractionBox[SuperscriptBox[\(x\), \(n + 1\)], \
\(n + 1\)]\), n\[NotEqual]-1", 
       BaseStyle -> 
        Red] "perchè la derivata di F(x) è \
\!\(\*FractionBox[SuperscriptBox[\(x\), \(n + 1\)], \(n + 1\)]\) per \
ogni n\[NotEqual]-1"], 
   HoldForm[TraditionalForm[\[Integral]1/x \[DifferentialD]x]] -> 
    HoldForm[
     "Se f(x) = \!\(\*FractionBox[\(1\), \(x\)]\), allora una \
primitiva è" Framed[
       "F(x) = ln\[LeftBracketingBar]x\[RightBracketingBar]", 
       BaseStyle -> 
        Red] "perchè la derivata di F(x) è ln\[LeftBracketingBar]x\
\[RightBracketingBar]"], 
   HoldForm[TraditionalForm[\[Integral]E^x \[DifferentialD]x ]] -> 
    HoldForm[
     "Se f(x) = \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(x\)]\), \
allora una primitiva è" Framed[
       "F(x) = \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(x\)]\)", 
       BaseStyle -> 
        Red] "perchè la derivata di F(x) è \!\(\*SuperscriptBox[\(\
\[ExponentialE]\), \(x\)]\)" ], 
   HoldForm[TraditionalForm[\[Integral]a^x \[DifferentialD]x]] -> 
 HoldForm["Se f(x) = \!\(\*SuperscriptBox[\(a\), \(x\)]\), allora la \
primitiva è" Framed[
    "F(x) = \!\(\*FractionBox[SuperscriptBox[\(a\), \(x\)], \
\(Log[a]\)]\)", 
    BaseStyle -> 
     Red] "perchè la derivata di F(x) è \
\!\(\*FractionBox[SuperscriptBox[\(a\), \(x\)], \(Log[a]\)]\)"], 
   HoldForm[
     TraditionalForm[\[Integral]1/(1 + x^2) \[DifferentialD]x]] -> 
    HoldForm[
     "Se f(x) = \!\(\*FractionBox[\(1\), \(1 + \
\*SuperscriptBox[\(x\), \(2\)]\)]\), allora una primitiva è" Framed[
       "F(x) = arctg(x)", 
       BaseStyle -> 
        Red] "perchè la derivata di F(x) è \!\(\*FractionBox[\(1\), \
\(1 + \*SuperscriptBox[\(x\), \(2\)]\)]\)"]}, 
  LabelStyle -> Directive[Lighter[Red], Italic, 24], 
  Alignment -> Center, 
  BaseStyle -> { Large, FontFamily -> "Times", 24, Italic}], 
 Background -> LightYellow]
