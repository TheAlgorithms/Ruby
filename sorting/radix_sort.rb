# This is a pure ruby implementation of the radix sort algorithm
# the function returns collection ordered by ascending
# Example:
# pry(main)> radix_sort([6, 22, 43, 16, 0, 15, 9])
# => [0, 6, 9, 15, 16, 22, 43]

def radix_sort(array, base = 10)
  # passes count equals to the number of digits in the longest number
  passes = (Math.log(array.minmax.map(&:abs).max) / Math.log(base)).floor + 1
  passes.times do |i|
    buckets = Array.new(2 * base) { [] }
    base_i = base**i

    # elements are added to buckets
    # according to the current place-value digit
    array.each do |j|
      n = (j / base_i) % base
      n += base if j >= 0
      buckets[n] << j
    end
    array = buckets.flatten
  end

  array
end
