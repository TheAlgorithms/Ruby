# Arrays - Remove Elements
#
# Given an array nums and a value val, remove all instances of that value in-place and return the new length.
# Do not allocate extra space for another array,
# you must do this by modifying the input array in-place with O(1) extra memory.
# The order of elements can be changed. It doesn't matter what you leave beyond the new length.
#
# Example
#
# Input: nums = [3,2,2,3], val = 3
# Output: 2, nums = [2,2]
#
# Input: nums = [0,1,2,2,3,0,4,2], val = 2
# Output: 5, nums = [0,1,4,0,3]

#
# Approach 1: Use `delete_if` Ruby method
#
# Time complexity: O(n)
#
def remove_elements(nums, val)
  nums.delete_if { |num| num == val }
  nums.length
end

puts remove_elements([3, 2, 2, 3], 3)
# => 2
puts remove_elements([0, 1, 2, 2, 3, 0, 4, 2], 2)
# => 5

#
# Approach 2: Use `delete_at`, `unshift`, and `shift` Ruby method
#
# Time complexity: O(n)
#
def remove_elements(nums, val)
  result_length = nums.length
  shift_length = 0
  nums.each_with_index do |num, i|
    next unless num == val

    nums.delete_at(i)
    nums.unshift('removed')
    result_length -= 1
    shift_length += 1
  end
  nums.shift(shift_length)
  result_length
end

puts remove_elements([3, 2, 2, 3], 3)
# => 2
puts remove_elements([0, 1, 2, 2, 3, 0, 4, 2], 2)
# => 5

#
# Approach 3: Two-pointers
#

# Complexity analysis
#
# Time complexity: O(n).
# Assume the array has a total of n elements,
# both pointer1 and pointer2 traverse at most 2n steps.
#
# Space complexity: O(1).

def remove_element(nums, val)
  pointer1 = 0

  nums.each_with_index do |num, pointer2|
    if val != num
      nums[pointer1] = nums[pointer2]
      pointer1 += 1
    end
  end

  pointer1
end

puts remove_elements([3, 2, 2, 3], 3)
# => 2
puts remove_elements([0, 1, 2, 2, 3, 0, 4, 2], 2)
# => 5

#
# Approach 4: Two-pointers (Optimized)
#

# Complexity analysis
#
# Time complexity: O(n). Both pointer1 and pointer2 traverse at most n steps.
# In this approach, the number of assignment operations is equal to the
# number of elements to remove.
#
# Space complexity: O(1)

def remove_element(nums, val)
  pointer1 = 0
  pointer2 = nums.length

  while pointer1 < pointer2
    if nums[pointer1] == val
      pointer2 -= 1
      nums[pointer1] = nums[pointer2]
    else
      pointer1 += 1
    end
  end

  pointer1
end

puts remove_elements([3, 2, 2, 3], 3)
# => 2
puts remove_elements([0, 1, 2, 2, 3, 0, 4, 2], 2)
# => 5
