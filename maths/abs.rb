# frozen_string_literal: true

# Calculates the absolute value of a number
class Abs
  def self.call(number)
    return -number if number.negative?

    number
  end
end
