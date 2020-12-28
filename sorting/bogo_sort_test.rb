require 'minitest/autorun'
require_relative './bogo_sort'

class TestBogoSort < Minitest::Test
  def test_sorted_array
    input = [1, 2, 3, 4, 5]
    expected = input.dup
    assert_equal expected, input.bogosort
  end

  def test_reversed_array
    input = [5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5]
    assert_equal expected, input.bogosort
  end
end
