require 'minitest/autorun'
require_relative './sort_tests'
require_relative './insertion_sort'

class TestInsertionSort < Minitest::Test
  include SortTests

  def sort(input)
    insertion_sort(input)
  end
end
