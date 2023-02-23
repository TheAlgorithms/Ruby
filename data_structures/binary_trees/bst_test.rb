require 'minitest/autorun'
require_relative 'bst'

class TestBinarySearchTree < Minitest::Test
  def test_default_constructor_creates_empty_tree
    bst = BinarySearchTree.new
    assert bst.to_array.empty?
  end

  def test_default_constructor_creates_tree_with_given_keys
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    assert bst.to_array == [4, 2, 1, 3, 6]
  end

  def test_exception_when_inserting_key_already_present
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    assert_raises ArgumentError do
        bst.insert_key(6)
    end
  end

  def test_size_returns_zero_given_empty_tree
    bst = BinarySearchTree.new
    assert bst.size == 0
  end

  def test_empty_returns_number_of_nodes_in_tree
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    assert bst.size == 5
  end

  def test_empty_returns_true_given_empty_tree
    bst = BinarySearchTree.new
    assert bst.empty?
  end

  def test_empty_returns_false_given_non_empty_tree
    bst = BinarySearchTree.new([1])
    assert !bst.empty?
  end

  def test_min_key_returns_minimum_key
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    assert bst.min_key == 1
  end

  def test_max_key_returns_maximum_key
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    assert bst.max_key == 6
  end

  def test_contains_key_returns_true_if_key_in_tree
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    assert bst.contains_key?(3)
  end

  def test_contains_key_returns_false_if_key_not_in_tree
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    assert !bst.contains_key?(7)
  end

  def test_delete_key_does_nothing_if_key_not_in_tree
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    bst.delete_key(7)
    assert bst.to_array == [4, 2, 1, 3, 6]
  end

  def test_delete_key_keeps_bst_property_if_leaf_node
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    bst.delete_key(1)
    assert bst.to_array == [4, 2, 3, 6]
  end

  def test_delete_key_keeps_bst_property_if_node_with_left_child
    bst = BinarySearchTree.new([4, 2, 3, 1])
    bst.delete_key(4)
    assert bst.to_array == [2, 1, 3]
  end

  def test_delete_key_keeps_bst_property_if_node_with_right_child
    bst = BinarySearchTree.new([4, 2, 6, 3])
    bst.delete_key(2)
    assert bst.to_array == [4, 3, 6]
  end

  def test_delete_key_keeps_bst_property_if_node_with_both_children
    bst = BinarySearchTree.new([4, 2, 7, 3, 1, 5, 10, 6])
    bst.delete_key(4)
    assert bst.to_array == [5, 2, 1, 3, 7, 6, 10]
  end

  def test_preorder_traversal_uses_expected_order
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    visited = []
    bst.traverse_preorder(->(key) { visited.append(key) })
    assert visited == [4, 2, 1, 3, 6]
  end

  def test_inorder_traversal_uses_expected_order
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    visited = []
    bst.traverse_inorder(->(key) { visited.append(key) })
    assert visited == [1, 2, 3, 4, 6]
  end

  def test_postorder_traversal_uses_expected_order
    bst = BinarySearchTree.new([4, 2, 6, 3, 1])
    visited = []
    bst.traverse_postorder(->(key) { visited.append(key) })
    assert visited == [1, 3, 2, 6, 4]
  end
end
