# frozen_string_literal: true

# Let d(n) be defined as the sum of proper divisors of n
# (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a & b, then a and b are an amicable pair.
# and each of a and b are called amicable numbers.
#
# For example,
#
# The proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
# therefore d(220) = 284.
#
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

# get list of all divisors of `number`
def get_divisors(number)
  divisors = []
  (1..(Math.sqrt(number).to_i)).each do |num|
    if (number % num).zero?
      divisors << num
      divisors << number / num
    end
  end
  divisors
end

# get list of all proper divisors of `number` i.e. removing `number` from
# the list of divisors
def get_proper_divisors(number)
  divisors = get_divisors(number)
  divisors.delete(number)
  divisors
end

# implementation of a method `d` as mentioned in the question
# i.e. finding sum of all proper divisors of `number`
def d(number)
  get_proper_divisors(number).sum
end

# given an upper `limit`, this method finds all amicable numbers
# under this `limit`
def find_amicable_numbers(limit)
  result = []
  (1...limit).each do |a|
    b = d(a)
    res = d(b)
    result.push(a) if (a == res) && (a != b)
  end
  result
end

# calling `find_amicable_numbers` method and finding sum of all such numbers
# below 10000, and printing the result on the console
puts find_amicable_numbers(10_000).sum
