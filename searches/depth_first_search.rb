# @param [Integer] start
# @param [Integer] target
# @param [Array] adjacency_list
# @return [Array] routes
def dfs(start, target, adjacency_list)
  is_visited = Hash.new(false)
  parent = {}
  stack = [start]
  loop do
    break if stack.empty?

    current_node = stack.pop
    is_visited[current_node] = true

    return get_path(parent, target) if current_node == target

    adjacency_list[current_node].each do |neighbor|
      next if is_visited[neighbor]

      stack << neighbor
      is_visited[neighbor] = true
      parent[neighbor] = current_node
    end
  end
  []
end

# @param [Hash] parent
# @param [Integer] dest
# @return [Array] path
def get_path(parent, dest)
  iterator = dest
  path = [dest]
  while parent.has_key?(iterator)
    path << parent[iterator]
    iterator = parent[iterator]
  end
  path.reverse
end

def main
  adjacency_list = [
    [1, 2], # 0
    [0, 3], # 1
    [0, 3], # 2
    [1, 2, 4], # 3
    [3, 5], # 4
    [4] # 5
  ]
  p dfs(0, 5, adjacency_list)
end

main
