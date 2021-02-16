require 'minitest/autorun'
require_relative './sort_tests'
require_relative './shell_sort'

class TestShellSort < Minitest::Test
  include SortTests

  def sort(input)
    shell_sort(input)
  end
end
