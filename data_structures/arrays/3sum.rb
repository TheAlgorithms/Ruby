# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] ..
# .. such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
# Notice that the solution set must not contain duplicate triplets.

# Example 1:
# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]

# Example 2:
# Input: nums = []
# Output: []

# Example 3:
# Input: nums = [0]
# Output: []

# Constraints:
# 0 <= nums.length <= 3000
#-105 <= nums[i] <= 105

# Two Pointer Approach - O(n) Time / O(1) Space
# Return edge cases.
# Sort nums, and init ans array
# For each |val, index| in nums:
# if the current value is the same as last, then go to next iteration
# init left and right pointers for two pointer search of the two sum in remaining elements of array
# while left < right:
# find current sum
# if sum > 0, right -= 1
# if sum < 0, left += 1
# if it's 0, then add the values to the answer array, and set the left pointer to the next valid value ..
# .. (left += 1 while nums[left] == nums[left - 1] && left < right)
# Return ans[]

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  # return if length too short
  return [] if nums.length < 3

  # sort nums, init ans array
  nums = nums.sort
  ans = []

  # loop through nums
  nums.each_with_index do |val, ind|
    # if the previous value is the same as current, then skip this iteration as it would create duplicates
    next if ind > 0 && nums[ind] == nums[ind - 1]

    # init & run two pointer search
    left = ind + 1
    right = nums.length - 1

    while left < right
      # find current sum
      sum = val + nums[left] + nums[right]

      # decrease sum if it's too great, increase sum if it's too low
      if sum > 0
        right -= 1
      elsif sum < 0
        left += 1
      # if it's zero, then add the answer to array and set left pointer to next valid value
      else
        ans << [val, nums[left], nums[right]]

        left += 1

        left += 1 while nums[left] == nums[left - 1] && left < right
      end
    end
  end

  # return answer
  ans
end

nums = [-1, 0, 1, 2, -1, -4]
print three_sum(nums)
# Output: [[-1,-1,2],[-1,0,1]]

nums = []
print three_sum(nums)
# Output: []

nums = [0]
print three_sum(nums)
# Output: []
