# A ruby program to add numbers
# Addition or sum of numbers means adding each and every element of the inputs
# Sum or addition of 1 and 3 is 1 + 3 = 4

def add(*array)
  sum = 0
  array.each { |a| sum += a }
  puts "The sum of following elements #{array} is #{sum}"
rescue StandardError
  puts 'Error: Please provide number only!'
end

#
# Valid inputs
#

puts add(1)
# The sum of following elements [1] is 1

puts add(2, 5, -4)
# The sum of following elements [2, 5, -4] is 3

puts add(25, 45)
# The sum of following elements [25, 45] is 70

#
# Invalid inputs
#

puts add('1', 2, 3)
# Error: Please provide number only!

puts add('a', 1)
# Error: Please provide number only!
