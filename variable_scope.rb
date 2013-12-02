#1 Create a local variable and modify it at an inner scope
#1.1  Re-assigning the variable to something else
a = "Desmond"
array = [1,2,3]

array.each do
  a = "Linda"
end

puts a

#1.2 Call a method that doesn’t mutate the caller
array.each do
  a.downcase
end

puts a

#1.3 Call a method that mutates the caller
array.each do
  a.downcase!
end

puts a

#2.1 Create a local variable at an inner scope
# and reference it in the outer scope
array.each do
  b = "Desmond"
end

puts b   #error

#2.2 Nested do/end blocks
array.each do
  array.each do
    b = "Desmond"
  end

  puts b   #error
end

puts b   #error
