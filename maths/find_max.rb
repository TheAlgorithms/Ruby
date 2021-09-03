# A ruby program to find max from a set of elements

# This find_max method will return the max element out of the array
def find_max(*array)
  max = array[0]
  array.each do |a|
    max = a if a >= max
  end
  "The Max of the following elements #{array} is #{max}."
rescue StandardError
  'Error: Please provide number only!'
end

# Max method will return the maximum element from the set of input elements provided
def predefined_max(*array)
  "The Max of the following elements #{array} is #{array.max}."
rescue StandardError
  'Error: Please provide number only!'
end

# Sort method will sort the elements in ascending order. Last method will return the end element out of the array
def predefined_sort_last_max(*array)
  "The Max of the following elements #{array} is #{array.max}."
rescue StandardError
  'Error: Please provide number only!'
end

# Using find_max
# Valid inputs
puts find_max(11, 29, 33)
# The Max of the following elements [11, 29, 33] is 33.

puts find_max(-221, -852, -1100, -10)
# The Max of the following elements [-221, -852, -1100, -10] is -10.

# Invalid inputs
puts find_max(5, '95', 2)
# Error: Please provide number only!

# Using predefined_max
# Valid inputs
puts predefined_max(51, 82, 39)
# The Max of the following elements [51, 82, 39] is 82.

puts predefined_max(-11, -51, -10, -10)
# The Max of the following elements [-11, -51, -10, -10] is -10.

# Invalid inputs
puts predefined_max('x', 5, 95, 2)
# Error: Please provide number only!

# Using predefined_sort_last_max
# Valid inputs
puts predefined_sort_last_max(1, 2, 3)
# The Max of the following elements [1, 2, 3] is 3.

puts predefined_sort_last_max(-21, -52, -100, -1)
# The Max of the following elements [-21, -52, -100, -1] is -1.

# Invalid inputs
puts predefined_sort_last_max(5, 95, 2, 'a')
# Error: Please provide number only!
