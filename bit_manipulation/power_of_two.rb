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

#
# Approach 1: Bitwise operators: Turn off the Rightmost 1-bit
#

# Note that there are two ways of solving this problem via bitwise operations:
# 1. How to get / isolate the rightmost 1-bit: x & (-x).
# 2. How to turn off (= set to 0) the rightmost 1-bit: x & (x - 1).
# In this approach, we're reproducing item 2.

# Complexity Analysis
#
# Time complexity: O(1).
# Space complexity: O(1).

def is_power_of_two(n)
  return false if n < 1

  n & (n - 1) == 0
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
