# A ruby program to find max from a set of elements

module FindMax
  # This find_max method will return the max element out of the array
  def self.find_max(*array)
    max = array[0]
    array.each do |a|
      if a >= max
        max = a
      end
    end
    puts "The Max of the following elements #{array} is #{max}."
    rescue
        puts "Error: Please provide number only!"
  end

  # The max method will return the maximum element from the set of input elements provided
  def self.predefined_max(*array)
    puts "The Max of the following elements #{array} is #{array.max}."
    rescue
      puts "Error: Please provide number only!"
  end

  # The sort method will sort the elements in ascending order. And the last method will return the end element out of the array
  def self.predefined_sort_last_max(*array)
    puts "The Max of the following elements #{array} is #{array.sort.last}."
    rescue
      puts "Error: Please provide number only!"
  end
end

# Using find_max
# Valid inputs
FindMax.find_max(11, 29, 33)
# The Max of the following elements [11, 29, 33] is 33.

FindMax.find_max(-221, -852, -1100, -10)
# The Max of the following elements [-221, -852, -1100, -10] is -10.

# Invalid inputs
FindMax.find_max(5, "95", 2)
# Error: Please provide number only!

# Using predefined_max
# Valid inputs
FindMax.predefined_max(51, 82, 39)
# The Max of the following elements [51, 82, 39] is 82.

FindMax.predefined_max(-11, -51, -10, -10)
# The Max of the following elements [-11, -51, -10, -10] is -10.

# Invalid inputs
FindMax.predefined_max("x", 5, 95, 2)
# Error: Please provide number only!

# Using predefined_sort_last_max
# Valid inputs
FindMax.predefined_sort_last_max(1, 2, 3)
# The Max of the following elements [1, 2, 3] is 3.

FindMax.predefined_sort_last_max(-21, -52, -100, -1)
# The Max of the following elements [-21, -52, -100, -1] is -1.

# Invalid inputs
FindMax.predefined_sort_last_max(5, 95, 2, "a")
# Error: Please provide number only!
