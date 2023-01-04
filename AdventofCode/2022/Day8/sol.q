input: "I"$''read0 `input.txt
/input: (3 0 3 7 3; 2 5 5 1 2; 6 5 3 3 2; 3 3 5 4 9; 3 5 3 9 0)
input

w: flip 0^(next') flip input
a: 0^(next') input
s: flip 0^(prev') flip  input
d: 0^(prev') input
width: count input
height: count input[;0]

w: @[w;til height div 2;:;(height div 2)#enlist width#9]
s: @[s;height-1+til height div 2;:;(height div 2)#enlist width#9]
a: flip @[flip a;til height div 2;:;(height div 2)#enlist width#9]
d: flip @[flip d;height-1+til height div 2;:;(height div 2)#enlist width#9]

input > w
input > a
w
any each
first
(sum/)

res: any each flip input >/: (w;a;s;d)
res: @[res;(0;height-1);:;2#enlist width#1b]
res: flip @[flip res;(0;height-1);:;2#enlist width#1b]
(sum/) res

