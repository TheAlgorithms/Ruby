# Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
# A subarray is a contiguous part of an array.

# Example 1:
# Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.

# Example 2:
# Input: nums = [1]
# Output: 1

# Example 3:
# Input: nums = [5,4,-1,7,8]
# Output: 23

# Constraints:
# 1 <= nums.length <= 3 * 104
# -105 <= nums[i] <= 105

# Dynamic Programming Approach (Kadane's Algorithm) - O(n) Time / O(1) Space
#
# Init max_sum as first element
# Return first element if the array length is 1
# Init current_sum as 0
# Iterate through the array:
# if current_sum < 0, then reset it to 0 (to eliminate any negative prefixes)
# current_sum += num
# max_sum = current_sum if current_sum is greater than max_sum
# Return max_sum

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  # initialize max sum to first number
  max_sum = nums[0]

  # return first number if array length is 1
  return max_sum if nums.length == 1

  # init current sum to 0
  current_sum = 0

  # iterate through array, reset current_sum to 0 if it ever goes below 0, track max_sum with highest current_sum
  nums.each do |num|
    current_sum = 0 if current_sum < 0

    current_sum += num

    max_sum = [max_sum, current_sum].max
  end

  max_sum
end

nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
print max_sub_array(nums)
# Output: 6

nums = [1]
print max_sub_array(nums)
# Output: 1

nums = [5, 4, -1, 7, 8]
print max_sub_array(nums)
# Output: 23
