# Works only on sorted arrays.
# Finding element by creating step in array and jump ahead by fixed steps and finding element using linear search inside that steped array.
# Time Complexity: O(√n)

def jump_search(arr, x)
  n = arr.length

  # Finding block size to be jumped
  step = Math.sqrt(n)
  prev = 0

  # Finding the block where element is
  # present (if it is present)
  while arr[[step, n].min - 1] < x
    prev = step
    step += Math.sqrt(n)
    return -1 if prev >= n
  end

  # Doing a linear search for x in block
  # beginning with prev.
  while arr[prev] < x
    prev += 1
    # If we reached next block or end of
    # array, element is not present.
    return -1 if prev == [step, n].min
  end

  # If element is found
  return prev if arr[prev] == x

  -1
end

puts 'Enter a sorted space-separated list:'
arr = gets.chomp.split(' ').map(&:to_i)
puts 'Enter the value to be searched:'
value = gets.chomp.to_i

index = jump_search(arr, value)

puts index == -1 ? 'Element not found' : "Number #{value} is at #{index}"
