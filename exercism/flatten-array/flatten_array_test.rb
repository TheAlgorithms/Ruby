#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'flatten_array'

class FlattenArrayTest < Minitest::Test
  def test_two_level_nesting
    fa = FlattenArray.flatten([1, [2, 3, 4, 5, 6, 7], 8])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], fa
  end

  def test_five_level_nesting
    #skip
    fa = FlattenArray.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
    assert_equal [0, 2, 2, 3, 8, 100, 4, 50, -2], fa
  end

  def test_six_level_nesting
    #skip
    fa = FlattenArray.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], fa
  end

  def test_six_level_nesting_with_nil_values
    #skip
    fa = FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2])
    assert_equal [0, 2, 2, 3, 8, 100, -2], fa
  end

  def test_all_values_are_nil
    #skip
    fa = FlattenArray.flatten([nil, [[[nil]]], nil, [[nil, nil], nil], nil])
    assert_equal [], fa
  end

  def test_bookkeeping
    #skip
    assert_equal 1, FlattenArray::VERSION
  end
end
