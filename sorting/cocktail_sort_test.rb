require 'minitest/autorun'
require_relative './sort_tests'
require_relative './cocktail_sort'

class TestCocktailSort < Minitest::Test
  include SortTests

  def sort(input)
    cocktail_sort(input)
  end
end
