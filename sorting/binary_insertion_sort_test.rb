require 'minitest/autorun'
require_relative './sort_tests'
require_relative './binary_insertion_sort'

class TestBinaryInsertionSort < Minitest::Test
  include SortTests

  def sort(input)
    binary_insertion_sort(input)
  end
end