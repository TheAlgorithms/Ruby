# Challenge name: Two Sum
#
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
# Approach 1: Brute Force with Addition
#

# Complexity analysis

# Time Complexity: O(n^2). For each element, we try to find its complement
# by looping through the rest of the array which takes O(n) time.
# Therefore, the time complexity is O(n^2)

# Space complexity: O(1)

def two_sum(nums, target)
  result_array = []

  nums.count.times do |i|
    nums.count.times do |j|
      next unless i != j && i < j

      current_sum = nums[i] + nums[j]

      return [i, j] if current_sum == target
    end
  end
end

print(two_sum([2, 7, 11, 15], 9))
# => [0,1]

print(two_sum([3, 2, 4], 6))
# => [1,2]

print(two_sum([3, 3], 6))
# => [0,1]

#
# Approach 2: Brute Force with Difference
#
# Complexity analysis
#
# Time Complexity: O(N^2), where N is the length of the array
#
def two_sum(nums, target)
  nums.each_with_index do |num, i|
    target_difference = target - num

    nums.each_with_index do |num, j|
      if i != j && num == target_difference
        return [i, j]
      end
    end
  end
end

print(two_sum([2, 7, 11, 15], 9))
# => [0,1]

print(two_sum([3, 2, 4], 6))
# => [1,2]

print(two_sum([3, 3], 6))
# => [0,1]

#
# Approach 3: Using a Hash
#

# Complexity analysis

# Time complexity: O(n). We traverse the list containing n elements exactly twice.
# Since the hash table reduces the lookup time to O(1), the time complexity is O(n).

# Space complexity: O(n). The extra space required depends on the number of items
# stored in the hash table, which stores exactly n elements.

def two_sum(nums, target)
  hash = {}

  # create a hash to store values and their indices
  nums.each_with_index do |num, i|
    hash[num] = i
  end

  # iterate over nums array to find the target (difference between sum target and num)
  nums.each_with_index do |num, i|
    difference_target = target - num

    if hash[difference_target] && hash[difference_target] != i
      return [i, hash[difference_target]]
    end
  end
end

nums = [2, 7, 11, 15]
target = 9
print(two_sum(nums, target))
# => [0,1]

nums = [3, 2, 4]
target = 6
print(two_sum(nums, target))
# => [1,2]

nums = [3, 3]
target = 6
print(two_sum(nums, target))
# => [0,1]
