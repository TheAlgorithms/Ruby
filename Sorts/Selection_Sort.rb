def selection_sort(array)
  n = array.length - 1
  i = 0
  while i <= n - 1
    smallest = i
    j = i + 1
    while j <= n
      smallest = j if array[j] < array[smallest]
      j += 1
    end
    array[i], array[smallest] = array[smallest], array[i] if i != smallest
    i += 1
  end
end

arr = ([9,8,3,1,2,55,68,48].shuffle) #We have taken a rondom example and also shuffling it
selection_sort(arr)
puts "Sorted array is: #{arr.inspect}"
