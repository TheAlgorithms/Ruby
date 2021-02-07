# Fisher and Yates Shuffle is one of the simplest and most popular shuffling algorithm
def fisher_yates_shuffle(array)
  n = array.length
  while n > 0
    i = rand(n -= 1)
    array[i], array[n] = array[n], array[i]
  end
  array
end

arr = [1, 2, 40, 30, 20, 15, 323, 12, 3, 4]
puts fisher_yates_shuffle(arr)
