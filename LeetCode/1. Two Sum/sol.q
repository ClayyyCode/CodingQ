nums: 2 7 11 15
t: 9

/nums: 3 2 4
/target: 6

//x: list; y: target
soln: {where cx > rem where not (til cx:count x) ~' rem:x?y-x}

//
/(i[a];a:last where &[b>i;not (i:n?t-n)=til b:count n])
/ 
\

//New sol
/a: a =\: a:til count nums // identity matrix to get rid of matches(1) in the diagonal, which means the same number is sum up twice
/(nums~/:\:t-nums) // (t-num): finding sum complement for each n in num  ; ~/:\: each n in num compare with each n in (t-num), !!diff from ' as ' is each both
new_sol: where 1 in/: (nums~/:\:t-nums) - a =\: a:til count nums // The equality operator = differs from Match ~ in that it is atomic in both operands, meaning it tests its operands atom-wise instead of in entirety. 
//= is like ~'