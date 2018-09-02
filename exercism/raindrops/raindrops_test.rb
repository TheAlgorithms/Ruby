#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'raindrops'

# Test data version:
# deb225e Implement canonical dataset for scrabble-score problem (#255)

class RaindropsTest < Minitest::Test
  def test_1
    assert_equal '1', Raindrops.convert(1)
  end

  def test_3
    #skip
    assert_equal 'Pling', Raindrops.convert(3)
  end

  def test_5
    #skip
    assert_equal 'Plang', Raindrops.convert(5)
  end

  def test_7
    #skip
    assert_equal 'Plong', Raindrops.convert(7)
  end

  def test_6
    #skip
    assert_equal 'Pling', Raindrops.convert(6)
  end

  def test_9
    #skip
    assert_equal 'Pling', Raindrops.convert(9)
  end

  def test_10
    #skip
    assert_equal 'Plang', Raindrops.convert(10)
  end

  def test_14
    #skip
    assert_equal 'Plong', Raindrops.convert(14)
  end

  def test_15
    #skip
    assert_equal 'PlingPlang', Raindrops.convert(15)
  end

  def test_21
    #skip
    assert_equal 'PlingPlong', Raindrops.convert(21)
  end

  def test_25
    #skip
    assert_equal 'Plang', Raindrops.convert(25)
  end

  def test_35
    #skip
    assert_equal 'PlangPlong', Raindrops.convert(35)
  end

  def test_49
    #skip
    assert_equal 'Plong', Raindrops.convert(49)
  end

  def test_52
    #skip
    assert_equal '52', Raindrops.convert(52)
  end

  def test_105
    #skip
    assert_equal 'PlingPlangPlong', Raindrops.convert(105)
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
    assert_equal 2, BookKeeping::VERSION
  end
end
