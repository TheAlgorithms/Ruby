#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'bowling'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_must_be_able_to_roll_with_number_of_pins
    assert_respond_to @game, :roll
    assert_equal 1, @game.method(:roll).arity
  end

  def test_must_have_a_score
    skip
    assert_respond_to @game, :score
  end

  def test_should_be_able_to_score_open_frame
    #skip
    @game.roll(3)
    @game.roll(4)
    roll_n_times(18, 0)
    assert_equal 7, @game.score
  end

  def test_should_be_able_to_score_multiple_frames
    skip
    [3, 4, 2, 3, 5, 2].each do |pins|
      @game.roll pins
    end
    roll_n_times(14, 0)
    assert_equal 19, @game.score
  end

  def test_should_score_a_game_with_all_gutterballs
    skip
    roll_n_times(20, 0)
    assert_equal 0, @game.score
  end

  def test_should_score_a_game_with_all_single_pin_rolls
    #skip
    roll_n_times(20, 1)
    assert_equal 20, @game.score
  end

  def test_should_allow_game_with_all_open_frames
    skip
    roll_n_times(10, [3, 6])
    assert_equal 90, @game.score
  end

  def test_should_correctly_score_a_strike_that_is_not_on_the_last_frame
    skip
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    roll_n_times(16, 0)

    assert_equal 26, @game.score
  end

  def test_should_score_a_spare_that_is_not_on_the_last_frame
    skip
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(4)
    roll_n_times(16, 0)

    assert_equal 20, @game.score
  end

  def test_should_score_multiple_strikes_in_a_row
    skip
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    roll_n_times(12, 0)

    assert_equal 81, @game.score
  end

  def test_should_score_multiple_spares_in_a_row
    skip
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(7)
    @game.roll(4)
    @game.roll(1)
    roll_n_times(14, 0)

    assert_equal 32, @game.score
  end

  def test_should_allow_fill_balls_when_the_final_frame_is_strike
    skip
    roll_n_times(18, 0)
    @game.roll(10)
    @game.roll(7)
    @game.roll(1)

    assert_equal 18, @game.score
  end

  def test_should_allow_fill_ball_in_last_frame_if_spare
    skip
    roll_n_times(18, 0)
    @game.roll(9)
    @game.roll(1)
    @game.roll(7)

    assert_equal 17, @game.score
  end

  def test_should_allow_fill_balls_to_be_strike
    skip
    roll_n_times(18, 0)
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)

    assert_equal 30, @game.score
  end

  def test_should_score_a_perfect_game
    skip
    roll_n_times(12, 10)
    assert_equal 300, @game.score
  end

  def test_should_not_allow_rolls_with_negative_pins
    skip
    assert_raises(
      RuntimeError,
      'Pins must have a value from 0 to 10') do
        @game.roll(-1)
      end
  end

  def test_should_not_allow_rolls_better_than_strike
    skip
    assert_raises(
      RuntimeError,
      'Pins must have a value from 0 to 10') do
        @game.roll(11)
      end
  end

  def test_should_not_allow_two_normal_rolls_better_than_strike
    skip
    assert_raises RuntimeError, 'Pin count exceeds pins on the lane' do
      @game.roll(5)
      @game.roll(6)
    end
  end

  def test_should_not_allow_two_normal_rolls_better_than_strike_in_last_frame
    skip
    roll_n_times(18, 0)
    assert_raises RuntimeError, 'Pin count exceeds pins on the lane' do
      @game.roll(10)
      @game.roll(5)
      @game.roll(6)
    end
  end

  def test_should_not_allow_to_take_score_at_the_beginning
    skip
    assert_raises(
      RuntimeError,
      'Score cannot be taken until the end of the game',
    ) do
      @game.score
    end
  end

  def test_should_not_allow_to_take_score_before_game_has_ended
    skip
    roll_n_times(19, 5)
    assert_raises(
      RuntimeError,
      'Score cannot be taken until the end of the game') do
        @game.score
      end
  end

  def test_should_not_allow_rolls_after_the_tenth_frame
    skip
    roll_n_times(20, 0)
    assert_raises(
      RuntimeError,
      'Should not be able to roll after game is over',
    ) do
      @game.roll(0)
    end
  end

  def test_should_not_calculate_score_before_fill_balls_have_been_played
    skip
    roll_n_times(10, 10)

    assert_raises RuntimeError, 'Game is not yet over, cannot score!' do
      @game.score
    end
  end

  def roll_n_times(rolls, pins)
    rolls.times do
      Array(pins).each { |value| @game.roll(value) }
    end
  end
  private :roll_n_times

  # Don't forget to define a constant VERSION inside of BookKeeping.
  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
