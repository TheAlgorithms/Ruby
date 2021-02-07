# Given a number, find number of digits in it.

def count_digits(n)
  count = 0
  temp = n

  return 1 if n == 0

  until temp.zero?
    count += 1
    temp /= 10
  end

  count
end

puts 'Number of digits in 8732 is ' + count_digits(8732).to_s
# Number of digits in 8732 is 4
puts 'Number of digits in 112233 is ' + count_digits(112_233).to_s
# Number of digits in 112233 is 6
puts 'Number of digits in 0 is ' + count_digits(0).to_s
# Number of digits in 0 is 1
