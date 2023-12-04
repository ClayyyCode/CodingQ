data: read0 `:input;
fn: {
  nums: "|" vs raze 1_":" vs x;
  win : except[;0N] "J"$ " "vs first nums;
  have: except[;0N] "J"$ " "vs last nums;
  won: sum have in win;
  if[won > 0;:2 xexp won-1];
  0
 };
sum fn each data

// part 2
fn2: {
  nums: "|" vs raze 1_":" vs x;
  win : except[;0N] "J"$ " "vs first nums;
  have: except[;0N] "J"$ " "vs last nums;
  won: sum have in win;
  won
 };
res: "j"$fn2 each data;

sum {x+@[count[x]#0;z+til y;:;x z-1]}/[count[res]#1j; res; 1+til count res]
