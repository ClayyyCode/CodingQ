data: "J"$/:/:2 cut (raze read0 `:input),"0"

/This is example - data:  "J"$/:/:2 cut string [2333133121414131402],"0"

blocks: {(x[0]#y),(x[1]#0N)}'[data; til count data]

/{(x[0]#y),(x[1]#0N)} [@[;9999] data;@[;9999]  til count data]
blocks: raze blocks
/ use 2 pointer
toSOlve:{[blocks]
  l:0;
  r:count[blocks]-1;
  while[r>l;
    if[null blocks[r];r-:1];
    if[not null blocks[l];l+:1];
    if[null[blocks[l]]&not null blocks[r];
      /show blocks[l];
      blocks[l]:blocks[r];
      blocks[r]:0N;
      /show blocks;
      ];
  ];
  :blocks
  };


{sum x* til count x}  toSOlve blocks

// q2

// if not null, then we can move, if null means we dont have enough free space
findFreeSpace:{[shortBlocks;freeSpaceNeed]
  startIdxForFreeSpace: idx where 1<>deltas idx: where null shortBlocks;
  freeSpaceMap: startIdxForFreeSpace!sum each startIdxForFreeSpace cut null shortBlocks;
  locationToReallocate: first where freeSpaceMap>=freeSpaceNeed;
  :locationToReallocate
 };

twoSOlve:{[blocks]
  r:count[blocks]-1;
  l:r;
  while[r>0;
    if[null blocks[r];r-:1;l-:1];
    if[blocks[l] ~ blocks[l-1];l-:1];
    /if[(blocks[l]  <>  blocks[l-1]) and not null blocks[l];l-:1];
    if[blocks[l]  <>  blocks[l-1];
      freeSpaceNeed: 1+r-l;
      allocation: findFreeSpace[blocks[til l];freeSpaceNeed];
      if[not null allocation;
        blocks:@[blocks;allocation+til freeSpaceNeed;:;freeSpaceNeed# blocks[l]];
        blocks:@[blocks;l+til freeSpaceNeed;:;freeSpaceNeed# 0N]];
      l-:1;
      r:l;
      ];
    ];
  blocks
  };

{sum x* til count x} twoSOlve blocks
