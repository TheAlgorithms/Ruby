# Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.
#
# We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.
#
# Example 1:
#
# Input: nums = [2,0,2,1,1,0]
# Output: [0,0,1,1,2,2]
#
# Example 2:
#
# Input: nums = [2,0,1]
# Output: [0,1,2]
#
# Example 3:
#
# Input: nums = [0]
# Output: [0]
#
# Example 4:
#
# Input: nums = [1]
# Output: [1]

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  bubble_sort(nums)
end

def bubble_sort(array)
  array_length = array.size
  return array if array_length <= 1

  loop do
    swapped = false

    (array_length - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end

    break unless swapped
  end

  array
end

nums = [2, 0, 2, 1, 1, 0]
puts sort_colors(nums)
# Output: [0,0,1,1,2,2]

nums = [2, 0, 1]
puts sort_colors(nums)
# Output: [0,1,2]

nums = [0]
puts sort_colors(nums)
# Output: [0]

nums = [1]
puts sort_colors(nums)
# Output: [1]
