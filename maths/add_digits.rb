# Challenge name: Add Digits
#
# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
#
# Example:
#
# Input: 38
# Output: 2
# Explanation: 3 + 8 = 11, 1 + 1 = 2.

#
# Approach: Mathematical: Digital Root
#
# https://en.wikipedia.org/wiki/Digital_root
# https://brilliant.org/wiki/digital-root/
#

#
# Complexity Analysis
#
# Time Complexity: O(1).
# Space Complexity: O(1).

def add_digits(num)
  return 0 if num == 0
  return 9 if num % 9 == 0

  num % 9
end

puts(add_digits(38))
# # => 2

puts(add_digits(284))
# # => 5
