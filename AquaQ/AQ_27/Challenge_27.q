test: ("invalidly";
  "yachting";
  "grumpiness";
  "scurrying";
  "gluten";
  "never";
  "roulette";
  "elections";
  "sharpness")

score: .Q.a!1+til 26

original: read0 `:input.txt
left: next each original
right: prev each original

horiz_pos: asc each {x[0] union' x[1]} {x[0] inter'/: x[1 2]} {where each not null x} each (original;left;right)                                              // a lot of logic but I am lazy to break them down, basically finding where
horiz_word: hw where not "" ~/: hw: original ./: {first[x], enlist 1_x} each raze (til count horiz_pos),'' {(where 1 < deltas x)  _ x} each horiz_pos         // the complete word is by checking if the neighbour is not null,
                                                                                                                                                              // then collect position to index all the words
up: next original                                                                                                                                             // same logic just flip it for vertical
up[count[up]-1]: (count first original)#" "
down: prev original
down[0]:  (count first original)#" "

verti_pos: asc each {x[0] union' x[1]} {x[0] inter'/: x[1 2]} {where each not null flip x} each (original;up;down)                                            // used asc to ensure same word connect to each other
verti_word: vw where not "" ~/: vw: (flip original) ./: {first[x], enlist 1_x} each raze (til count verti_pos),'' {(where 1 < deltas x)  _ x} each verti_pos  // the deltas with _ is to separate mutiple words on the same line

ans: sum {sum[x]*count[x]} each score horiz_word, verti_word // 500135

// Refactor for short and gross to read

sol: {p: (asc') (union') . {x[0] inter'/: 1_x} ({(where') not null x}') (x;y;z);
 w where not "" ~/: w: x ./: ({x[0], enlist 1_x}') raze (til count p),'' ({(where 1 < (-':) x) _ x}') p};

ans: sum ({sum[x]*count x}') raze score sol ./: ((original;left;right);(flip') (original;up;down));
