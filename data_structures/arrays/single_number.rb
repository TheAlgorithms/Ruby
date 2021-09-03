# Challenge name: Single Number
#
# Given a non-empty array of integers nums, every element appears twice
# except for one. Find that single one.
#
# Follow up: Could you implement a solution with a linear runtime
# complexity and without using extra memory?
#
# @param {Integer[]} nums
# @return {Integer}

#
# Approach 1: Hash map
#
# Time Complexity: O(n)
#
def single_number(nums)
  result_hash = {}
  nums.each do |num|
    if result_hash[num]
      result_hash[num] += 1
    else
      result_hash[num] = 1
    end
  end

  result_hash.each do |k, v|
    return k if v == 1
  end
end

nums = [2, 2, 1]
puts(single_number(nums))
# Output: 1
nums = [4, 1, 2, 1, 2]
puts(single_number(nums))
# Output: 4
nums = [1]
puts(single_number(nums))
# Output: 1

#
# Approach 2: Use Ruby .count()
#
# Time Complexity: O(n^2)
#
def single_number(nums)
  nums.find do |num|
    nums.count(num) == 1
  end
end

nums = [2, 2, 1]
puts(single_number(nums))
# Output: 1
nums = [4, 1, 2, 1, 2]
puts(single_number(nums))
# Output: 4
nums = [1]
puts(single_number(nums))
# Output: 1
