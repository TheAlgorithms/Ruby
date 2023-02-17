require 'minitest/autorun'
require_relative 'avl_tree'

class TestAvlTree < Minitest::Test
  def test_default_constructor_creates_empty_tree
    tree = AvlTree.new
    assert tree.to_array.empty?
  end

  def test_default_constructor_creates_tree_with_given_keys
    tree = AvlTree.new([1, 2, 3, 4, 5, 6, 7])
    assert tree.to_array == [4, 2, 1, 3, 6, 5, 7]
  end

  def test_exception_when_inserting_key_already_present
    tree = AvlTree.new([4, 2, 6, 3, 1])
    assert_raises ArgumentError do
        tree.insert_key(6)
    end
  end

  def test_size_returns_zero_given_empty_tree
    tree = AvlTree.new
    assert tree.size == 0
  end

  def test_empty_returns_number_of_nodes_in_tree
    tree = AvlTree.new([4, 2, 6, 3, 1])
    assert tree.size == 5
  end

  def test_empty_returns_true_given_empty_tree
    tree = AvlTree.new
    assert tree.empty?
  end

  def test_empty_returns_false_given_non_empty_tree
    tree = AvlTree.new([1])
    assert !tree.empty?
  end

  def test_min_key_returns_minimum_key
    tree = AvlTree.new([4, 2, 6, 3, 1])
    assert tree.min_key == 1
  end

  def test_max_key_returns_maximum_key
    tree = AvlTree.new([4, 2, 6, 3, 1])
    assert tree.max_key == 6
  end

  def test_contains_key_returns_true_if_key_in_tree
    tree = AvlTree.new([4, 2, 6, 3, 1])
    assert tree.contains_key?(3)
  end

  def test_contains_key_returns_false_if_key_not_in_tree
    tree = AvlTree.new([4, 2, 6, 3, 1])
    assert !tree.contains_key?(7)
  end

  def test_delete_key_does_nothing_if_key_not_in_tree
    tree = AvlTree.new([4, 2, 6, 3, 1])
    tree.delete_key(7)
    assert tree.to_array == [4, 2, 1, 3, 6]
  end

  def test_delete_key_keeps_avl_property_if_leaf_node
    tree = AvlTree.new([1, 2, 3, 4, 5, 6, 7])
    tree.delete_key(3)
    assert tree.to_array == [4, 2, 1, 6, 5, 7]
  end

  def test_delete_key_keeps_avl_property_if_node_with_left_child
    tree = AvlTree.new([4, 2, 5, 1])
    tree.delete_key(2)
    assert tree.to_array == [4, 1, 5]
  end

  def test_delete_key_keeps_avl_property_if_node_with_right_child
    tree = AvlTree.new([4, 2, 5, 6])
    tree.delete_key(5)
    assert tree.to_array == [4, 2, 6]
  end

  def test_delete_key_keeps_avl_property_if_node_with_both_children
    tree = AvlTree.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    tree.delete_key(4)
    assert tree.to_array == [5, 2, 1, 3, 8, 6, 7, 9]
  end

  def test_preorder_traversal_uses_expected_order
    tree = AvlTree.new([1, 2, 3, 4, 5, 6, 7])
    visited = []
    tree.traverse_preorder(->(key) { visited.append(key) })
    assert visited == [4, 2, 1, 3, 6, 5, 7]
  end

  def test_inorder_traversal_uses_expected_order
    tree = AvlTree.new([1, 2, 3, 4, 5, 6, 7])
    visited = []
    tree.traverse_inorder(->(key) { visited.append(key) })
    assert visited == [1, 2, 3, 4, 5, 6, 7]
  end

  def test_postorder_traversal_uses_expected_order
    tree = AvlTree.new([1, 2, 3, 4, 5, 6, 7])
    visited = []
    tree.traverse_postorder(->(key) { visited.append(key) })
    assert visited == [1, 3, 2, 5, 7, 6, 4]
  end

  def test_left_rotation
    tree = AvlTree.new([1, 2, 3])
    assert tree.to_array == [2, 1, 3]
  end

  def test_right_rotation
    tree = AvlTree.new([3, 2, 1])
    assert tree.to_array == [2, 1, 3]
  end

  def test_right_left_rotation
    tree = AvlTree.new([1, 3, 2])
    assert tree.to_array == [2, 1, 3]
  end

  def test_left_right_rotation
    tree = AvlTree.new([3, 1, 2])
    assert tree.to_array == [2, 1, 3]
  end
end
