# Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.
# It is guaranteed that the answer will fit in a 32-bit integer.
# A subarray is a contiguous subsequence of the array.

# Example 1:
# Input: nums = [2,3,-2,4]
# Output: 6
# Explanation: [2,3] has the largest product 6.

# Example 2:
# Input: nums = [-2,0,-1]
# Output: 0
# Explanation: The result cannot be 2, because [-2,-1] is not a subarray.

# Constraints:
# 1 <= nums.length <= 2 * 104
#-10 <= nums[i] <= 10
# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

# Dynamic Programming Approach (Kadane's Algorithm) - O(n) Time / O(1) Space
# Track both current minimum and current maximum (Due to possibility of multiple negative numbers)
# Answer is the highest value of current maximum

# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  return nums[0] if nums.length == 1

  cur_min = 1
  cur_max = 1
  max = -11

  nums.each do |val|
    tmp_cur_max = cur_max
    cur_max = [val, val * cur_max, val * cur_min].max
    cur_min = [val, val * tmp_cur_max, val * cur_min].min

    max = [max, cur_max].max
  end

  max
end

nums = [2, 3, -2, 4]
puts max_product(nums)
# Output: 6

nums = [-2, 0, -1]
puts max_product(nums)
# Output: 0
