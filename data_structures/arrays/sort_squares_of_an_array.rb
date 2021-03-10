# Arrays - Sorted Squares

# Algorithm challenge description:
# Given an integer array nums sorted in non-decreasing order
# return an array of the squares of each number sorted in non-decreasing order.
# Input: [4, -1, -9, 2]
# Output: [1, 4, 16, 81]

#
# Approach 1: is using Ruby function (for sure)!
#

def sorted_squares(nums)
  nums.map! { |num| num**2 }.sort
end
print(sorted_squares([4, -1, -9, 2]))

#
# Approach 2: is using bubble sort
#

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

#
# Time complexity analysis for Approach 1 & 2
#

def sorted_squares(nums)
  # This takes O(n)
  nums.map! { |num| num**2 }
  # This can take Ο(n logn)
  bubble_sort(nums)
end
print(sorted_squares([4, -1, -9, 2]))