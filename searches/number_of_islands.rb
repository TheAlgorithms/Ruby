# Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
# An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

# Example 1:
# Input: grid = [
#  ["1","1","1","1","0"],
#  ["1","1","0","1","0"],
#  ["1","1","0","0","0"],
#  ["0","0","0","0","0"]
# ]
# Output: 1

# Example 2:
# Input: grid = [
#  ["1","1","0","0","0"],
#  ["1","1","0","0","0"],
#  ["0","0","1","0","0"],
#  ["0","0","0","1","1"]
# ]
# Output: 3

# Constraints:
# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 300
# grid[i][j] is '0' or '1'.

# DFS, Recursive Bottom Up Approach - O(n*m) Time / O(1) Space
# Init num_of_islands = 0, return if the grid is empty
# Start a double loop with index to iterate through each plot (each value is a plot of either water or land in this case)
# if the plot is land, dfs(grid, x, y)
# num_of_islands += 1
# Return num_of_islands

# dfs(grid, x, y)
# Return if x or y are out of bounds, or if the plot is water
# Make the current plot water
# Call dfs again for up, down, left, and right

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  return 0 if grid.empty?

  # init num of islands
  islands = 0

  # loop through each element (plot) in the 2d array
  grid.each_with_index do |row, x|
    row.each_with_index do |plot, y|
      # if the plot is water, start a dfs
      next unless plot == '1'

      dfs(grid, x, y)
      # add 1 to islands once all connected land plots are searched
      islands += 1
    end
  end

  # return ans
  islands
end

def dfs(grid, x, y)
  # don't search if out of bounds, or if it's already water
  return if x < 0 || x >= grid.length || y < 0 || y >= grid[0].length || grid[x][y] == '0'

  # set the plot to water
  grid[x][y] = '0'

  # search each adjacent plot
  dfs(grid, x - 1, y) # up
  dfs(grid, x + 1, y) # down
  dfs(grid, x, y - 1) # left
  dfs(grid, x, y + 1) # right
end
