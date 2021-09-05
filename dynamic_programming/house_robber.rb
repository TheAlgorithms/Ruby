# You are a professional robber planning to rob houses along a street.
# Each house has a certain amount of money stashed, the only constraint stopping you
# from robbing each of them is that adjacent houses have security systems connected
# and it will automatically contact the police if two adjacent houses
# were broken into on the same night.
#
# Given an integer array nums representing the amount of money of each house,
# return the maximum amount of money you can rob tonight without alerting the police.
#
# Example 1:
#
# Input: nums = [1,2,3,1]
# Output: 4
# Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
# Total amount you can rob = 1 + 3 = 4.
#
# Example 2:
#
# Input: nums = [2,7,9,3,1]
# Output: 12
# Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
# Total amount you can rob = 2 + 9 + 1 = 12.

#
# Approach 1: Dynamic Programming
#

# Complexity Analysis
#
# Time Complexity: O(N) since we process at most N recursive calls, thanks to
# caching, and during each of these calls, we make an O(1) computation which is
# simply making two other recursive calls, finding their maximum, and populating
# the cache based on that.
#
# Space Complexity: O(N) which is occupied by the cache and also by the recursion stack

def rob(nums, i = nums.length - 1)
  return 0 if i < 0

  [rob(nums, i - 2) + nums[i], rob(nums, i - 1)].max
end

nums = [1, 2, 3, 1]
puts rob(nums)
# Output: 4

nums = [2, 7, 9, 3, 1]
puts rob(nums)
# Output: 12

#
# Approach 2: Optimized Dynamic Programming
#

# Time Complexity
#
# Time Complexity: O(N) since we have a loop from N−2 and we use the precalculated
# values of our dynamic programming table to calculate the current value in the table
# which is a constant time operation.
#
# Space Complexity: O(1) since we are not using a table to store our values.
# Simply using two variables will suffice for our calculations.
#

def rob(nums)
  dp = Array.new(nums.size + 1)

  (nums.size + 1).times do |i|
    dp[i] = if i == 0
              0
            elsif i == 1
              nums[0]
            else
              [dp[i - 2] + nums[i - 1], dp[i - 1]].max
            end
  end

  dp[-1]
end

nums = [1, 2, 3, 1]
puts rob(nums)
# Output: 4

nums = [2, 7, 9, 3, 1]
puts rob(nums)
# Output: 12
