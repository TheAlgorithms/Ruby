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
def preorder_traversal(root)
  ans = []
  def traverse(node, ans)
    unless node.nil?
      ans.push(node.val)
      traverse(node.left, ans)
      traverse(node.right, ans)
    end
  end
  traverse(root, ans)
  ans
end
