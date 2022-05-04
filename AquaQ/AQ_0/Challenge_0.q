input: read0`:input.txt
//type(input[0;0]) //atom is -10h
phone_map: "234567890"!("abc";"def";"ghi";"jkl";"mno";"pqrs";"tuv";"wxyz";enlist(" "))
phone_map_list: phone_map input[;0]
message_sim_int_list: ("I"$(),/: input[;2]) - 1
coversion_list: (til count(message_sim_int_list)),'message_sim_int_list
show msg: phone_map_list ./:coversion_list