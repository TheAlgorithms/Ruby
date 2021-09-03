# A ruby program to find min from a set of elements

# This find_min method will return the min element out of the array
def find_min(*array)
  min = array[0]
  array.each do |a|
    min = a if a <= min
  end
  "The Min of the following elements #{array} is #{min}."
rescue StandardError
  'Error: Please provide number only!'
end

# Min method will return the minimum element from the set of input elements provided
def predefined_min(*array)
  "The Min of the following elements #{array} is #{array.min}."
rescue StandardError
  'Error: Please provide number only!'
end

# Sort method will sort the elements in ascending order. First method will return the beginning element out of the array
def predefined_sort_first_min(*array)
  "The Min of the following elements #{array} is #{array.min}."
rescue StandardError
  'Error: Please provide number only!'
end

# Using find_min
# Valid inputs
puts find_min(11, 29, 33)
# The Min of the following elements [11, 29, 33] is 33.

puts find_min(-221, -852, -1100, -10)
# The Min of the following elements [-221, -852, -1100, -10] is -10.

# Invalid inputs
puts find_min(5, '95', 2)
# Error: Please provide number only!

# Using predefined_min
# Valid inputs
puts predefined_min(51, 82, 39)
# The Min of the following elements [51, 82, 39] is 82.

puts predefined_min(-11, -51, -10, -10)
# The Min of the following elements [-11, -51, -10, -10] is -10.

# Invalid inputs
puts predefined_min('x', 5, 95, 2)
# Error: Please provide number only!

# Using predefined_sort_first_min
# Valid inputs
puts predefined_sort_first_min(1, 2, 3)
# The Min of the following elements [1, 2, 3] is 3.

puts predefined_sort_first_min(-21, -52, -100, -1)
# The Min of the following elements [-21, -52, -100, -1] is -1.

# Invalid inputs
puts predefined_sort_first_min(5, 95, 2, 'a')
# Error: Please provide number only!
