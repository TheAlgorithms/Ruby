# Works only on sorted arrays.
# Finding element by creating step in array and jump ahead by fixed steps and finding element using linear search inside that steped array.
# Time Complexity : O(√n)

def jumpsearch(arr, x)
  n = arr.length;

  # Finding block size to be jumped 
  step = Math.sqrt(n);
  prev = 0;

  # Finding the block where element is 
  # present (if it is present) 
  while (arr[[step, n].min - 1] < x) do
    prev = step;
    step += Math.sqrt(n);
    if (prev >= n)
      return -1;
    end
  end

  # Doing a linear search for x in block 
  # beginning with prev. 
  while (arr[prev] < x) do
    prev = prev + 1;
    # If we reached next block or end of 
    # array, element is not present. 
    if (prev == [step, n].min)
      return -1;
    end
  end

  # If element is found
  if (arr[prev] == x)
    return prev;
  end

  return -1;
end

puts "Enter a sorted space-separated list:"
arr = gets.chomp.split(' ').map(&:to_i)
puts "Enter the value to be searched:"
value = gets.chomp.to_i

index = jump_search(arr, value)

puts index == -1 ? "Element not found" : "Number #{value} is at #{index}"
