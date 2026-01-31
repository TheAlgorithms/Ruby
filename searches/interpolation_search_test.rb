require 'minitest/autorun'
require_relative './interpolation_search'

class TestInterpolationSearch < Minitest::Test
  def test_finds_existing_element
    array = [2, 4, 6, 8, 10, 12, 14]
    assert_equal 3, interpolation_search(array, 8)
  end

  def test_returns_negative_one_for_missing_element
    array = [10, 20, 30, 40, 50]
    assert_equal(-1, interpolation_search(array, 35))
  end

  def test_handles_empty_array
    assert_equal(-1, interpolation_search([], 7))
  end

  def test_handles_uniform_values
    array = [5, 5, 5, 5]
    assert_equal 0, interpolation_search(array, 5)
    assert_equal(-1, interpolation_search(array, 4))
  end

  def test_raises_when_array_not_sorted
    array = [3, 1, 2]
    assert_raises ArgumentError do
      interpolation_search(array, 1)
    end
  end
end
