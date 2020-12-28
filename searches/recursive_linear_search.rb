# A pure Ruby implementation of a recursive linear search algorithm

def rec_linear_search(sequence, low, high, target)
  raise Exception('Invalid upper or lower bound!') unless high < sequence.length && low < sequence.length

  return -1 if high < low

  return low if sequence[low] == target

  return high if sequence[high] == target

  rec_linear_search(sequence, low + 1, high - 1, target)
end

puts(rec_linear_search([0, 30, 500, 100, 700], 0, 4, 0))
# => 0

puts(rec_linear_search([0, 30, 500, 100, 700], 0, 4, 700))
# => 4

puts(rec_linear_search([0, 30, 500, 100, 700], 0, 4, 30))
# => 1

puts(rec_linear_search([0, 30, 500, 100, 700], 0, 4, -6))
# => -1
