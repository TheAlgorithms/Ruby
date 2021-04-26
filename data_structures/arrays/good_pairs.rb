# Challenge name: Number of good pairs
#
# Given an array of integers nums.
# A pair (i,j) is called good if nums[i] == nums[j] and i < j.
# Return the number of good pairs.
#
# @param {Integer[]} nums
# @return {Integer}
#

def num_identical_pairs(nums)
end
nums = [1, 2, 3, 1, 1, 3]
puts(num_identical_pairs(nums))
# Output: 4
# Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
nums = [1, 1, 1, 1]
puts(num_identical_pairs(nums))
# Output: 6
# Explanation: Each pair in the array are good.
nums = [1, 2, 3]
puts(num_identical_pairs(nums))
# Output: 0