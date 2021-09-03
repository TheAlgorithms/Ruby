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
# Approach 1: Recursion
#
# Time complexity: O(n)
#
def add_digits(num)
  return num if num.to_s.length < 2

  digits_to_sum = num.to_s.split('')
  sum = 0
  digits_to_sum.each do |num|
    sum += num.to_i
  end

  add_digits(sum)
end

puts(add_digits(38))
# # => 2

puts(add_digits(284))
# # => 5

#
# Approach 2: Without recursion
#
def add_digits(num)
  until num.to_s.length < 2
    digits_to_sum = num.to_s.split('')
    num = 0

    digits_to_sum.each do |number|
      num += number.to_i
    end
  end
  num
end

puts(add_digits(38))
# => 2

puts(add_digits(284))
# => 5
