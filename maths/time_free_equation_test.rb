# frozen_string_literal: true

require 'minitest/autorun'
require_relative './time_free_equation'

class TimeFreeEquationTest < Minitest::Test
  def test_displacement
    assert_in_delta 24.0,
                    TimeFreeEquation.displacement(initial_velocity: 2.0, final_velocity: 10.0, acceleration: 2.0),
                    1E-12
  end

  def test_acceleration
    assert_in_delta 3.0,
                    TimeFreeEquation.acceleration(initial_velocity: 4.0, final_velocity: 10.0, displacement: 14.0),
                    1E-12
  end

  def test_final_velocity
    assert_in_delta 13.0,
                    TimeFreeEquation.final_velocity(initial_velocity: 5.0, acceleration: 3.0, displacement: 24.0),
                    1E-12
  end

  def test_initial_velocity
    assert_in_delta 6.0,
                    TimeFreeEquation.initial_velocity(final_velocity: 14.0, acceleration: 4.0, displacement: 20.0),
                    1E-12
  end

  def test_domain_error_for_imaginary_velocity
    assert_raises DomainError do
      TimeFreeEquation.final_velocity(initial_velocity: 1.0, acceleration: -10.0, displacement: 1.0)
    end
  end
end
