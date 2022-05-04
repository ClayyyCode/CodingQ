input: "J"$" " vs 'read0 `:input.txt
m_input: .[input; (::;0);{(x*2)-1}]
m_input: (1 2; -1 3; 1 1; -1 1; 1 5)
ch12:{`finalfloor`times`dir!{x[0]<count m_input}{(x[0] + x[2]* prd m_input[x[0]];x[1]+1;x[2]*m_input[x[0]][0])}/(0;1;1)}










/
I get this all the time- how do you backtest a strategy.
Well, here's a simple way. Every trade has 4 components- it's entry time, it's profit objective (ge: good exit)) it's stop limit (se- stop exit) and a time exit (te).
The code below will, given a table with a column "entry" which is boolean and a price will backtest the strategy (this is a version for going long). 
I like to back test against quotes, but this is for prices (trades).
\


btL:{[t;gep;sep;tep]
  i_eb:where t`entry; //where are the entry indicies
  i_te:(count t)^((t`time) bin/: ((t@i_eb)`time)+tep*1000); //find the indicies for the time exits
  rng:{x+key floor (y-x)}'[i_eb;i_te]; //define the ranges
  f_u:{[xe;limit;p;x]limit&x+xe>p x};f_l:{[xe;limit;p;x]limit&x+xe<p x}; //functions for upper and lower limits
  e_pr:(t`entryprice)i_eb; //define the entry prices
  i_ge:f_u[(e_pr+gep);i_te;t`bid1]/[i_eb]; //indices for the good exits
  i_se:f_l[(e_pr-sep);i_te;t`bid1]/[i_eb]; //indices for the stop exits
  i_xe:min each v:(count t)^flip (i_te;i_ge;i_se); //define the exit action
  x_ty:(`te`ge`se)@/:i_x:first each iasc each v; //define the exit types
  x_pr:(t`bid1) i_xe; //the exit price is the bid at the exit index
  x_pl:x_pr-(e_pr); //the exit pnl is the exit price- entry price
  `entrytime`exittime`entryprice`exittype`exitprice`exitindx`pnl!((t`time)i_eb;(t`time)i_xe;e_pr;x_ty;x_pr;i_xe;x_pl)
  }

n:1000;
t:`time xasc flip `time`price`entry`entryprice!(n?`time$.z.Z;n?10;n?01b;n?10)
btL[t;2;1;30] //go for 2$,risk 1$, hold for 30 seconds



drawdown:{[x]v:u?max u:(maxs x)-x;(u v;x?x[v]+u v;v)};

//This returns a vector, the drawdown value, the index of the start and end of that period.


//EMA
ema:{[n;x]b:1-a:2%n+1;c:(sum n#x)%n;((n-1)#0n),c,c{[a;b;x;y](a*y)+b*x}[a;b]\n _x};

//Smooth Moving Average
smavg:{[n;x]((n-1)#0n),i,{(z+(x-1)*y)%x}[n]\[i:avg n#x;n _ x:0^x]};

//Max Consecutive Losses
MaxConsectiveLosers:(max count each "0"vs raze string pl<0)