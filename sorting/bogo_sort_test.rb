require 'minitest/autorun'
require_relative './sort_tests'
require_relative './bogo_sort'

class TestBogoSort < Minitest::Test
  include SortTests

  def sort(input)
    input.bogosort
  end
end
