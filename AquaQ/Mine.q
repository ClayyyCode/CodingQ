// Q1
f:{[grid;p] grid[1] cut ?[(til a) in (neg ceiling p*a)?a:prd grid;"x";" "]} 


f:{[grid;p] grid#" x" (til a) in (neg ceiling p*a)?a:prd grid}  // shorten with " x" 100b

f[3 3;0.1]

//suggested soln
/ f:{x#@[c#"";neg["j"$y*c]?c:prd x;:;"x"]} // with the use of replace at; @
/ f:{x#" x"y>prd[x]?1.} // beautiful use of > 

// Q2
