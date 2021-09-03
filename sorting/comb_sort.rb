def comb_sort(array)
  gap = array.length
  swaps = true
  while (gap > 1) || swaps
    gap = [1, (gap / 1.25).to_i].max
    swaps = false
    0.upto(array.length - gap - 1) do |i|
      if array[i] > array[i + gap]
        array[i], array[i + gap] = array[i + gap], array[i]
        swaps = true
      end
    end
  end
  array
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p insertion_sort(list)
end
