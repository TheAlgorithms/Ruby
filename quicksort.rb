def quicksort
  return [] if empty?

  # chose a random pivot value
  pivot = delete_at(rand(size))
  # partition array into 2 arrays and comparing them to each other and eventually returning
  # array with the pivot value sorted
  left, right = partition(&pivot.method(:>))

  # recursively calling the quicksort method on itself
  return *left.quicksort, pivot, *right.quicksort
end

arr = [34, 2, 1, 5, 3]
p arr.quicksort
