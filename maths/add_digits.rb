# Challenge name: Add Digits
#
# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
#
# Example:
#
# Input: 38
# Output: 2
# Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
#              Since 2 has only one digit, return it.
#
# Follow up:
# Could you do it without any loop/recursion in O(1) runtime?
# @param {Integer} num
# @return {Integer}

#
# Approach: Mathematical: Digital Root
# https://en.wikipedia.org/wiki/Digital_root
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
