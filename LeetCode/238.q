NUMS: 1 2 3 4;
NUMS: -1 1 0 -3 3;
p: (*\) NUMS;
t: (*\) reverse NUMS;
//(p)refix (s)um
//(sf)ferix (s)um
sol:{
    ps: p@(x-1);
    sfs: t@(y-x+2);
    if[x~0; :sfs];
    if[x~y-1; :ps];
    ps*sfs
  };
sol[;count NUMS] each til count NUMS
