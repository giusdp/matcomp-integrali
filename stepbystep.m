

indefinitiStepByStep[integrand_] := WolframAlpha[StringJoin["integrate ", integrand], {{"IndefiniteIntegral", 2}, "Content"}, PodStates -> {"IndefiniteIntegral__Step-by-step solution"}];

definitiStepByStep[integrand_] := WolframAlpha[StringJoin["integrate ", integrand], {{"Input", 2}, "Content"}, PodStates -> {"Input__Step-by-step solution"}];


definitiStepByStepNascosto[integrand_] := WolframAlpha[StringJoin["integrate ",integrand], IncludePods -> "Input", AppearanceElements -> {"Pods"}, PodStates -> {"Show steps"}];
