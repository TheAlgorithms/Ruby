require 'minitest/autorun'
require_relative './sort_tests'
require_relative './quicksort'

class TestQuicksort < Minitest::Test
  include SortTests

  def sort(input)
    quicksort(input)
  end
end
