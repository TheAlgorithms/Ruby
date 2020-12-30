def quicksort(arr)
  return [] if arr.empty?

  # chose a random pivot value
  pivot = arr.delete_at(rand(arr.size))
  # partition array into 2 arrays and comparing them to each other and eventually returning
  # array with the pivot value sorted
  left, right = arr.partition(&pivot.method(:>))

  # recursively calling the quicksort method on itself
  return *quicksort(left), pivot, *quicksort(right)
end

arr = [34, 2, 1, 5, 3]
p quicksort(arr)
