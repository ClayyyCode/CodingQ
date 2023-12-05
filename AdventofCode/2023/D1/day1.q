data: read0 `:input;
// part 1
calFirstLastDig: {10 sv (first;last)@\: x except 0N};
fn:{sum calFirstLastDig each "J"$/:/:x};
show fn data;

digitMap: ("one";"two";"three";"four";"five";"six";"seven";"eight";"nine")!string 1+til 9;
/fn2: {ssr/[x;key digitMap;value digitMap]}; // cant use ssr coz have eightwothree this on9 case with overlap
fn3: {letters: ![;m] distinct raze @[dd;] m:1+where count each value  dd:(1+til 9)! ss/:[x;key digitMap];
  numLoc: where not null numVal:"J"$/: x;
  numVal: numVal except 0N;
  res: letters,  (numLoc)!numVal;
  10 sv res (min;max)@\:key res
 };
show sum fn3 each data;

show fn fn2 each data;

{ssr/[x;key digitMap;value digitMap]} each
fn data 50+ til 20

calFirstLastDig each "J"$/:/: fn2 each data



/{ssr[last data;key x; value x]}
/((.[ssr[last data]])/)
/({ssr[x;] . y}/)
