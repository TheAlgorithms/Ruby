# Challenge name: Two Sum
# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# You can return the answer in any order.
#
#
# Examples
#
# Input: nums = [2, 7, 11, 15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
#
# Input: nums = [3, 2, 4], target = 6
# Output: [1,2]
#
# Input: nums = [3, 3], target = 6
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
#
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

# 
# Approach 1: Brute Force
#
# Time Complexity: O(N^2), where N is the length of the array
#
def two_sum(nums, target)
  result_array = []

  nums.each_with_index do |num, i|
    nums.each_with_index do |num, j|
      if i != j && i < j
        current_sum = nums[i] + nums[j]
        if current_sum == target
          return [i, j]
        end
      end
    end
  end
end

print two_sum([2, 7, 11, 15], 9) 
# => [0,1]
print two_sum([3, 2, 4], 6)
# => [1,2]
print two_sum([3, 3], 6)
# => [0,1]

#
# Approach 2: Define and seek
#
# Time Complexity: O(N^2), where N is the length of the array
#
def two_sum(nums, target)
  nums.each_with_index do |num, i|
    target_difference = target - nums[i]
    nums.each_with_index do |num, j|
      if i != j && num == target_difference
        return [i, j]
      end
    end
  end
end

print two_sum([2, 7, 11, 15], 9) 
# => [0,1]
print two_sum([3, 2, 4], 6)
# => [1,2]
print two_sum([3, 3], 6)
# => [0,1]