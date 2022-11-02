# frozen_string_literal: true

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

class Integer
  def parindrome?
    self == reverse
  end

  # 123.reverse == 321
  # 100.reverse == 1
  def reverse
    result = 0
    n = self
    loop do
      result = result * 10 + n % 10
      break if (n /= 10).zero?
    end
    result
  end
end

factors = (100..999).to_a
products = factors.product(factors).map { _1 * _2 }
puts products.select(&:parindrome?).max
