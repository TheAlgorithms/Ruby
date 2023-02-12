require 'minitest/autorun'
require_relative 'counting_sort'

class TestCountingSort < Minitest::Test
  def test_empty_array_given_empty_array
    assert counting_sort([], 1).empty?
  end
  
  def test_array_sorted_correctly
    assert counting_sort([1, 5, 3, 0, 4, 2, 4], 5) == [0, 1, 2, 3, 4, 4, 5]
  end
  
  def test_exception_given_non_integer_upper_bound
    assert_raises ArgumentError do
        counting_sort([1, 3, 2], 5.5)
    end
  end
  
  def test_exception_given_negative_upper_bound
    assert_raises ArgumentError do
        counting_sort([1, 3, 2], -1)
    end
  end
  
  def test_exception_given_non_integer_elements
    assert_raises ArgumentError do
        counting_sort([1, 3, 2.5], 5)
    end
  end
  
  def test_exception_given_negative_elements
    assert_raises ArgumentError do
        counting_sort([1, 3, -2], 5)
    end
  end
  
  def test_exception_given_elements_above_upper_bound
    assert_raises ArgumentError do
        counting_sort([1, 3, 6], 5)
    end
  end
end
