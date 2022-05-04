input_str: "do you think that maybe like, 1 in 10 people could be actually robots?"
bgcolor:"kdb4life"
HEX:"0123456789abcdef"
//input_str in HEX
if [(count input_str) mod 3;input_str,: ((count input_str) mod 3)_"000"]
padded: ((count input_str) div 3) cut input_str
for_map: raze padded[;0 1]
show ?[for_map in HEX;for_map;"0"] 