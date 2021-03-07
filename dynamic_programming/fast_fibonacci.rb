# The Fibonacci numbers, commonly denoted F(n) form a sequence,
# called the Fibonacci sequence, such that # each number is the sum
# of the two preceding ones, starting from 0 and 1. That is,

# F(0) = 0, F(1) = 1
# F(n) = F(n - 1) + F(n - 2), for n > 1.
# Given n, calculate F(n).

#
# Approach: Bottom-Up Approach using Memoization
#

# Complexity Analysis:
#
# Time complexity: O(n)
# Space complexity: O(n)
#

def fibonacci(number, memo_hash = {})
    if number == 0 || number == 1
        return number
    end
    memo_hash[number] ||= fibonacci(number - 1, memo_hash) + fibonacci(number - 2, memo_hash)
end
