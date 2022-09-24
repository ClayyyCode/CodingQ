input: 245701
ava: {asc (union/) 25,50,x, (2*x), 3*x} 1+til 20


/ ch8
dmc: ("DJJ";enlist ",") 0:`input.txt
mc: exec milk, cereal from dmc
first each mc
{if [0 < x&y; show(x-100;y-100)]}[1000;1000]

/ ch 18
tt: "V"$read0 `input18.txt

a:({if[c ~ reverse c:string x; :x]; (x-1)}/) each tt
b:({if[c ~ reverse c:string x; :x]; (x+1)}/) each tt
sum "i"$min each (abs a-tt),' abs b-tt

({if[c ~ reverse c:string x; :x]; (x+1)}/) 13:41:00
c ~ reverse c:string first tt

/ch 37
input: read0 `words.txt
input: input where 5 = count each input
input
