#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'space_age'

class SpaceAgeTest < Minitest::Test
  DELTA = 0.01

  def test_age_in_seconds
    age = SpaceAge.new(1_000_000)
    assert_in_delta 1_000_000, age.seconds, DELTA
  end

  def test_age_in_earth_years
    ##skip
    age = SpaceAge.new(1_000_000_000)
    assert_in_delta 31.69, age.on_earth, DELTA
  end

  def test_age_in_mercury_years
   # #skip
    age = SpaceAge.new(2_134_835_688)
    assert_in_delta 67.65, age.on_earth, DELTA
    assert_in_delta 280.88, age.on_mercury, DELTA
  end

  def test_age_in_venus_years
    #skip
    age = SpaceAge.new(189_839_836)
    assert_in_delta 6.02, age.on_earth, DELTA
    assert_in_delta 9.78, age.on_venus, DELTA
  end

  def test_age_on_mars
    #skip
    age = SpaceAge.new(2_329_871_239)
    assert_in_delta 73.83, age.on_earth, DELTA
    assert_in_delta 39.25, age.on_mars, DELTA
  end

  def test_age_on_jupiter
    #skip
    age = SpaceAge.new(901_876_382)
    assert_in_delta 28.58, age.on_earth, DELTA
    assert_in_delta 2.41, age.on_jupiter, DELTA
  end

  def test_age_on_saturn
    #skip
    age = SpaceAge.new(3_000_000_000)
    assert_in_delta 95.06, age.on_earth, DELTA
    assert_in_delta 3.23, age.on_saturn, DELTA
  end

  def test_age_on_uranus
    #skip
    age = SpaceAge.new(3_210_123_456)
    assert_in_delta 101.72, age.on_earth, DELTA
    assert_in_delta 1.21, age.on_uranus, DELTA
  end

  def test_age_on_neptune
    #skip
    age = SpaceAge.new(8_210_123_456)
    assert_in_delta 260.16, age.on_earth, DELTA
    assert_in_delta 1.58, age.on_neptune, DELTA
  end
end
