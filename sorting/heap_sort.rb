# Algorithm: Heap-Sort
# Time-Complexity: O(nlogn)
def heap_sort(array)
  array_size = array.size
  adjusted_array = [nil] + array
  (array_size / 2).downto(1) do |i|
    adjusted_down(adjusted_array, i, array_size)
  end
  while array_size > 1
    adjusted_array[1], adjusted_array[array_size] = adjusted_array[array_size], adjusted_array[1]
    array_size -= 1
    adjusted_down(adjusted_array, 1, array_size)
  end
  adjusted_array.drop(1)
end

# Method to adjust heap in downward manner
def adjusted_down(adjusted_array, parent, limit)
  top = adjusted_array[parent]
  while (child = 2 * parent) <= limit
    child += 1 if (child < limit) && (adjusted_array[child] < adjusted_array[child + 1])
    break if top >= adjusted_array[child]

    adjusted_array[parent] = adjusted_array[child]
    parent = child
  end
  adjusted_array[parent] = top
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p heap_sort(list)
end
