// Part 1
input: first read0 `input.txt
c: input (til 4)+/: til (count input) - 4
ans: 4 + first where 4 = ({count distinct x}') c

// Part 2
c: input (til 14)+/: til (count input) - 14
ans: 14 + first where 14 = count each distinct each c

// Generic solution, eg sol[4], sol[14]
sol:{
  c: input (til x)+/: til (count input) - x;
  x + first where x = ({count distinct x}') c
 };
