class AvlTreeNode

  attr_reader :key
  attr_accessor :parent
  attr_accessor :left
  attr_accessor :right
  attr_accessor :height

  def initialize(key, parent=nil)
    @key = key
    @parent = parent
    @height = 1
  end
end

##
# This class represents an AVL tree (a self-balancing binary search tree) with distinct node keys.
# Starting from the root, every node has up to two children (one left and one right child node).
#
# For the BST property:
# - the keys of nodes in the left subtree of a node are strictly less than the key of the node;
# - the keys of nodes in the right subtree of a node are strictly greater than the key of the node.
#
# Due to self-balancing upon key insertion and deletion, the main operations of this data structure
# (insertion, deletion, membership) run - in worst case - in O(log(n)), where n is the number of nodes in the tree.

class AvlTree

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
      @root = AvlTreeNode.new(key)
      return
    end
    parent = root
    while (key < parent.key && !parent.left.nil? && parent.left.key != key) ||
        (key > parent.key && !parent.right.nil? && parent.right.key != key)
      parent = key < parent.key ? parent.left : parent.right
    end
    if key < parent.key
      raise ArgumentError.new("Key #{key} is already present in the AvlTree") unless parent.left.nil?
      parent.left = AvlTreeNode.new(key, parent)
    else
      raise ArgumentError.new("Key #{key} is already present in the AvlTree") unless parent.right.nil?
      parent.right = AvlTreeNode.new(key, parent)
    end
    balance(parent)
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
      root.parent = nil
      balance(root.right.nil? ? root : root.right)
      return
    end
    if key < parent.key
      node = parent.left
      parent.left = adjusted_subtree_after_deletion(node.left, node.right)
      unless parent.left.nil?
        parent.left.parent = parent
        balance(parent.left.right.nil? ? parent.left : parent.left.right)
      end
    else
      node = parent.right
      parent.right = adjusted_subtree_after_deletion(node.left, node.right)
      unless parent.right.nil?
        parent.right.parent = parent
        balance(parent.right.right.nil? ? parent.right : parent.right.right)
      end
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
      left.parent = right
      return right
    end
    successor_parent = right
    until successor_parent.left.left.nil?
      successor_parent = successor_parent.left
    end
    successor = successor_parent.left
    successor_parent.left = successor.right
    successor.right.parent = successor_parent unless successor.right.nil?
    successor.right = right
    right.parent = successor
    successor.left = left
    left.parent = successor
    successor
  end

  def balance(node)
    return if node.nil?
    left_height = node.left&.height || 0
    right_height = node.right&.height || 0
    # Assumption: the subtrees rooted at `node.left` and `node.right` are balanced
    adjust_height(node)
    if right_height - left_height > 1
      # `node` is right-heavy
      if !node.right.left.nil? && (node.right.left.height || 0) > (node.right.right&.height || 0)
        rotate_right_left(node)
      else
        rotate_left(node)
      end
    elsif left_height - right_height > 1
      # `node` is left-heavy
      if !node.left.right.nil? && (node.left.right.height || 0) > (node.left.left&.height || 0)
        rotate_left_right(node)
      else
        rotate_right(node)
      end
    end

    balance(node.parent)
  end

  def rotate_left(node)
    new_root = node.right
    if node == root
      @root = new_root
    elsif node.parent.left == node
      node.parent.left = new_root
    else
      node.parent.right = new_root
    end
    new_root.parent = node.parent
    if new_root.left.nil?
      node.right = nil
      new_root.left = node
      node.parent = new_root
    else
      node.right = new_root.left
      new_root.left.parent = node
      new_root.left = node
      node.parent = new_root
    end
    adjust_height(node)
    adjust_height(new_root)
  end

  def rotate_right(node)
    new_root = node.left
    if node == root
      @root = new_root
    elsif node.parent.left == node
      node.parent.left = new_root
    else
      node.parent.right = new_root
    end
    new_root.parent = node.parent
    if new_root.right.nil?
      node.left = nil
      new_root.right = node
      node.parent = new_root
    else
      node.left = new_root.right
      new_root.right.parent = node
      new_root.right = node
      node.parent = new_root
    end
    adjust_height(node)
    adjust_height(new_root)
  end

  def rotate_right_left(node)
    rotate_right(node.right)
    rotate_left(node)
  end

  def rotate_left_right(node)
    rotate_left(node.left)
    rotate_right(node)
  end

  def adjust_height(node)
    node.height = 1 + [node.left&.height || 0, node.right&.height || 0].max
  end
end
