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