require 'minitest/autorun'
require_relative 'max_heap'

class TestMaxHeap < Minitest::Test
  def test_to_array_returns_array_representation
    heap = MaxHeap.new([4, 1, 3, 3, 16, 9, 10, 14, 8, 7])
    assert heap.to_array == [16, 14, 10, 8, 7, 9, 3, 3, 4, 1]
  end

  def test_empty_returns_true_for_empty_heap
    heap = MaxHeap.new
    assert heap.empty?
  end

  def test_empty_returns_false_for_non_empty_heap
    heap = MaxHeap.new([1])
    assert !heap.empty?
  end

  def test_max_returns_maximum_heap_element
    heap = MaxHeap.new([4, 1, 3])
    assert heap.max == 4
  end

  def test_max_returns_nil_if_empty_heap
    heap = MaxHeap.new
    assert heap.max.nil?
  end

  def test_extract_max_returns_and_removes_maximum_heap_element
    heap = MaxHeap.new([4, 1, 3])
    assert heap.extract_max == 4
    assert heap.to_array == [3, 1]
  end

  def test_extract_max_returns_nil_if_empty_heap
    heap = MaxHeap.new
    assert heap.extract_max.nil?
  end

  def test_insert_adds_element_to_appropriate_position
    heap = MaxHeap.new([4, 1, 3])
    heap.insert(2)
    assert heap.to_array == [4, 2, 3, 1]
  end
end
