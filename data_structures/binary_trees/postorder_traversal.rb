# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  ans = []
  def traverse(node, ans)
    unless node.nil?
      traverse(node.left, ans)
      traverse(node.right, ans)
      ans.push(node.val)
    end
  end
  traverse(root, ans)
  ans
end
