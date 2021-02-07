# 2520 is the smallest number that can be divided
# by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?

# Euclid's algorithm for the greatest common divisor
def gcd(a, b)
  b.zero? ? a : gcd(b, a % b)
end

# Calculate the LCM using GCD
def lcm(a, b)
  (a * b) / gcd(a, b)
end

result = 1

20.times do |i|
  result = lcm(result, i + 1)
end

p result
