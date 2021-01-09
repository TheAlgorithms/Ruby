# frozen_string_literal: true

require 'minitest/autorun'
require_relative './square_root'

class SquareRootTest < Minitest::Test
  def test_negative_number
    assert_raises DomainError do
      SquareRoot.call(-1)
    end
  end

  def test_zero
    assert_equal 0, SquareRoot.call(0)
  end

  def test_all_numbers_below_1024
    (1...1024).each do |num|
      assert_in_delta SquareRoot.call(num), Math.sqrt(num), 1E-12
    end
  end
end
