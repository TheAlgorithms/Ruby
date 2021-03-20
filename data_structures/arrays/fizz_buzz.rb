# Write a program that outputs the string representation of numbers
# from 1 to n. But for multiples of three it should output “Fizz”
# instead of the number and for the multiples of five output “Buzz”.
# For numbers which are multiples of both three and five output
# “FizzBuzz”.

#
# Approach 1: Naive Approach
#

# Complexity Analysis

# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  str = []

  n.times do |i|
    i += 1

    if i % 5 == 0 && i % 3 == 0
      str.push('FizzBuzz')
    elsif i % 3 == 0
      str.push('Fizz')
    elsif i % 5 == 0
      str.push('Buzz')
    else
      str.push(i.to_s)
    end
  end

  str
end

n = 15
fizz_buzz(n)
# => [
#     "1",
#     "2",
#     "Fizz",
#     "4",
#     "Buzz",
#     "Fizz",
#     "7",
#     "8",
#     "Fizz",
#     "Buzz",
#     "11",
#     "Fizz",
#     "13",
#     "14",
#     "FizzBuzz"
# ]

#
# Approach 2: String Concatenation
#

# Algorithm
#
# Instead of checking for every combination of these conditions,
# check for divisibility by given numbers i.e. 3, 5 as given in the
# problem. If the number is divisible, concatenate the corresponding
# string mapping Fizz or Buzz to the current answer string.
#
# For eg. If we are checking for the number 15, the steps would be:
#
# Condition 1: 15 % 3 == 0 , num_ans_str = "Fizz"
# Condition 2: 15 % 5 == 0 , num_ans_str += "Buzz"
# => num_ans_str = "FizzBuzz"
#

# Complexity Analysis
#
# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  str = []

  n.times do |i|
    i += 1
    num_str = ''

    num_str += 'Fizz' if i % 3 == 0
    num_str += 'Buzz' if i % 5 == 0

    num_str = i.to_s if num_str == ''

    str.push(num_str)
  end

  str
end

n = 15
puts(fizz_buzz(n))
