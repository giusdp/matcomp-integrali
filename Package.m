(* ::Package:: *)

(* ::Input::Initialization:: *)
(* PACKAGE.M
 * Progetto d'esame di Matematica Computazionale + Calcolo Numerico e Software Didattico
 * Corsi di laurea magistrale in Informatica e Matematica
 * Anno accademico 2017/2018
 * 
 * Autori:
 *   Tommaso Saracchini, Domenico Coriale, Giuseppe De Palma, Eduart Uzeir
 *
 * Versione di sviluppo e testing: Wolfram Mathematica 11.2
 *)

(* Inizio del package *)

(* Usage prima del private *)
paletteFormula::usage = "Tabella delle formule di integrazione.";
singlePopup::usage = "Funzione che inibisce il doppio clic dei botoni";

(* Download ed update del Packlet di MaTeX, in caso non ci fosse *)
(*
updateMaTeX[] :=
  Module[{json, download, target},
    Check[
      json = Import["https://api.github.com/repos/szhorvat/MaTeX/releases/latest", "JSON"];
      download = Lookup[First@Lookup[json, "assets"], "browser_download_url"];
      target = FileNameJoin[{CreateDirectory[], "MaTeX.paclet"}];
      If[$Notebooks,
        PrintTemporary@Labeled[ProgressIndicator[Appearance -> "Necklace"], "Downloading...", Right],
        Print["Downloading..."]
      ];
      URLSave[download, target]
      ,
      Return[$Failed]
    ];
    If[FileExistsQ[target], PacletManager`PacletInstall[target], $Failed]
  ]

updateMaTeX[]
*)

Needs["PacletManager`"]
PacletInstall["MaTeX-1.7.3.paclet", IgnoreVersion->True]
Needs["MaTeX`"]
(* Funziona che controlla il sistema operativo e setta il path di MaTeX *)
checkSystem = If[StringMatchQ["Windows",$OperatingSystem], 
ConfigureMaTeX["pdfLaTeX"->"C:\\Program Files\\MiKTeX 2.9\\tex\\latex\\00miktex\\pdflatex.exe",
"Ghostscript"->"C:\\Program Files\\gs\\gs9.20\\bin\\gswin64c.exe", "CacheSize" -> 100, 
"WorkingDirectory" -> Automatic], 
If[StringMatchQ["Unix",$OperatingSystem], ConfigureMaTeX["pdfLaTeX" -> "/usr/bin/pdflatex",
 "Ghostscript" -> "/usr/bin/ghostscript", "CacheSize" -> 100, "WorkingDirectory" -> Automatic], 
 ConfigureMaTeX["pdfLaTeX" -> "/Library/TeX/texbin/pdflatex",
 "Ghostscript" -> "/usr/local/bin/gs", "CacheSize" -> 100,"WorkingDirectory" -> Automatic
]]];

(* Import degli altri packages *)
(* Package per la scrittura delle formule tramite codice latex *)
<<MaTeX`;
(* Package contenente i gradici *)
<<"Grafici.m";
(* Package contenente le formule per le soluzioni guidate *)
<<"Soluzioni_guidate.m";

(* Funzione che inibisce il doppio clic dei botoni *)
singlePopup[pw_]:=With[{p=Unique["popup"]},pw/.Button[a_,b_,c___]:>Button[a,If[!ValueQ[p]||NotebookInformation[p]==$Failed,p=b],c]]

(* Palette delle formule di integrazione creato con codice latex*)
paletteFormula := 
  CreatePalette[
   Panel[Grid[{{MaTeX[HoldForm[\[Integral] \[DifferentialD]x = x + c],
         Magnification -> 2], SpanFromLeft(*,MaTeX[HoldForm[Integrate[
       k * f[x],x] = k * Integrate[f[x],x]],Magnification\[Rule]2], 
       SpanFromLeft *)}, {}, {MaTeX[
        HoldForm[\[Integral]x^n \[DifferentialD]x = 
          x^ (n + 1) + c "," (n != -1)], Magnification -> 2], 
       SpanFromLeft, 
       MaTeX[HoldForm[\[Integral](f[x])^n * 
            f'[x] \[DifferentialD]x = (1/(n + 1) )* (f[x])^(n + 1) + 
           c], Magnification -> 2], SpanFromLeft}, {},(*{MaTeX[
      HoldForm[\[Integral]1/(2\[Sqrt]x)\[DifferentialD]x= \[Sqrt]x +
      c ],Magnification\[Rule]2],SpanFromLeft, MaTeX[
      HoldForm[\[Integral](f'[x])*1/(2*\[Sqrt]f[
      x]) \[DifferentialD]x = \[Sqrt]f[x] + c],Magnification\[Rule]2],
      SpanFromLeft},{},*){MaTeX[
        HoldForm[\[Integral]Sin[x] \[DifferentialD]x = - Cos[x] + c], 
        Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral]Sin[f[x]] * 
            f'[x] \[DifferentialD]x = - Cos[f[x]] + c], 
        Magnification -> 2], 
       SpanFromLeft}, {}, {MaTeX[
        HoldForm[\[Integral]Cos[x] \[DifferentialD]x = Sin[x] + c ], 
        Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral]Cos[f[x]] * 
            f'[x] \[DifferentialD]x = Sin[f[x]] + c], 
        Magnification -> 2], 
       SpanFromLeft}, {}, {MaTeX[
        HoldForm[\[Integral]1/Cos[x]^2 \[DifferentialD]x = 
          Tan[x] + c ], Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral]1/Cos[f[x]]^2 * 
            f'[x] \[DifferentialD]x = Tan[f[x]] + c], 
        Magnification -> 2], 
       SpanFromLeft}, {}, {MaTeX[
        HoldForm[\[Integral]1/Sin[x]^2 \[DifferentialD]x = - Cot[x] + 
           c ], Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral]1/Sin[f[x]]^2 * 
            f'[x] \[DifferentialD]x = - Cot[f[x]] + c], 
        Magnification -> 2], 
       SpanFromLeft}, {}, {MaTeX[
        HoldForm[\[Integral]1/\[Sqrt](1 - x^2) \[DifferentialD]x =  
          ArcSin[x] + c ], Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral]f'[x] /
             Sqrt[1 - f[x]^2 ] \[DifferentialD]x = -ArcSin[f[x]] + c],
         Magnification -> 2], 
       SpanFromLeft}, {}, {MaTeX[
        HoldForm[\[Integral]1/(1 + x^2) \[DifferentialD]x = 
          ArcTan[x] + c ], Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral] 
           f'[x]/(1 + f[x]^2) \[DifferentialD]x = ArcTan[f[x]] + c], 
        Magnification -> 2], 
       SpanFromLeft}, {}, {MaTeX[
        HoldForm[\[Integral] 1/x \[DifferentialD]x = Log[Abs[x]] + c],
         Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral] f'[x]/f[x] \[DifferentialD]x = 
          Log[Abs[f[x]]] + c], Magnification -> 2], 
       SpanFromLeft}, {}, {MaTeX[
        HoldForm[\[Integral] e^x \[DifferentialD]x = e^x + c], 
        Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral] e^f[x] * f'[x] \[DifferentialD]x = 
          e^f[x] + c], Magnification -> 2], 
       SpanFromLeft}, {}, (* {MaTeX[HoldForm[\[Integral]a^
      x \[DifferentialD]x = a^x/Log[a] + c],Magnification\[Rule]2],
      SpanFromLeft,MaTeX[HoldForm[\[Integral] a^f[x] * f'[
      x] \[DifferentialD]x = a^f[x]/Log[a] + c],
      Magnification\[Rule]2],
      SpanFromLeft},{}, *){MaTeX[
        HoldForm[\[Integral](x + a)^
             m \[DifferentialD]x = (x + a)^(m + 1)/(m + 1) + c], 
        Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral] (a + bx)^
             n  \[DifferentialD]x = (a + bx)^(n + 1)/(b*(n + 1)) + c],
         Magnification -> 2], 
       SpanFromLeft}, {}, {MaTeX[
        HoldForm[\[Integral]1/(a^2 + x^2) \[DifferentialD]x = 
          1/a * ArcTan[x/a] + c], Magnification -> 2], SpanFromLeft, 
       MaTeX[HoldForm[\[Integral] 
           f'[x]/(f[x]^2 + a^2)   \[DifferentialD]x = 
          1/a * ArcTan[f[x]/a] + c], Magnification -> 2], 
       SpanFromLeft}}, 
     Background -> {Automatic, {{LightOrange, LightYellow}}}, 
     Frame -> All, FrameStyle -> Directive[Red, Dotted]], 
    Appearance -> "Palette"], WindowElements -> "VerticalScrollBar", WindowTitle-> "Tabella Integrali"];

(* Fine del package*)
