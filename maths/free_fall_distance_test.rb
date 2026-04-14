# frozen_string_literal: true

require 'minitest/autorun'
require_relative './free_fall_distance'

class FreeFallDistanceTest < Minitest::Test
  def test_distance_from_time
    assert_in_delta 19.6133, FreeFallDistance.distance(time: 2.0), 1E-4
  end

  def test_time_from_distance
    assert_in_delta 2.0, FreeFallDistance.time(distance: 19.6133), 1E-4
  end

  def test_negative_time_raises
    assert_raises DomainError do
      FreeFallDistance.distance(time: -1.0)
    end
  end

  def test_negative_distance_raises
    assert_raises DomainError do
      FreeFallDistance.time(distance: -1.0)
    end
  end
end
