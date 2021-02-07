# frozen_string_literal: true

require 'minitest/autorun'
require_relative './abs'

class AbsTest < Minitest::Test
  def test_positive_number
    assert_equal Abs.call(4), 4
  end

  def test_zero
    assert_equal Abs.call(0), 0
  end

  def test_negative_number
    assert_equal Abs.call(-9), 9
  end
end
