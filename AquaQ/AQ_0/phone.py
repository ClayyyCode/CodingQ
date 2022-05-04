#%%
input = [[l[0], l[2]] for l in open("./input.txt").readlines()]
nums = "234567890"
chars = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz", "-"]
d = {key: chars[keyIndex] for keyIndex, key in enumerate(nums)}
lookup = {k: {count + 1: c for count, c in enumerate(v)} for k, v in d.items()}
lookup
#[lookup[i[0]][int(i[1])] for i in input]
# %%

input

# %%
[i for i in enumerate(nums)]
# %%

["" for i in nums]
# %%
{"" for i in nums}
# %%
{i: "" for i in nums}

# %%
d
# %%
