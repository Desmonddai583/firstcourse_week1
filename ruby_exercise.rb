#1 Iterate an array
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.each {|el| puts el}

#2 Iterate an array with condition
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.each {|el| puts el if el > 5}

#3 Select elements to a new array
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array2 = array.select {|el| el % 2 == 1}
p array2

#4 Append and prepend an element into an array
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.push(11)
array.unshift(0)
p array

#5 Pop an element and append one
array.pop
array.push(3)
p array

#6 Uniq the array
array.uniq!
p array

#7 Array is based on index,value while Hash is based on key,value

#8 Create a hash
#For Ruby 1.8
h = {:a => 1, :b => 2, :c => 3, :d => 4}
puts h
#For Ruby 1.9
h = {a: 1, b: 2, c: 3, d: 4}
puts h

#9 Get the value from hash
puts h[:b]

#10 Add an new pair
h[:e] = 5
puts h

#11 Remove pairs with a condition
h.delete_if {|k,v| v < 3.5}
puts h

#12 Hash values can be array and Array can include hash
h = {a: [1,2,3], b: 2}
puts h
array = [h,3,"Desmond"]
p array
