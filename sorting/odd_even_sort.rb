#Odd Even Sort
#https://en.wikipedia.org/wiki/Odd%E2%80%93even_sort

def odd_even_sort(arr)
  n = arr.length
  sorted = false

  while !sorted
    sorted = true
    (1..n - 2).step(2) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end

    (0..n - 2).step(2) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end
end

# Test
arr = [5, 10, 2, 9, 1, 5, 2, 6, 7, 8]
odd_even_sort(arr)
puts arr
