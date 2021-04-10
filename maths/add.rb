# A ruby program to add numbers
# Addition or sum of numbers means adding each and every element of the inputs
# Sum or addition of 1 and 3 is 1 + 3 = 4

def self_add(*array)
  sum = 0
  array.each { |a| sum+=a }
  puts "The sum of following elements #{array} is #{sum}"
  rescue
    puts "Error: Please provide number only!"
end

# Valid inputs
self_add(1)
self_add(2, 5, -4)
self_add(25, 45)

# Invalid inputs
self_add("1", 2, 3)
self_add("a", 1)
