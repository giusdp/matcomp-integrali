(* ::Package:: *)

(* ::Input:: *)
<<MaTeX`
(**)
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

(*Button["Forumule", paletteFormula]*)
