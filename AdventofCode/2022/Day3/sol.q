// Part 1
input: read0 `input.txt
priority: (.Q.a,.Q.A) ! (1+til 52)
breakInto2Compartment: {("i"$count[x]%2) cut x } each input
findCommonItem: {distinct x[0] where x[0] in x[1]}
commonItermType: findCommonItem each breakInto2Compartment
ans: sum priority commonItermType / 7674

// Part 2
sum priority ({findCommonItem (findCommonItem') x}') flip (1 rotate' c; c: 3 cut input)
