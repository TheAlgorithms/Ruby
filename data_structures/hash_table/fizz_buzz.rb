# Write a program that outputs the string representation of numbers
# from 1 to n. But for multiples of three it should output “Fizz”
# instead of the number and for the multiples of five output “Buzz”.
# For numbers which are multiples of both three and five output
# “FizzBuzz”.

#
# Approach 1: Hash it!
#

# Complexity Analysis

# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n, fizz_buzz = { 3 => 'Fizz', 5 => 'Buzz' })
  n.times.map do |i|
    i += 1
    num_str = ''

    fizz_buzz.each do |key, value|
      num_str += value if i % key == 0
    end

    num_str.empty? ? i.to_s : num_str
  end
end

n = 15
puts(fizz_buzz(n))
