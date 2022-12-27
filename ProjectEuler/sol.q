// Q1
s: {except[;y] x*1+til y div x};
f: s[;1000];
res: sum raze (f[3]; f[5]; neg f[3*5])

// Q6
n: "f"$1+til 100
"i"$(sum[n] xexp 2) - n mmu n


// Q31
coins: 1 2 5 10 20 50 100 200f;
floor_: count[coins]#0f;
ceiling_: 200f div coins;
til each "i"$ceiling_

v mmu coins

