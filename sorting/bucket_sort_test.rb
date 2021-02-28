require 'minitest/autorun'
require_relative './sort_tests'
require_relative './bucket_sort'

class TestBucketSort < Minitest::Test
  include SortTests

  def sort(input)
    bucket_sort(input)
  end
end
