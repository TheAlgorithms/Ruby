# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    return 0 if grid.empty?
    
    islands = 0
    
    grid.each_with_index do |row, x|
      row.each_with_index do |plot, y|
        if plot == "1"
          dfs(grid, x, y)
          islands += 1
        end
      end
    end
    
    islands
end

def dfs(grid, x, y)
    return if x < 0 || x >= grid.length || y < 0 || y >= grid[0].length || grid[x][y] == "0"
    
    grid[x][y] = "0"
    
    dfs(grid, x - 1, y) #up
    dfs(grid, x + 1, y) #down
    dfs(grid, x, y - 1) #left
    dfs(grid, x, y + 1) #right
end
