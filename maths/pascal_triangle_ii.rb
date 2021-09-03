# Given an integer row_index, return the rowIndexth (0-indexed) row of the Pascal's triangle.

# Example 1:
#
# Input: row_index = 3
# Output: [1,3,3,1]
#
# Example 2:
#
# Input: row_index = 0
# Output: [1]
#
# Example 3:
#
# Input: row_index = 1
# Output: [1,1]

# Complexity Analysis
#
# Time complexity: O(k).
# Space complexity: O(k).

def get_row(row_index)
  (0..row_index).map { |num| combination(row_index, num) }
end

def combination(num1, num2)
  factorial(num1) / (factorial(num2) * factorial(num1 - num2))
end

def factorial(num)
  (1..num).inject(1) { |res, i| res * i }
end

row_index = 3
print(get_row(row_index))
# => [1,3,3,1]

row_index = 0
print(get_row(row_index))
# => [1]

row_index = 1
print(get_row(row_index))
# => [1,1]
