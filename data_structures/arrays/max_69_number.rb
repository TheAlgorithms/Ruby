# Challenge name: Maximum 69 number
#
# Given a positive integer num consisting only of digits 6 and 9.
# Return the maximum number you can get by changing at most one digit (6 becomes 9, and 9 becomes 6).
#
# Example 1:
# Input: num = 9669
# Output: 9969
# Explanation:
# Changing the first digit results in 6669.
# Changing the second digit results in 9969.
# Changing the third digit results in 9699.
# Changing the fourth digit results in 9666.
# The maximum number is 9969.
#
# Example 2:
# Input: num = 9996
# Output: 9999
# Explanation: Changing the last digit 6 to 9 results in the maximum number.

#
# Approach 1: Logical Approach
# Explanation: Changing the first available 6 to a 9 will give the max number
#
def max_number(num)
  arr = num.to_s.split('')

  arr.each_with_index do |num, i|
    if num == '6'
      arr[i] = '9'
      return arr.join.to_i
    end
  end
end

puts max_number(9669)
# => 9969

puts max_number(9996)
# => 9999
