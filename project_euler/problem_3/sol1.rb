# frozen_string_literal: true

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143

# find all factors of the given number
def get_factors(number)
  factors = []
  (1..Math.sqrt(number).to_i).each do |num|
    if (number % num).zero?
      factors << num
      factors << number / num
    end
  end
  factors
end

# determine if a given number is a prime number
def prime?(number)
  get_factors(number).length == 2
end

# find the largest prime
def largest_prime_factor(number)
  prime_factors = get_factors(number).select { |factor| prime?(factor) }
  prime_factors.max
end

puts largest_prime_factor(600_851_475_143)
