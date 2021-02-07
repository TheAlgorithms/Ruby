#         Ternary Search
# -------------------------------
# Ternary search is a searching technique that is used to search the position of a specific value in an array.
# Ternary search is a divide-and-conquer algorithm.
# It is mandatory for the array to be sorted (in which you will search for an element).
# The array is divided into three parts and then we determine in which part the element exists.
# In this search, after each iteration it neglects 1/3 part of the array and repeats the same operations on the remaining ⅔.
# Time Complexity: O(log3 n)
# Space Complexity: O(1)

def ternary_search(l, r, key, arr)
    # l is the starting index and r is the ending index of the array/sub-array.
  if r >= l
      # find mid1 and mid2
      mid1 = l + (r - l) / 3
      mid2 = r - (r - l) / 3
      # check if key is equal to mid1
      if arr[mid1] == key
          mid1
      # check if key is equal to mid2
      elsif arr[mid2] == key
          mid2
      # Since key is not present at mid, check in which region it is present
      # then repeat the Search operation in that region
      elsif key < arr[mid1]
          ternary_search(l, mid1 - 1, key, arr)
      elsif key > arr[mid2]
          ternary_search(mid2 + 1, r, key, arr)
      else
          ternary_search(mid1 + 1, mid2 - 1, key, arr)
      end
  end
end

puts "Enter a space-separated list:"
arr = gets.chomp.split(' ').map(&:to_i)
puts "Enter a value to be searched:"
key = gets.chomp.to_i
puts if ternary_search(0, arr.length - 1, key, arr) != nil
  "Found at index #{ternary_search(0, arr.length - 1, key, arr)}"
else
  "Not found"
end
