# Ruby implementation of binary insertion sort algorithm

def binary_search(arr, val, start, stop)
  while start <= stop

    mid = (start + stop) / 2

    if val == arr[mid] # val is in the middle
      return mid
    elsif val > arr[mid] # val is on the right side
      start = mid + 1
    else
      stop = mid - 1 # val is on the left side
    end
  end

  start
end

def binary_insertion_sort(arr)
  n = arr.size

  (0...n).each do |index|
    j = index - 1
    selected = arr[index]

    # find location where selected value should be inserted
    location = binary_search(arr, selected, 0, j)

    # move all elements after location to make space
    while j >= location
      arr[j + 1] = arr[j]
      j -= 1
      arr[j + 1] = selected
    end
  end

  arr
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p binary_insertion_sort(list)
end