=begin
A pure Ruby implementation of a recursive linear search algorithm
=end

def rec_linear_search(sequence, low, high, target)
    unless (high < sequence.length && low < sequence.length)
      raise Exception("Invalid upper or lower bound!")
    end

    if high < low
      return -1
    end
    if sequence[low] == target
      return low
    end
    if sequence[high] == target
      return high
    end

    return rec_linear_search(sequence, low + 1, high - 1, target)
end

puts(rec_linear_search([0, 30, 500, 100, 700], 0, 4, 0))
# => 0
puts(rec_linear_search([0, 30, 500, 100, 700], 0, 4, 700))
# => 4
puts(rec_linear_search([0, 30, 500, 100, 700], 0, 4, 30))
# => 1
puts(rec_linear_search([0, 30, 500, 100, 700], 0, 4, -6))
# => -1
