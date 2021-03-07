# The Fibonacci numbers, commonly denoted F(n) form a sequence,
# called the Fibonacci sequence, such that # each number is the sum
# of the two preceding ones, starting from 0 and 1. That is,

# F(0) = 0, F(1) = 1
# F(n) = F(n - 1) + F(n - 2), for n > 1.
# Given n, calculate F(n).

#
# Approach: Top-Down Approach using Memoization
#

# Complexity Analysis:
#
# Time complexity: O(n). Each number, starting at 2 up to and
# including N, is visited, computed and then stored for O(1) access
# later on.
# Space complexity: O(n). The size of the stack in memory is
# proportionate to N.
#
def fib(n)
  return n if n <= 1

  cache = {}
  cache[0] = 0
  cache[1] = 1

  memoize(n, cache)
end

def memoize(n, cache)
  return cache[n] if cache.keys.include? n

  cache[n] = memoize(n - 1, cache) + memoize(n - 2, cache)

  memoize(n, cache)
end

n = 2
# Output: 1
# Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
puts(fib(n))

n = 3
# Output: 2
# Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
puts(fib(n))

n = 4
# Output: 3
# Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
puts(fib(n))
