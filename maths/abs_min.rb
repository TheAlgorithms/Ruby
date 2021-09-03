# A ruby program to find absolute minimum
# Mathematical representation of abs min = ((a + b - absoulte(a - b)) / 2)

def abs_min(x, y)
  num = x - y
  min_value = ((x + y - num.abs) / 2)
  "The Abs Min of #{x} and #{y} is #{min_value}."
rescue StandardError
  'Error: Provide number only!'
end

#
# Valid inputs
#
puts abs_min(10, 20)
# The Abs Min of 10 and 20 is 10.

puts abs_min(-10, -1)
# The Abs Min of -10 and -1 is -10.

puts abs_min(9, -121)
# The Abs Min of 9 and -121 is -121.

#
# Invalid inputs
#
puts abs_min(2, '-1')
# Error: Provide number only!

puts abs_min('3', '5')
# Error: Provide number only!

puts abs_min('a', '5')
# Error: Provide number only!
