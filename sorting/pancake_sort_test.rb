require 'minitest/autorun'
require_relative './sort_tests'
require_relative './pancake_sort'

class TestInsertionSort < Minitest::Test
  include SortTests

  def sort(input)
    pancake_sort(input)
  end
end
