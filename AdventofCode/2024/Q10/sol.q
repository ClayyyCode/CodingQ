// REAL SOLUTION

.cfg.map: "J"$/:/:read0 `:input
// first index y axis, second index is x asis
allZeroLoc: raze til[count .cfg.map] cross' where each .cfg.map=0

findNextCord:{[row;col;toFind]
  empty:0N;
  if[(row < 0) | (col < 0) | (row >= count .cfg.map) | (col >= count[.cfg.map 0]);:empty];
  val:.cfg.map[row;col];
  if[val<>toFind;:empty];
  if[val~9      ;:(row;col)];
  except[;0N] (,/) .z.s[;;toFind+1] ./:(row;col) +/: (1 0;-1 0;0 1;0 -1)
  };

p1:sum distinct each 2 cut/: findNextCord[;;0] ./: allZeroLoc
p2:sum count each 2 cut/: findNextCord[;;0] ./: allZeroLoc

//////////////////////////////////////




















// THOUGHTS?




((count read0 `:input)#"J";"") 0: `:input


.cfg.taiGuoGeDog: (enlist 2#0N);





.cfg.map: map[til 3;til 3]

.cfg.map: (9 0 1 2 3  ;9 7 6 5 4  ;9 8 7 6 2)
.cfg.map: (0 1 2 3;7 6 5 4;8 9 1 2;9 1 2 3)
.cfg.map:(0 1 2 3; 1 2 3 4; 8 7 6 5; 9 8 7 6 )
sum
count distinct 2 cut raze raze
distinct 2 cut  raze except\:[;0n] (raze/) each

findNextCord[;;0;()] . last allZeroLoc



sum {count distinct -2#/: 20 cut (raze/) x} each findNextCord[;;0;()] ./: allZeroLoc
sum {count -2#/: 20 cut (raze/) x} each findNextCord[;;0;()] ./: allZeroLoc

findNextCord:{[row;col;toFind;list]
  /show(row;col);
  if[(row < 0) | (col < 0);: raze()];
  if[(row >= count .cfg.map) | (col >= count[.cfg.map 0]);: raze()];
  val:.cfg.map[row;col];
  if[val<>toFind;:raze()];
  list,:(row;col);
  /show (val;toFind;row;col);
  if[(val~9);:list];
  (.z.s[row+1;col;toFind+1;list];.z.s[row-1;col;toFind+1;list];.z.s[row;col+1;toFind+1;list];.z.s[row;col-1;toFind+1;list])
  };
/TODO: how to fine tune this




.cfg.map:c
[0;1]
.cfg.map . 6 1
c: (89010123;
  78121874;
  87430965;
  96549874;
  45678903;
  32019012;
  01329801;
  10456732)
  .cfg.map: 10 vs/:c

  .cfg.map . 0 2
.cfg.map[6]:0,.cfg.map[6]

findNextCord:{[row;col;toFind]
  empty:2#0n;
  if[(row < 0) | (col < 0) | (row >= count .cfg.map) | (col >= count[.cfg.map 0]);: empty];
  val:.cfg.map[row;col];
  if[val<>toFind;: empty];
  if[(val~9);;:(row;col)];
  (.z.s[row+1;col;toFind+1];.z.s[row-1;col;toFind+1];.z.s[row;col+1;toFind+1];.z.s[row;col-1;toFind+1])
  };
