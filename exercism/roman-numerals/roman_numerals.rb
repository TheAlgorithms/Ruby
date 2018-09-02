module BookKeeping
  VERSION = 2
end

class Integer
  SYMBOLS = [[1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'],
             [100, 'C'], [90, 'XC'], [50, 'L'], [40, 'XL'],
             [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'],
             [1, 'I']].freeze

  def to_roman
    num = self
    SYMBOLS.reduce('') do |str, (divisor, symbol)|
      div, num = num.divmod(divisor)
      str + symbol * div
    end
  end
end