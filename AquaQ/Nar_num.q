a: 0f
b:0f
j:{`a set a+1f;
 f:{xexp["I"$(c: string a)[x];d: count string a]};
 if[a~sum @/:[f;til count string a];`b set b+a]
 }
//do[2000000;j[]]
show b

/sum where til x = sum each xexp("I"$'' string til x;count each string til x)

narc:{[n]
  / flat list containing exponents - x^y is indexable by doing r[(10*y)+x]
  r:raze til[10] xexp/: til 1+count string n;
  / matrix of digits 
  m:n#'where each deltas each n&sums each 10#/:p:floor 10 xexp til count string n;
  / digit count
  d:n#where deltas[p],n-max p;
  / totals
  o:sum r m+\:10*d;
  / sum of matches
  sum o where til[n]=not[o<10]*o}

narc 2000000