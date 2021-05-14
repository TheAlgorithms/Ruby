require 'minitest/autorun'
require_relative './sort_tests'
require_relative './comb_sort'

class TestInsertionSort < Minitest::Test
  include SortTests

  def sort(input)
    comb_sort(input)
  end
end
