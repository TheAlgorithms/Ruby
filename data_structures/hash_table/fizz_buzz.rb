# Write a program that outputs the string representation of numbers
# from 1 to n. But for multiples of three it should output “Fizz”
# instead of the number and for the multiples of five output “Buzz”.
# For numbers which are multiples of both three and five output
# “FizzBuzz”.

#
# Approach 1: Hash it!
#

# Intuition
#
# This approach is an optimization over approach 2. When the
# number of mappings are limited, approach 2 looks good. But What
# if you decide to add too many mappings?
#
# Having a condition for every mapping is not feasible or may be
# we can say the code might get ugly and tough to maintain.
#
# What if tomorrow we have to change a mapping or maybe delete
# a mapping? Are we going to change the code every time we have a
# modification in the mappings?
#
# We don't have to. We can put all these mappings in a Hash Table.

# Complexity Analysis

# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  str = []
  fizz_buzz = {}
  fizz_buzz[3] = 'Fizz'
  fizz_buzz[5] = 'Buzz'

  n.times do |i|
    i += 1
    num_str = ''

    fizz_buzz.each do |key, value|
      num_str += value if i % key == 0
    end

    num_str = i.to_s if num_str == ''

    str.push(num_str)
  end

  str
end

n = 15
puts(fizz_buzz(n))
