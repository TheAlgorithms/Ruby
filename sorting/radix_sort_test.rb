require 'minitest/autorun'
require_relative './sort_tests'
require_relative './radix_sort'

class TestRadixSort < Minitest::Test
  include SortTests

  def sort(input)
    radix_sort(input)
  end
end
