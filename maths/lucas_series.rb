# A ruby program for Lucas series
#
# The Lucas numbers, commonly denoted L(n) form a sequence,
# called the Lucas series, such that each number is the sum
# of the two preceding ones, starting from 2 and 1. That is,
#
# L(0) = 2, L(1) = 1
# L(n) = L(n - 1) + L(n - 2), for n > 1.
#
# Given n, calculate L(n).
# Example: 2 1 3 4 7 11 18...
# Resource: https://en.wikipedia.org/wiki/Lucas_number

def lucas(number)
  golden_ratio = (1 + 5**0.5) / 2
  (golden_ratio**number).round.to_i
rescue StandardError
  'Error: Provide number only!'
end

puts lucas(4)
# 7

puts lucas(3)
# 4

puts lucas('3')
# Error: Provide number only!

puts lucas(2)
# 3
