# The Fibonacci numbers, commonly denoted F(n) form a sequence,
# called the Fibonacci sequence, such that each number is the sum
# of the two preceding ones, starting from 0 and 1. That is,
#
# F(0) = 0, F(1) = 1
# F(n) = F(n - 1) + F(n - 2), for n > 1.
#
# Given n, calculate F(n).

#
# Approach: Math
#

# Intuition: Using the golden ratio, a.k.a Binet's formula

# Algorithm: Use the golden ratio formula to calculate the Nth Fibonacci number.
# https://demonstrations.wolfram.com/GeneralizedFibonacciSequenceAndTheGoldenRatio/

# Complexity Analysis

# Time complexity: O(1). Constant time complexity since we are using no loops or recursion
# and the time is based on the result of performing the calculation using Binet's formula.
#
# Space complexity: O(1). The space used is the space needed to create the variable
# to store the golden ratio formula.

def fibonacci(n)
  golden_ratio = (1 + 5**0.5) / 2
  ((golden_ratio**n + 1) / 5**0.5).to_i
end

n = 2
puts(fibonacci(n))
# Output: 1
# Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.

n = 3
puts(fibonacci(n))
# Output: 2
# Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.

n = 4
puts(fibonacci(n))
# Output: 3
# Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
