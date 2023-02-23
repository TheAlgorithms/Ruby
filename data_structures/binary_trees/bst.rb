class BinarySearchTreeNode

  attr_reader :key
  attr_accessor :left
  attr_accessor :right

  def initialize(key)
    @key = key
  end
end

##
# This class represents a binary search tree (not implementing self-balancing) with distinct node keys.
# Starting from the root, every node has up to two children (one left and one right child node).
#
# For the BST property:
# - the keys of nodes in the left subtree of a node are strictly less than the key of the node;
# - the keys of nodes in the right subtree of a node are strictly greater than the key of the node.
#
# The main operations of this data structure (insertion, deletion, membership) run - in worst case - in O(n),
# where n is the number of nodes in the tree.
# The average case for those operations is O(log(n)) due to the structure of the tree.

class BinarySearchTree

  attr_reader :size
  attr_accessor :root

  def initialize(keys=[])
    @size = 0
    keys.each {|key| insert_key(key) }
  end

  def empty?
    size == 0
  end

  def insert_key(key)
    @size += 1
    if root.nil?
      @root = BinarySearchTreeNode.new(key)
      return
    end
    parent = root
    while (key < parent.key && !parent.left.nil? && parent.left.key != key) ||
        (key > parent.key && !parent.right.nil? && parent.right.key != key)
      parent = key < parent.key ? parent.left : parent.right
    end
    if key < parent.key
      raise ArgumentError.new("Key #{key} is already present in the BinarySearchTree") unless parent.left.nil?
      parent.left = BinarySearchTreeNode.new(key)
    else
      raise ArgumentError.new("Key #{key} is already present in the BinarySearchTree") unless parent.right.nil?
      parent.right = BinarySearchTreeNode.new(key)
    end
  end

  def min_key(node=root)
    return nil if node.nil?
    min_key_node(node).key
  end

  def max_key(node=root)
    return nil if node.nil?
    max_key_node(node).key
  end

  def contains_key?(key)
    !find_node_with_key(key).nil?
  end

  def delete_key(key)
    parent = find_parent_of_node_with_key(key)
    if parent.nil?
      return if root.nil? || root.key != key
      @size -= 1
      @root = adjusted_subtree_after_deletion(root.left, root.right)
      return
    end
    if key < parent.key
      node = parent.left
      parent.left = adjusted_subtree_after_deletion(node.left, node.right)
    else
      node = parent.right
      parent.right = adjusted_subtree_after_deletion(node.left, node.right)
    end
    @size -= 1
  end

  def traverse_preorder(key_consumer, node=root)
    return if node.nil?
    key_consumer.call(node.key)
    traverse_preorder(key_consumer, node.left) unless node.left.nil?
    traverse_preorder(key_consumer, node.right) unless node.right.nil?
  end

  def traverse_inorder(key_consumer, node=root)
    return if node.nil?
    traverse_inorder(key_consumer, node.left) unless node.left.nil?
    key_consumer.call(node.key)
    traverse_inorder(key_consumer, node.right) unless node.right.nil?
  end

  def traverse_postorder(key_consumer, node=root)
    return if node.nil?
    traverse_postorder(key_consumer, node.left) unless node.left.nil?
    traverse_postorder(key_consumer, node.right) unless node.right.nil?
    key_consumer.call(node.key)
  end

  def to_array(visit_traversal=:traverse_preorder)
    visited = []
    method(visit_traversal).call(->(key) { visited.append(key) })
    visited
  end

  private
  def min_key_node(node=root)
    return nil if node.nil?
    until node.left.nil?
      node = node.left
    end
    node
  end

  def max_key_node(node=root)
    return nil if node.nil?
    until node.right.nil?
      node = node.right
    end
    node
  end

  def find_node_with_key(key)
    node = root
    until node.nil? || node.key == key
      node = key < node.key ? node.left : node.right
    end
    node
  end

  def find_parent_of_node_with_key(key)
    return nil if root.nil? || root.key == key
    parent = root
    until parent.nil?
      if key < parent.key
        return nil if parent.left.nil?
        return parent if parent.left.key == key
        parent = parent.left
      else
        return nil if parent.right.nil?
        return parent if parent.right.key == key
        parent = parent.right
      end
    end
    nil
  end

  def adjusted_subtree_after_deletion(left, right)
    return right if left.nil?
    return left if right.nil?
    if right.left.nil?
      right.left = left
      return right
    end
    successor_parent = right
    until successor_parent.left.left.nil?
      successor_parent = successor_parent.left
    end
    successor = successor_parent.left
    successor_parent.left = successor.right
    successor.right = right
    successor.left = left
    successor
  end
end
