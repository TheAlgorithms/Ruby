# frozen_string_literal: true

require 'minitest/autorun'
require_relative './delta_x'

class DeltaXTest < Minitest::Test
  def test_zero_acceleration
    assert_in_delta 15.0, DeltaX.call(initial_velocity: 3.0, time: 5.0, acceleration: 0.0), 1E-12
  end

  def test_positive_acceleration
    assert_in_delta 20.0, DeltaX.call(initial_velocity: 2.0, time: 4.0, acceleration: 1.5), 1E-12
  end

  def test_negative_acceleration
    assert_in_delta 2.0, DeltaX.call(initial_velocity: 5.0, time: 2.0, acceleration: -4.0), 1E-12
  end
end
