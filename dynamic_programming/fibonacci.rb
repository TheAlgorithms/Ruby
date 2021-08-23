# The Fibonacci numbers, commonly denoted F(n) form a sequence,
# called the Fibonacci sequence, such that # each number is the sum
# of the two preceding ones, starting from 0 and 1. That is,
#
# F(0) = 0, F(1) = 1
# F(n) = F(n - 1) + F(n - 2), for n > 1
#
# Given n, calculate F(n).

#
# Approach: Top-Down Approach using Memoization
#

# Complexity Analysis:
#
# Time complexity: O(n). Each number, starting at 2 up to and
# including N, is visited, computed and then stored for O(1) access
# later on.
#
# Space complexity: O(n). The size of the stack in memory is
# proportionate to N.
#
def fibonacci(number, memo_hash = {})
  return number if number <= 1

  memo_hash[0] = 0
  memo_hash[1] = 1

  memoize(number, memo_hash)
end

def memoize(number, memo_hash)
  return memo_hash[number] if memo_hash.key? number

  memo_hash[number] = memoize(number - 1, memo_hash) + memoize(number - 2, memo_hash)

  memoize(number, memo_hash)
end

n = 2
fibonacci(n)
# Output: 1
# Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.

n = 3
fibonacci(n)
# Output: 2
# Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.

n = 4
fibonacci(n)
# Output: 3
# Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
