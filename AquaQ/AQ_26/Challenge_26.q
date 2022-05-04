input:"J"$ {#[neg 14i&count x;x]} each read0 `:input.txt 

g:{10 sv reverse first {x[1] < count x[0]}{   
    i: x[1]; 
    x: x[0]; 
    m: x i; 
    st: first asc t where m < t:(i)#x;
    if [st = 0N; :(x;i+1)];
    jj: @[((i)#x);first where st = (i)#x;:;0N] except 0N;
    jk: (desc jj,: m), st, (i+1)_x;
    :(jk;count x+1)
    }/ ( reverse 10 vs x ; 0)}

sum input - g each input
