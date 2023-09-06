input: read0 `input.txt
test: read0 `test.txt
// a list to store temporal sum; cd.. then push back that sum to last level,

levelSum: 30#0;
levelIdx: 0;
atMost100KSize: 0;
jj:{
  if[100000 > levelSum levelIdx;atMost100KSize+:levelSum levelIdx];
      levelSum[levelIdx-1]+:levelSum[levelIdx];
      levelSum[levelIdx]:0;
      levelIdx-:1
 };
dfs:{
  show levelIdx;
  $[x like "[0-9]*"; levelSum[levelIdx]+:"I"$first " " vs x;
    x ~ "$ cd .."; jj[];
    x ~ "$ ls";(::);
    x like "dir*";(::);
    levelIdx+:1];
  (x;atMost100KSize;levelIdx;levelSum)
  }
//Q1
c: dfs each input,enlist "$ cd .."

//Q2
unusedSpace: 30000000 - 70000000 - sum levelSum;
min p where unusedSpace < p:{last x except 0} each (c where ( differ c[;2]) &  c[;0] like\: "$ cd ..")[;3]

/

// the below would work if the dir name are distinct on a level, probably never revisit again
f: {
  bigD: -1# .dir.Content;
  if[x ~ "$ cd ..";
    .dir.idxLevel-:1;:(::)
    ];
  if[ssr[x;"..";""] like "$ cd*";
    dir: ssr[x;"$ cd ";string .dir.idxLevel];
    `.dir.Content upsert 1!enlist `dir`content! (dir;enlist "");
        .dir.idxLevel+:1;:(::)];
  if[not x ~ "$ ls";
    `.dir.Content upsert update content: enlist {x,y}[raze content; enlist ssr[x;"dir ";string .dir.idxLevel]] from bigD];
 }

.dir.idxLevel: 0;
.dir.Content:([dir:()];content:());
.dir.goodContent: exec dir!"I"$/:content from update content: count[i]#"" from .dir.Content;
{.dir.goodContent:: .dir.goodContent ^ except\:[;0N ]raze each  (.dir.goodContent x) ,'"I"$/: -1_/:/:" "  vs/:/:  x}each desc exec dir!content by level from update level: first each dir from 0!.dir.Content


 handle: desc exec dir!content by level from update level: first each dir from 0!.dir.Content
{[handle]
  good: first handle;
  gg: raze each  "I"$-1_/:/:" " vs/:/: good;
  }

update content: enlist {x,y}[content; enlist  ssr[x;"dir ";string .dir.idxLevel]] from enlist[bigD]
