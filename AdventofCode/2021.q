//Day 1
input: "I"$read0 `:inputD1.txt
sum 0 < 1_deltas input  // 1665

sum 0 < 1_deltas 2_3 msum input // 1702

//Day 2
input: ("SI";" ")0:`:inputD2.txt // list
dir: input[0]
step: input[1]
.[{z*x-y};sum each step*/:dir in/: `down`up`forward] // short form; vector based
//sum (x[1]*x[0] in `forward) * sum (x[1]*x[0] in `down) - x[1]*x[0] in `up // long form
/ 
/ not functional enough
/ input: flip ("SI";" ")0:`:inputD2.txt // list
g:0 0
f:{$[x[0]~`forward; g+:(x[1];0);
   x[0]~`down; g+:(0;x[1]);
   x[0]~`up; g-:(0;x[1])]
 }
prd g

input: flip `dir`step!("SI";" ")0:`:inputD2.txt // table
t:exec sum step by dir from input  
t[`forward]*t[`down]-t[`up] 
\
aim: sums .[{x-y};step*/:dir in/: `down`up]
fwd: step*dir in `forward 
(horiz: sum fwd)* depth: sum aim*fwd // or : prd sum each (fwd;aim*fwd)

//Day3
input:  "I"$''read0 `:inputD3.txt
cnt: count first flip input //flip input for the question
prd 2 sv/: ((1-p);p:(cnt%2) <= sum each flip input)  // appear more than cnt%2 = more prevalent

mc: {if[(count x) = 1; :x]; x where x[;y] = ((count x[;y])%2) <= sum x[;y]}/ [input;til 12] //reduce
lc: {if[(count x) = 1; :x]; x where x[;y] = ((count x[;y])%2) > sum x[;y]}/ [input;til 12]
 
o: {1<count x 1}{i:x 0; j: x 1; (i+1; j where j[;i] = ((count j[;i])%2) <= sum j[;i])}/(0;input) //while coverage
s: {1<count x 1}{i:x 0; j: x 1; (i+1; j where j[;i] = ((count j[;i])%2) > sum j[;i])}/(0;input)


prd {2 sv first x} each (mc;lc)
prd {2 sv raze last x} each (o;s)

//Day4
input:  read0 `:inputD4.txt
//random order in which to draw numbers
draw: "J"$"," vs first input // first line
puz_in: 5 cut ' 25 cut (,/) {("I"$'" " vs x) except 0N} each 1_input // newer, better, shorter 
//your puzzle input (turning into several 5x5 bingo)
/ 
a:a where not (first a) ~/:  a: first each " " vs'' (1_"\n" vs' input) //removing the /n between puzzles
b: where each not "" ~/:/: a // remove space blank in puzzle input
puz_in: 5 cut  "J"$@'[a;b] 
\



// AP

d4_p1:{
  result: {(&). ({all (raze/) 5 > sum each x}') (flip each x[0]; x[0])} {(x[0] | puz_in =\:\: draw[x 1];1+x 1)}/("b"$puz_in*0;0);
  wb: where any each (|). ({5 = sum each x}') (flip each p:first result;first result);  // flip each p -> vertical bingo; p-> horizontal bi
  unmarked: {sum (*). (raze/) each(x;y)} [puz_in[wb];not p wb]; //wb: winning board
  answer: draw[(last result)-1]*unmarked
 }

d4_p2:{
  result: {(&). ({ 99i> sum any each 5 <= sum each x}') (flip each x[0]; x[0])} {(x[0] | puz_in =\:\: draw[x 1];1+x 1)}/("b"$puz_in*0;0);
  wb: where any each (+). ({1 = sum each 5 = sum each x}') (flip each p;p:first result)  ;
  unmarked: {sum (*). (raze/) each(x;y)} [puz_in[wb];not p wb]; 
  answer: draw[(last result)-1]*unmarked
 }
/ 
/ for thinking
c: any 5 = sum each first puz_in in\: 83 40 67 98 4 // row
d: any 5 = sum first puz_in in\: 83 50 75 12 36  //col
rot:(til 5; 1 rotate neg til 5)
rot[0] rotate' first puz_in in\: first draw 
rot[1] rotate' first puz_in in\: first draw 
5 = first sum rot[0] rotate' first puz_in in\: 83 74 79 25 10 // digonal "\"
5 = first sum rot[1] rotate' first puz_in in\: 4 30 79 59 36 // digonal "/"  
\

//Day 5
input: "I"$"," vs '' "->" vs/: read0 `:inputD5.txt 
input_1: input where {any (x[0]-x[1]) in 0}each input
o: (min/) input_1 
b: (max/) input_1
path: (b;b) # 0
{.[path;(523 + til(790-523);427);+;1]}
{.[path;(((min x[;1])+$[count g:til abs (-). x[;1];g;0]);(min x[;0])+$[count p:til abs (-). x[;0];p;0]);+;1]}first input_1

//Day 6
input: "J"$"," vs first read0 `:inputD6.txt
//count first {x[1] <80} {((.[x[0];enlist c;:;7],(count c: where x[0] in 0)#9i)-1i;x[1]+1)}/ (input;0) // stupid soln
d6:{
  x: count each group x;
  x[(til 9) except key x]^:0;
  do[y;
    x[til 9]:x[1 rotate til 9]; 
    x[6]+:x[8]];
  sum get x  
  };
d6[input;256]



//Day 7
input: "I"$"," vs first read0 `:inputD7.txt
sum abs input - med input
min sum each {sum 1+til x} each 'abs input -/: input  //brute force
"i"$min sum each {sum x*0.5*x+1} each abs input -/: input //bf with math formula...



//Day 9 
input: "J"$'' read0 `:inputD9.txt
u: 1 rotate input // move up
d: -1 rotate input //move down
l: 1 rotate' input // shift left
r: -1 rotate' input // shift right
a: input < u // smaller than down one row?
b: input < d // smaller than up one row?
c: input < l // smaller than right one col?
d: input < r // smaller than left one col?
a[99]|:1b
b[0]|:1b
c[;99]|:1b
d[;0]|:1b
sum ((raze/) input+1) * (raze/) (&/) (a;b;c;d)
sum (*) . ((raze/)') (input+1; (&/) (a;b;c;d)) //part 1


.aoc2021.d9.t2: {
    x: {"J"$/:x}each"\n" vs x;
    x: raze {x,'y}'[til count x;where each not x=9];
    bs: ();

    while[0 < count x;
        b: enlist first[x];
        i: 1#0N;
        while[0<count i;
            x: `u#x except b;
            i: (raze b +/:\:(0 1;1 0;0 -1;-1 0)) inter x;
            b: distinct b, i
        ];
        bs,: count b;
    ];
    prd 3#desc bs
 };

//Day 10
input: read0 `:inputD10.txt

o: ")]>}"!"([<{"
i: "([<{"!")]>}"
s: ")]>}"!3 57 25137 1197 //part 1
s_2: ")]>}"!1 2 4 3 //part 2

/
{1 <> count x}{
  ($[input[x[1]] in i;
  x[0],:input[x[1]];
  $[o[input[x[1]]] = last x[0];
     x[0]:-1_x[0];
     :input[x 1]]
     ];x[1]+1)}\("";0)
\

lo: {({if[1b ~ x in key o;:x]; //if the illegal char is found, set it as x to stop expanding
  $[y in value o;x:x,y; //if input is an opening char, stack up the stack
    $[o[y] = last x;x:-1_x;:y]]}/) ["";x]} each input //if input is a closing char, pop the stack if legit; else make x:y to lock the illegal char and stop expansion
sum s[lo where p:1 = count each lo] //cal score and ignore incomplete case

"j"$med {({y+5*x}/)s_2 reverse i x} each lo where not p // part 2 answer