require 'minitest/autorun'
require_relative './sort_tests'
require_relative './comb_sort'

class TestCombSort < Minitest::Test
  include SortTests

  def sort(input)
    comb_sort(input)
  end
end
