#!/usr/bin/env ruby
# encoding: utf-8
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'pangram'

# Test data version:
# deb225e Implement canonical dataset for scrabble-score problem (#255)

class PangramTest < Minitest::Test
  def test_sentence_empty
    str = ''
    refute Pangram.is_pangram?(str)
  end

  def test_pangram_with_only_lower_case
    #skip
    str = 'the quick brown fox jumps over the lazy dog'
    assert Pangram.is_pangram?(str)
  end

  def test_missing_character_x
    #skip
    str = 'a quick movement of the enemy will jeopardize five gunboats'
    refute Pangram.is_pangram?(str)
  end

  def test_another_missing_character_x
    #skip
    str = 'the quick brown fish jumps over the lazy dog'
    refute Pangram.is_pangram?(str)
  end

  def test_pangram_with_underscores
    #skip
    str = 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    assert Pangram.is_pangram?(str)
  end

  def test_pangram_with_numbers
    #skip
    str = 'the 1 quick brown fox jumps over the 2 lazy dogs'
    assert Pangram.is_pangram?(str)
  end

  def test_missing_letters_replaced_by_numbers
    #skip
    str = '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
    refute Pangram.is_pangram?(str)
  end

  def test_pangram_with_mixed_case_and_punctuation
    #skip
    str = '"Five quacking Zephyrs jolt my wax bed."'
    assert Pangram.is_pangram?(str)
  end

  def test_pangram_with_non_ascii_characters
    #skip
    str = 'Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich.'
    assert Pangram.is_pangram?(str)
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
    assert_equal 2, BookKeeping::VERSION
  end
end
