// Part 1
input: read0 `input.txt
input: "I"$"-"vs'' "," vs' input
f: {
  // first: rearrange the matrix by putting the pairs with bigger range at the bottom, then do a x[1] - x[0] to cal their difference
  t: {x[1] - x[0]} x c in min c: (-) . ' x;
  // special case to handle paris with same range
  if[t~(0 0i);:x[0]~x[1]];
  // check if the bigger range pair will contain another by the logic: having lower low ends or higher high ends
  (t[0]<=0)&(t[1]>=0)
  }
ans: sum f each input


// Part 2

x: first input
f2: {
  a: x . 0 0;
  b: x . 0 1;
  c: x . 1 0;
  d: x . 1 1;
  ((b >= c) and (a <= d)) or ((d >= a) and (c <= b))
 }
ans: sum f2 each input
