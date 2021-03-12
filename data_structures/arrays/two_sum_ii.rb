# Given an array of integers numbers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

# Return the indices of the two numbers (1-indexed) as an integer array answer of size 2, where 1 <= answer[0] < answer[1] <= numbers.length.

# You may assume that each input would have exactly one solution and you may not use the same element twice.

#
# Approach 1: Two pointers
#

# Complexity analysis

# Time complexity: O(n). Each of the n elements is visited at
# most once, thus the time complexity is O(n).

# Space complexity: O(1). We only use two indexes, the space
# complexity is O(1).

def two_sum(numbers, target)
  i = 0
  j = numbers.length - 1

  while i < j
    sum = numbers[i] + numbers[j]

    if target < sum
      j -= 1
    elsif target > sum
      i += 1
    else
      return [i + 1, j + 1]
    end
  end
end

nums = [2, 7, 11, 15]
target = 9
print(two_sum(nums, target))
# => [1,2]

nums = [2, 3, 4]
target = 6
print(two_sum(nums, target))
# => [1,3]

nums = [-1, 0]
target = -1
print(two_sum(nums, target))
# => [1,2]
