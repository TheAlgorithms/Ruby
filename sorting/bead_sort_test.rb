require 'minitest/autorun'
require_relative './sort_tests'
require_relative './bead_sort'

class TestInsertionSort < Minitest::Test
  include SortTests

  def sort(input)
    bead_sort(input)
  end
end
