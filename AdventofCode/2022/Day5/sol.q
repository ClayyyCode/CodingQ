// Part 1
input: read0 `input.txt
sep: where "" ~/: input //sep(aration)
// --------------------------------------------------------------
board: sep#input
board: reverse each (flip board) where not null last board     //turn the format in a list of string
board: ("I"$'board[;0])!`$''except\:[;" "]  board[;1+til 8] // turn it further into dict: int col!(list of sym)
board
// --------------------------------------------------------------
instrut: first (sep+1) _ input
action: "I"$(" " vs/: instrut)[;1 3 5]
s: {[board;action]
  // m(ove); f(rom); t(o)
  `m`f`t set' action;
  board[t],: reverse neg[m]#board f;
  board[f]: neg[m] _ board f;
  board};
sol: s/[board; action];
ans: raze string last each sol

// Part 2
s2: {[board;action]
  // m(ove); f(rom); t(o)
  `m`f`t set' action;
  board[t],: neg[m]#board f;
  board[f]: neg[m] _ board f;
  board};
sol: s2/[board; action];
ans: raze string last each sol
