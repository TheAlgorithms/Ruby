# Arrays - Sorted Squares

# Algorithm challenge description:
# Given an integer array nums sorted in non-decreasing order
# return an array of the squares of each number sorted in non-decreasing order.
# Input: [4, -1, -9, 2]
# Output: [1, 4, 16, 81]

# Loop and multiply

array = [4, -1, -9, 2]

def square_and_sort(array)
  result_array = []

  array.each do |num|
    result_array.push(num*num)
  end

  result_array.sort
end

print square_and_sort(array)