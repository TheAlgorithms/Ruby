# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def divisible_by_three_or_five?(number)
  (number % 3).zero? || (number % 5).zero?
end

sum = 0
(1...1000).each do |i|
  sum += i if divisible_by_three_or_five?(i)
end

p sum
