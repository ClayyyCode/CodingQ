input: asc ("DSSIISSSS";1#",") 0: `:input.txt
all_teams: (union) . input`away_team`home_team;
res: raze {tab:  asc (select date, score: home_score from input where home_team = x) uj (select date, score: away_score from input where away_team = x);
      tab: update sel: 1b from tab where any score =/: (prev score; next score), score = 0;
      tab: update sel | differ sel from tab;
      enlist[x]! enlist c q?max q: {last[x] - first x} each c: (tab`date) (where 1< deltas where tab`sel) _ where tab`sel
   } each all_teams

desc {last[x] - first x} each res
q)))    res`Canada
1888.09.19 1921.07.09 1924.06.07
