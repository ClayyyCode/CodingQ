// bubble sort 
p: -3315?598009
f: {first {(x[1]+1) <count x[0]}{
    l: x[0];
    i: x[1];
    if[l[i] <= l[i+1];:(l;i+1)];
    c: @[l;i+1;:;l[i]];
    :(@[c;i;:;l[i+1]];i+1)
    }/(x;0)}
sd: `s#(f/) p
// improvement when ignoring and storing the last num; {(-1_x;-1#x)}f p