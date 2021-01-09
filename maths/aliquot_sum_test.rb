# frozen_string_literal: true

require 'minitest/autorun'
require_relative './aliquot_sum'

class AliquotSumTest < Minitest::Test
  def test_zero
    assert_equal AliquotSum.call(0), 0
  end

  def test_one
    assert_equal Abs.call(1), 1
  end

  def test_many
    (2..100).each do |number|
      expected_aliquot_sum = (1...number).select { |num| (number % num).zero? }.sum
      assert_equal AliquotSum.call(number), expected_aliquot_sum
    end
  end
end
