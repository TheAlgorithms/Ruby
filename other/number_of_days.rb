# Challenge name: Number of Days Between Two Dates
#
# Write a program to count the number of days between two dates.
#
# The two dates are given as strings, their format is YYYY-MM-DD as shown in the examples.
# Example 1:
# Input: date1 = "2019-06-29", date2 = "2019-06-30"
# Output: 1
#
# Example 2:
# Input: date1 = "2020-01-15", date2 = "2019-12-31"
# Output: 15
#
# Constraints: The given dates are valid dates between the years 1971 and 2100.

#
# Approach 1: Using Ruby built-in feature Date.parse
# Time complexity: O(1)
# Space complexity: O(1)
#

require 'date'

def number_of_days(date1, date2)
  beginning_date = Date.parse(date1)
  end_date = Date.parse(date2)
  (end_date - beginning_date).to_i.abs
end

puts number_of_days('2019-06-29', '2019-06-30')
# => 1

puts number_of_days('2020-01-15', '2019-12-31')
# => 15
