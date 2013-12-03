# coding=utf-8
# 1.1 Pass value
array = [3, 1, 4, 6, 2]

def test(arr)
  arr.sort   # Do not mutate
end

test array
p array

# 1.2 Pass reference
array = [3, 1, 4, 6, 2]

def test(arr)
  arr.sort!   # Do mutate
end

test array
p array
