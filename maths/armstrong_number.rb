# A ruby program to determine whether a given number is an Armstrong number
# Wiki url: https://en.wikipedia.org/wiki/Narcissistic_number
# other resources: https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap04/arms.html

#
# Examples: -> 153 = (1 * 1 * 1) + (5 * 5 * 5) + (3 * 3 * 3) [Armstrong number] and -> 125 != (1 * 1 * 1) + (2 * 2 * 2) + (5 * 5 * 5)
# -> 1634 = (1 * 1 * 1 * 1) + (6 * 6 * 6 * 6) + (3 * 3 * 3 * 3) + (4 * 4 * 4 * 4)
#

def armstrong_number(number)
  num = number
  sum = 0
  len = number.digits.count
  while number != 0
    remainder = number % 10
    sum += remainder**len
    number /= 10
  end

  if num == sum
    "The number #{num} is an Armstrong number."
  else
    "The number #{num} is not an Armstrong number."
  end
rescue StandardError
  'Error: Please provide number only!'
end

#
# Valid inputs
#
puts armstrong_number(153)
# The number 153 is an Armstrong number.

puts armstrong_number(0)
# The number 0 is an Armstrong number.

puts armstrong_number(370)
# The number 370 is an Armstrong number.

puts armstrong_number(10)
# The number 10 is not an Armstrong number.

puts armstrong_number(1634)
# The number 1634 is an Armstrong number.

puts armstrong_number(123)
# The number 123 is not an Armstrong number.

#
# Invalid inputs
#
puts armstrong_number('153')
# Error: Please provide number only!

puts armstrong_number('a')
# Error: Please provide number only!
