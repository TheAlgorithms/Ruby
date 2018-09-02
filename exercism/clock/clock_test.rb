#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'clock'

# Test data version:
# deb225e Implement canonical dataset for scrabble-score problem (#255)

class ClockTest < Minitest::Test
  def test_on_the_hour
    #  #skip
    assert_equal '08:00', Clock.at(8, 0).to_s
  end

  def test_past_the_hour
    # #skip
    assert_equal '11:09', Clock.at(11, 9).to_s
  end

  def test_midnight_is_zero_hours
    # #skip
    assert_equal '00:00', Clock.at(24, 0).to_s
  end

  def test_hour_rolls_over
    # #skip
    assert_equal '01:00', Clock.at(25, 0).to_s
  end

  def test_hour_rolls_over_continuously
    # #skip
    assert_equal '04:00', Clock.at(100, 0).to_s
  end

  def test_sixty_minutes_is_next_hour
    # #skip
    assert_equal '02:00', Clock.at(1, 60).to_s
  end

  def test_minutes_roll_over_continuously
    # #skip
    assert_equal '02:40', Clock.at(0, 160).to_s
  end

  def test_minutes_roll_over_continuously
    # #skip
    assert_equal '04:43', Clock.at(0, 1723).to_s
  end

  def test_hour_and_minutes_roll_over
    # #skip
    assert_equal '03:40', Clock.at(25, 160).to_s
  end

  def test_hour_and_minutes_roll_over_continuously
    # #skip
    assert_equal '11:01', Clock.at(201, 3001).to_s
  end

  def test_hour_and_minutes_roll_over_to_exactly_midnight
     ##skip
    assert_equal '00:00', Clock.at(72, 8640).to_s
  end

  def test_negative_hour
     ##skip
    assert_equal '23:15', Clock.at(-1, 15).to_s
  end

  def test_negative_hour_rolls_over
     ##skip
    assert_equal '23:00', Clock.at(-25, 0).to_s
  end

  def test_negative_hour_rolls_over_continuously
     ##skip
    assert_equal '05:00', Clock.at(-91, 0).to_s
  end

  def test_negative_minutes
     ##skip
    assert_equal '00:20', Clock.at(1, -40).to_s
  end

  def test_negative_minutes_roll_over
     ##skip
    assert_equal '22:20', Clock.at(1, -160).to_s
  end

  def test_negative_minutes_roll_over_continuously
     ##skip
    assert_equal '16:40', Clock.at(1, -4820).to_s
  end

  def test_negative_hour_and_minutes_both_roll_over
     ##skip
    assert_equal '20:20', Clock.at(-25, -160).to_s
  end

  def test_negative_hour_and_minutes_both_roll_over_continuously
     ##skip
    assert_equal '22:10', Clock.at(-121, -5810).to_s
  end

  def test_add_minutes
     ##skip
    assert_equal '10:03', (Clock.at(10, 0) + 3).to_s
  end

  def test_add_no_minutes
     #skip
    assert_equal '06:41', (Clock.at(6, 41) + 0).to_s
  end

  def test_add_to_next_hour
     #skip
    assert_equal '01:25', (Clock.at(0, 45) + 40).to_s
  end

  def test_add_more_than_one_hour
     #skip
    assert_equal '11:01', (Clock.at(10, 0) + 61).to_s
  end

  def test_add_more_than_two_hours_with_carry
     #skip
    assert_equal '03:25', (Clock.at(0, 45) + 160).to_s
  end

  def test_add_across_midnight
     #skip
    assert_equal '00:01', (Clock.at(23, 59) + 2).to_s
  end

  def test_add_more_than_one_day__1500_min_is_equal_to_25_hrs
     #skip
    assert_equal '06:32', (Clock.at(5, 32) + 1500).to_s
  end

  def test_add_more_than_two_days
     #skip
    assert_equal '11:21', (Clock.at(1, 1) + 3500).to_s
  end

  def test_subtract_minutes
     #skip
    assert_equal '10:00', (Clock.at(10, 3) + -3).to_s
  end

  def test_subtract_to_previous_hour
     #skip
    assert_equal '09:33', (Clock.at(10, 3) + -30).to_s
  end

  def test_subtract_more_than_an_hour
     #skip
    assert_equal '08:53', (Clock.at(10, 3) + -70).to_s
  end

  def test_subtract_across_midnight
     #skip
    assert_equal '23:59', (Clock.at(0, 3) + -4).to_s
  end

  def test_subtract_more_than_two_hours
     #skip
    assert_equal '21:20', (Clock.at(0, 0) + -160).to_s
  end

  def test_subtract_more_than_two_hours_with_borrow
     #skip
    assert_equal '03:35', (Clock.at(6, 15) + -160).to_s
  end

  def test_subtract_more_than_one_day__1500_min_is_equal_to_25_hrs
     #skip
    assert_equal '04:32', (Clock.at(5, 32) + -1500).to_s
  end

  def test_subtract_more_than_two_days
     #skip
    assert_equal '00:20', (Clock.at(2, 20) + -3000).to_s
  end

  def test_clocks_with_same_time
     #skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert clock1 == clock2
  end

  def test_clocks_a_minute_apart
    # #skip
    clock1 = Clock.at(15, 36)
    clock2 = Clock.at(15, 37)
    refute clock1 == clock2
  end

  def test_clocks_an_hour_apart
    # #skip
    clock1 = Clock.at(14, 37)
    clock2 = Clock.at(15, 37)
    refute clock1 == clock2
  end

  def test_clocks_with_hour_overflow
     #skip
    clock1 = Clock.at(10, 37)
    clock2 = Clock.at(34, 37)
    assert clock1 == clock2
  end

  def test_clocks_with_hour_overflow_by_several_days
     #skip
    clock1 = Clock.at(3, 11)
    clock2 = Clock.at(99, 11)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour
     #skip
    clock1 = Clock.at(22, 40)
    clock2 = Clock.at(-2, 40)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour_that_wraps
     #skip
    clock1 = Clock.at(17, 3)
    clock2 = Clock.at(-31, 3)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour_that_wraps_multiple_times
     #skip
    clock1 = Clock.at(13, 49)
    clock2 = Clock.at(-83, 49)
    assert clock1 == clock2
  end

  def test_clocks_with_minute_overflow
     #skip
    clock1 = Clock.at(0, 1)
    clock2 = Clock.at(0, 1441)
    assert clock1 == clock2
  end

  def test_clocks_with_minute_overflow_by_several_days
     #skip
    clock1 = Clock.at(2, 2)
    clock2 = Clock.at(2, 4322)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute
     #skip
    clock1 = Clock.at(2, 40)
    clock2 = Clock.at(3, -20)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute_that_wraps
     #skip
    clock1 = Clock.at(4, 10)
    clock2 = Clock.at(5, -1490)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute_that_wraps_multiple_times
     #skip
    clock1 = Clock.at(6, 15)
    clock2 = Clock.at(6, -4305)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hours_and_minutes
     #skip
    clock1 = Clock.at(7, 32)
    clock2 = Clock.at(-12, -268)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hours_and_minutes_that_wrap
     #skip
    clock1 = Clock.at(18, 7)
    clock2 = Clock.at(-54, -11_513)
    assert clock1 == clock2
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
     skip
    assert_equal 2, BookKeeping::VERSION
  end
end
