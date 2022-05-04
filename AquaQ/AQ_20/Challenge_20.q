input: `$" " vs first read0 `:input.txt
m: ?[input in `J`Q`K; `10;input]
m_input: "I"$string @[m;where m = `A;:;`1]
test_input: 3 1 10 9 1 7 4 9

{x[3] < count m_input}{
    draws: x[3];
    wins: x[2];
    switch: x[1];
    if[m_input[draws]=1; switch:1];
    psum: x[0]+m_input[draws];
    if [(21=psum)|21=psum+switch*10;:(0;0;wins+1;draws+1)];
    if [psum>21;:(0;0;wins;draws+1)];
    (psum;switch;wins;draws+1)
    }/0 0 0 0
// 256