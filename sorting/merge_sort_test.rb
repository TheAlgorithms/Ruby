require 'minitest/autorun'
require_relative './sort_tests'
require_relative './merge_sort'

class TestMergeSort < Minitest::Test
  include SortTests

  def sort(input)
    merge_sort(input)
  end
end
