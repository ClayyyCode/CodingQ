data: read0 `:input;
fn: {
  input: ":" vs x;
  id: first input;
  balls: last input;
  res: {flip (enlist[`cnt]!enlist "J"$x),enlist[`color]!enlist `$y} . flip 1_/:" " vs/:"," vs ssr[;";";","] balls;
  a: count select from res where color = `red, cnt >12;
  b: count select from res where color = `blue, cnt >14;
  c: count select from res where color = `green, cnt >13;
  /break;
  if[0=sum(a;b;c);:"J"$last " " vs id];
  0
  };
sum fn each  data

// part 2
fn2: {
  input: ":" vs x;
  id: first input;
  balls: last input;
  res: {flip (enlist[`cnt]!enlist "J"$x),enlist[`color]!enlist `$y} . flip 1_/:" " vs/:"," vs ssr[;";";","] balls;
  prd @[;`cnt] 0!select max cnt by color from res
  };
sum fn2 each  data
