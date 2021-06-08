# Challenge name: Pascal's triangle ii
#
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

#
# Approach 1: Dynamic Programming
#

# Complexity Analysis
#
# Time complexity: O(k^2).
# Space complexity: O(k) + O(k) ~ O(k).

# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  result = generate(row_index)
  result[result.count - 1]
end

def generate(num_rows)
  return [[1]] if num_rows < 1
  result = [[1], [1, 1]]

  (2...num_rows + 1).each do |row|
    prev = result[row - 1]
    current = [1]
    med = prev.count / 2

    (1...prev.count).each do |i|
      current[i] = prev[i - 1] + prev[i]
    end

    current.push(1)
    result.push(current)
  end

  result
end
