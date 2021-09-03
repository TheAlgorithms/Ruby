# A ruby program to find factorial of a given integer
# Factorial of a given integer is defined as the product of all the positive integers less than or equal to the given integer
# Mathematical representation: n! = n * (n - 1) * (n - 2) * ... * 1

#
# Non-recursive and non-iterative approach
#

def factorial(number)
  if number < 0
    'Please check your input number! The given number is a negative number.'
  elsif number == 0
    "The factorial of #{number} is 1."
  else
    result = (1..number).inject(:*)
    "The factorial of #{number} is #{result}."
  end
rescue StandardError
  'Error: Please provide integer only!'
end

# Valid inputs
puts factorial(0)
# The factorial of 0 is 1.

puts factorial(4)
# The factorial of 4 is 24.

puts factorial(10)
# The factorial of 10 is 3628800.

puts factorial(1)
# The factorial of 1 is 1.

puts factorial(-5)
# Please check your input number! The given number is a negative number.

# Invalid inputs
puts factorial('a')
# Error: Please provide integer only!

puts factorial('2')
# Error: Please provide integer only!
