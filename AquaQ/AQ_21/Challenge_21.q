input: "I"$" " vs ' read0 `:input.txt
sum {max 3 msum x} each input
{2_3 msum x} each input

r: count first {2_3 msum x} each input

map: (til r)!distinct each (0,1_(til r)-1),'(til r),'(-1_(1+til r)),17 //map to possible path
(til r)!(0,1_(til r)-1),'((-1_(1+til r)),last til r),'til r

(({2_3 msum x} each input).) each (0 1;1 1)

0
((last 0,' map 0),/:map 1),/:\:map 0 1 2
// 26
{
    t: x[0];
    @[@[x;first where x<t;:;t];0;:;x first where x<t]
 } reverse "I"$'"121"
@[x;first where x<t;:;t]
x: reverse "I"$'"121"

// 29
tmap: tt!tt where each tt >=/:(tt: til 10)

count {9>count first x}{raze {x,/: tmap last x} each x}/ (0 1 2 3 4)
520185742

// 6
ch6:{[sum_to;char]
    t: til 1+sum_to;
    sum (raze/) in'[string (raze/) w where (last t) = sum each w:(cross/) (t;t;t);char]
 }

score: ("DSSIISSSS"; enlist ",") 0: `:input17.txt
score: select date, home_team, away_team, home_score, away_score from score
@[score;`date;`s#]