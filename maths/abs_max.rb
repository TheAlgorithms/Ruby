# A ruby program to find absolute maximum
# Mathematical representation of abs max = ((a + b + absoulte(a - b)) / 2)

def abs_max(x, y)
  num = x - y
  max_value = ((x + y + num.abs) / 2)
  "The Abs Max of #{x} and #{y} is #{max_value}."
rescue StandardError
  'Error: Provide number only!'
end

# Valid inputs
puts abs_max(10, 20)
# The Abs Max of 10 and 20 is 20.

puts abs_max(-10, -1)
# The Abs Max of -10 and -1 is -1.

puts abs_max(9, -121)
# The Abs Max of 9 and -121 is 9.

# Invalid inputs
puts abs_max(2, '-1')
# Error: Provide number only!

puts abs_max('3', '5')
# Error: Provide number only!

puts abs_max('a', '5')
# Error: Provide number only!
