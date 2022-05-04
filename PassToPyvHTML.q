/
/ data: key `:data
ADA: ("DFFFFFFFFFF";enlist",") 0: `:data/ADA24032022.csv

US2Y: fills ("DF";enlist",") 0: `:data/UST2year24032022.csv // cleaned
\

// ------- Data Cleaning for QQQ
QQQ: ("DFFFF";enlist",") 0: `:data/QQQ24032022.csv
QQQ: QQQ where not null exec close from QQQ // cleaned
QQQ: `timestamp xasc QQQ
update close_tm1: -1 rotate close from `QQQ
QQQ: 1_QQQ


update log_r: log close%close_tm1 from `QQQ // log return
update sym:`QQQ.s from `QQQ
QQQ: `date xcol select timestamp, close, log_r, sym from QQQ

\l indicators.q
QQQ_strat: 26_.ind.macd[`QQQ;`QQQ.s]

INIT: 10000f
update cash: 0, pos:0, pos_state: macd > signal from `QQQ_strat
update cash: (INIT, 1_cash), pos_sig: pos_state - (0b,1_-1 rotate pos_state) from `QQQ_strat
update pos:{$[x ~ 1i; floor y%z; x ~ -1i; 0;last x]} '[pos_sig;cash;close] from `QQQ_strat

exec close, pos_sig from QQQ_strat


func: {
  temp: `cash`pos!(enlist(INIT);enlist(0));
  {[x;y;temp]$[x = 1; (temp[`pos],: floor (last temp[`cash])%y; temp[`cash],: (last temp[`cash])- y*last temp[`pos]);
    x = 0; temp[`pos],: last temp[`pos];
    x = -1; (temp[`pos],: 0; temp[`cash],: (last temp[`cash])+ y*last temp[`pos])]}[1;187.8;temp]
    }

func: {
  temp: `cash`pos!(enlist(INIT);enlist(0));
  {[x;y;temp] (temp[`pos],: floor (last temp[`cash])%y; temp[`cash],: (last temp[`cash])- y*last temp[`pos])}[1;187.8;temp]
    }




// -------- Auto correlation
ac: select h_v: (sqrt 252) * 30 mdev l_r from QQQ
update h_v1: -1 rotate h_v, h_v2: -2 rotate h_v, h_v5: -5 rotate h_v, h_v10: -10 rotate h_v from `ac
ac: 11_ac
(flip ac) cor/:\: flip ac

.z.ph:{.h.hn["404";`csv;"\n" sv .h.cd value 1_x 0]} // HTML get


