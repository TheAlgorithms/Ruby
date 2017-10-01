=begin
Searches through a list for a value in O(log(n)) time.
The list must be sorted.
=end
def binary_search(array, key)
  front = 0
  back = array.length - 1
  while front <= back
    middle = (front + back) / 2
    return middle if array[middle] == key
    key < array[middle] ?
      back = middle - 1 : front = middle + 1
  end
  nil
end

puts "Enter a sorted space-separated list:"
arr = gets.chomp.split(' ').map(&:to_i)
puts "Enter the value to be searched:"
value = gets.chomp.to_i
puts binary_search(arr, value) != nil ?
  "Found at index #{binary_search(arr, value)}" :
  "Not found"
