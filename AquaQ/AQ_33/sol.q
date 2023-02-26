// Finally this is the correct solution
use_sol3: {
  .dart.oneshot: distinct 25,50, raze (1 2 3) *\: 1+til 20;             // one shot is needed as they are on the board
  .dart.twoshot: (1+til 60) except .dart.oneshot;                       // we know these can be done with at most 2 shots
  .dart.map: 61#0;                                                      // create an array and fill in shots needed for the first 60 index (index = 0 is useless)
  @[`.dart.map;.dart.oneshot;:;1];
  @[`.dart.map;.dart.twoshot;:;2];

  {if[(x mod 60) in .dart.oneshot; .dart.map,: 1 + x div 60;:()];       // Thats the juicy part, we are "greedy" to mod 60, as 60 is the max score we can get for 1 shot. We then create logic for the remainders:
      .dart.map,: 2 + x div 60;                                         // if the remainder is in oneshot, thats the minimum we can achieve, or else, it will be at most 2 more shot,
      .dart.map[x]: min sum each .dart.map {(x - c),'c: 1+til 60} x;    // however we want to lookback if there is chance for one shot, eg 83 mod 60 = 23 -> 3 shots needed, but it could be 57+26 -> 3 shots
    } each {61+ til x - 60} x;                                          // populate for the remaining index starting from 61
  sum .dart.map
 }

use_sol3 245701

/
/ These are wrong, and my my thinking process before
input: 245701

kasc: {if[99h ~ type x;
  order: iasc (key x);
  :(`s#key[x] order)!value[x] order]}

.dart.score: asc distinct 25,50, raze (1 2 3) *\: 1+til 20;
.dart.map: `s#.dart.score ! count[.dart.score]#1;
sol: {sum {@[;1] ({if[x[0] ~ 0; :x];
      $[x[0] ~ v: .dart.score .dart.score bin x[0];
      (0;1+x 1);
      (x[0]-v;1+x 1)]}/) x, 0} peach 1+til x}
sol 245701

sol2: {if[not x in key .dart.map;
   show "this thing not in map ", string x;
   map: `#.dart.map;
   map[x]:(.dart.map (x - c)) + .dart.map c: key[.dart.map] key[.dart.map] bin x;
   .dart.map: `s#kasc map;
   ]}

use_sol2: {sol2 each 1+til x; sum value .dart.map}
