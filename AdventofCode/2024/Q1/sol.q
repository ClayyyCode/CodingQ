input: "I"$"   " vs/: read0 `:input;
listOne: input[;0];
listTwo: input[;1];
partOne: sum abs (-) . asc@/:(listOne;listTwo);

partTwo: sum {key[x]* value[x]} listOne!(count each group listTwo) listOne
/part two can use inter for cleaner soln
sum (inter) . {x[1 0]}asc@/:(listOne;listTwo)
(inter) save
