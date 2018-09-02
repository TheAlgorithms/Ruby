#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'difference_of_squares'

# Test data version:
# deb225e Implement canonical dataset for scrabble-score problem (#255)

class DifferenceOfSquaresTest < Minitest::Test
  def test_square_of_sum_5
    assert_equal 225, Squares.new(5).square_of_sum
  end

  def test_square_of_sum_10
    #skip
    assert_equal 3_025, Squares.new(10).square_of_sum
  end

  def test_square_of_sum_100
    #skip
    assert_equal 25_502_500, Squares.new(100).square_of_sum
  end

  def test_sum_of_squares_5
    #skip
    assert_equal 55, Squares.new(5).sum_of_squares
  end

  def test_sum_of_squares_10
    #skip
    assert_equal 385, Squares.new(10).sum_of_squares
  end

  def test_sum_of_squares_100
    #skip
    assert_equal 338_350, Squares.new(100).sum_of_squares
  end

  def test_difference_of_squares_0
    #skip
    assert_equal 0, Squares.new(0).difference
  end

  def test_difference_of_squares_5
    #skip
    assert_equal 170, Squares.new(5).difference
  end

  def test_difference_of_squares_10
    #skip
    assert_equal 2_640, Squares.new(10).difference
  end

  def test_difference_of_squares_100
    #skip
    assert_equal 25_164_150, Squares.new(100).difference
  end

  def test_consistent_difference
    #skip
    squares = Squares.new(10)
    assert_equal squares.difference, squares.difference
  end
  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module.
  #  In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    #skip
    assert_equal 3, BookKeeping::VERSION
  end
end
