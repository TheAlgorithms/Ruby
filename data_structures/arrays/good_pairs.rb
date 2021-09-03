# Challenge name: Number of good pairs
#
# Given an array of integers nums.
# A pair (i,j) is called good if nums[i] == nums[j] and i < j.
# Return the number of good pairs.
#
# @param {Integer[]} nums
# @return {Integer}
#

#
# Approach 1: Brute Force
#
# Time Complexity: O(n^2)
#
def num_identical_pairs(nums)
  count = 0
  nums.each_with_index do |num, i|
    target = num
    nums.each_with_index do |num, j|
      next if i >= j

      count += 1 if num == target
    end
  end
  count
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
