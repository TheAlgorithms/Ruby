# frozen_string_literal: true

# n! means n x (n - 1) x ... x 3 x 2 x 1

# For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

# method to calculate factorial of a number
def factorial(number)
  number.downto(1).reduce(:*)
end

# fetch digits of factorial of `number` and find
# sum of all those digits, and prints the result on the console
number = 100
puts factorial(number).digits.sum
