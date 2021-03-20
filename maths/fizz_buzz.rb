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
