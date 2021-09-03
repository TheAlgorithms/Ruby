# You are climbing a staircase. It takes n steps to reach the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# Example 1:
# Input: n = 2
# Output: 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps

# Example 2:
# Input: n = 3
# Output: 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step

# Constraints:
# 1 <= n <= 45

# Dynamic Programming, Recursive Bottom Up Approach - O(n) Time / O(n) Space
# Init memoization hash (only 1 parameter)
# Set base cases which are memo[0] = 1 and memo[1] = 1, since there are only 1 way to get to each stair
# Iterate from 2..n and call recurse(n, memo) for each value n.
# Return memo[n].

# recurse(n, memo) - Recurrence Relation is n = (n - 1) + (n - 2)
# return memo[n] if memo[n] exists.
# otherwise, memo[n] = recurse(n - 1, memo) + recurse(n - 2, memo)

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  memo = {}

  memo[0] = 1
  memo[1] = 1

  return memo[n] if [0, 1].include?(n)

  (2..n).each do |n|
    recurse(n, memo)
  end

  memo[n]
end

def recurse(n, memo)
  return memo[n] if memo[n]

  memo[n] = recurse(n - 1, memo) + recurse(n - 2, memo)
end

puts climb_stairs(2)
# => 2

puts climb_stairs(4)
# => 5

puts climb_stairs(10)
# => 89

puts climb_stairs(45)
# => 1836311903
