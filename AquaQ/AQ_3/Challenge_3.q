input: "LDRDLRDRDDRLRLDLLLUULURURLDULUUDRRDDRUDDRLRRULRDUDRUDRRLRDLDRULLDUUULDRRLDDLURLURRURLRLRUULDULDLLLUDLULDUUUDLDLLUUULDDLUURDUDDRULRULRULRDULRULULRLRDRDRULLRDRRRULLRDRDDRDULDDDUUDDRDRLRRRUUDDDULULLULURURLURULRDRUDLULRULLRRLLLRRRLRRLUULDUUUULLRDRRUULULURRURDRLDLLRUDULDRULDDRURLDRDLRRULRDRRUDRURULDURRULDLDULRLLLRLUURDLUUURUDLRLUUULULULUDRRDRUDLUDLRUUUDRRDDLLUDLDURDLRRRDRDLRLRRUDLRDRUUDULLDDRRUUDDRDRDLDRLLRRRUDLRDRUDDRURLLLDDLRRDUDDUDULURDLULDDLDRRRLLLRLDUURDUDULDDRRDRDLLDRDRRLLULLLRLURLLDDLDLRDUUUDR"
area: ("  ##  ";
       " #### ";
       "######";
       "######";
       " #### ";
       "  ##  ")
init_x: 2
init_y: 0
sum_: 0
f:{[input_] 
 x:init_x;
 y:init_y;
 $[input_~"L"; x-:1;
   input_~"R"; x+:1;
   input_~"U"; y-:1;
   input_~"D"; y+:1;
   ];
 if[area[x][y]~"#"; init_x::x; init_y::y];
 sum_+:init_x + init_y;

 }

f'[input] 