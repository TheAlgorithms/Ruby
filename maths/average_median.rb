# A ruby program to find average median
# Reference: https://dev.to/colerau/how-to-find-the-median-and-mean-of-an-array-in-ruby-4f04

module AverageMedian
  def self.average_median(n, *array)
    if n.instance_of? Integer
      if n == array.size
        array.sort
        if array.size.even?
          mid_element_1 = array.size / 2
          mid_element_2 = mid_element_1 + 1
          puts "The average median of the following elements #{array} is #{(array[mid_element_1 - 1] + array[mid_element_2 - 1]) / 2}."
        else
          mid_element = (array.size + 1) / 2
          puts "The average median of the following elements #{array} is #{array[mid_element - 1]}."
        end
      else
        puts "Provide the required #{n} elements properly!"
      end
    else
      raise
    end
  rescue StandardError
    puts 'Error: Please provide number only!'
  end
end

#
# Valid inputs
#

puts AverageMedian.average_median(2, 3, 1)
# The average median of the following elements [3, 1] is 2.

puts AverageMedian.average_median(5, 1, 2, 3, 4, 5)
# The average median of the following elements [1, 2, 3, 4, 5] is 3.

puts AverageMedian.average_median(3, 2, 2, 2)
# The average median of the following elements [2, 2, 2] is 2.

puts AverageMedian.average_median(1, 5)
# The average median of the following elements [5] is 5.

#
# Invalid inputs
#

puts AverageMedian.average_median(2, 3, 1, 5)
# Provide the required 2 elements properly!

puts AverageMedian.average_median(2, 3, 'a')
# Traceback (most recent call last):
#         4: from /Users/voliveira/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
#         3: from /Users/voliveira/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
#         2: from /Users/voliveira/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
#         1: from (irb):30
# NameError (undefined local variable or method `verageMedian' for main:Object)

puts AverageMedian.average_median('a', 1, 2)
# Error: Please provide number only!
