# Challenge name: Shuffle the array
#
# Given the array nums consisting of 2n elements
# in the form [x1,x2,...,xn,y1,y2,...,yn].
# Return the array in the form [x1,y1,x2,y2,...,xn,yn].
#
# Example 1:
# Input: nums = [2,5,1,3,4,7], n = 3
# Output: [2,3,5,4,1,7]
# Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].
#
# Example 2:
# Input: nums = [1,2,3,4,4,3,2,1], n = 4
# Output: [1,4,2,3,3,2,4,1]
#
# Example 3:
# Input: nums = [1,1,2,2], n = 2
# Output: [1,2,1,2]
#
# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}

#
# Approach 1: New Array
#
# Time Complexity: O(N)
#
def shuffle(nums, n)
  result = []
  (0..n - 1).count do |i|
    result.push(nums[i], nums[i + n])
  end
  result
end

nums = [2, 5, 1, 3, 4, 7]
n = 3
print(shuffle(nums, n))
# Output: [2,3,5,4,1,7]
nums = [1, 2, 3, 4, 4, 3, 2, 1]
n = 4
print(shuffle(nums, n))
# Output: [1,4,2,3,3,2,4,1]
nums = [1, 1, 2, 2]
n = 2
print(shuffle(nums, n))
# Output: [1,2,1,2]

#
# Approach 2: Use Ruby methods .insert() and .delete_at()
#
# Time Complexity: O(N)
#

def shuffle(nums, n)
  current_index = 1
  (0..n - 1).each do |i|
    nums.insert(current_index, nums.delete_at(i + n))
    current_index += 2
  end
  nums
end

nums = [2, 5, 1, 3, 4, 7]
n = 3
print(shuffle(nums, n))
# Output: [2,3,5,4,1,7]
nums = [1, 2, 3, 4, 4, 3, 2, 1]
n = 4
print(shuffle(nums, n))
# Output: [1,4,2,3,3,2,4,1]
nums = [1, 1, 2, 2]
n = 2
print(shuffle(nums, n))
# Output: [1,2,1,2]

#
# Approach 3: Two Pointers
#
# Time Complexity: O(N)
#

def shuffle(nums, n)
  result = []
  p1 = 0
  p2 = n

  while p1 < n
    result.push(nums[p1], nums[p2])
    p1 += 1
    p2 += 1
  end

  result
end

nums = [2, 5, 1, 3, 4, 7]
n = 3
print(shuffle(nums, n))
# Output: [2,3,5,4,1,7]
nums = [1, 2, 3, 4, 4, 3, 2, 1]
n = 4
print(shuffle(nums, n))
# Output: [1,4,2,3,3,2,4,1]
nums = [1, 1, 2, 2]
n = 2
print(shuffle(nums, n))
# Output: [1,2,1,2]
