# Power of 2
#
# Given an integer n, return true if it is a power of two. Otherwise, return false.
#
# An integer n is a power of two, if there exists an integer x such that n == 2^x.
#
# Example 1:
# Input: n = 1
# Output: true
# Explanation: 2^0 = 1
#
# Example 2:
# Input: n = 16
# Output: true
# Explanation: 2^4 = 16
#
# Example 3:
# Input: n = 3
# Output: false
#
# Example 4:
# Input: n = 4
# Output: true
#
# Example 5:
# Input: n = 5
# Output: false
#
# Constraints: -231 <= n <= 231 - 1
# @param {Integer} n
# @return {Boolean}
#

# Approach 1: Recursion
#
# Time Complexity: O(logn)
#
def is_power_of_two(n)
  if n == 1
    true
  elsif n.even?
    is_power_of_two(n / 2)
  else
    false
  end
end

n = 1
# Output: true
puts is_power_of_two(n)
n = 16
# Output: true
puts is_power_of_two(n)
n = 3
# Output: false
puts is_power_of_two(n)
n = 4
# Output: true
puts is_power_of_two(n)
n = 5
# Output: false
puts is_power_of_two(n)

#
# Approach 2: Without recursion
#
# Time Complexity: O(n)
#
def is_power_of_two(n)
  n /= 2 while n.even? && n != 0
  n == 1
end

n = 1
# Output: true
puts is_power_of_two(n)
n = 16
# Output: true
puts is_power_of_two(n)
n = 3
# Output: false
puts is_power_of_two(n)
n = 4
# Output: true
puts is_power_of_two(n)
n = 5
# Output: false
puts is_power_of_two(n)

#
# Approach 3: Using Math library
#
# Time Complexity: O(1)
#
def is_power_of_two(n)
  result_exponent = Math.log(n) / Math.log(2)
  result_exponent % 1 == 0
end

n = 1
# Output: true
puts is_power_of_two(n)
n = 16
# Output: true
puts is_power_of_two(n)
n = 3
# Output: false
puts is_power_of_two(n)
n = 4
# Output: true
puts is_power_of_two(n)
n = 5
# Output: false
puts is_power_of_two(n)
