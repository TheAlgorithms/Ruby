# A ruby program for 3N plus 1
# 3N plus 1 is also called as Collatz Conjecture
#
# f(n) => n / 2 (if n = 0 (mod 2))
# f(n) => (3n + 1) (if n = 1 (mod 2))
#
# Wiki: https://en.wikipedia.org/wiki/Collatz_conjecture

def collatz_conjecture(number)
  n = number
  nums = []
  nums.push(number)

  while number > 1
    if number.even?
      number /= 2
      nums.push(number)
    else
      number = 3 * number + 1
      nums.push(number)
    end
  end

  "The 3N + 1 series of #{n} is #{nums}."
rescue StandardError
  'Error: Please provide number only!'
end

# Valid inputs
puts collatz_conjecture(12)
# The 3N + 1 series of 12 is [12, 6, 3, 10, 5, 16, 8, 4, 2, 1].

puts collatz_conjecture(6)
# The 3N + 1 series of 6 is [6, 3, 10, 5, 16, 8, 4, 2, 1].

puts collatz_conjecture(100)
# The 3N + 1 series of 100 is [100, 50, 25, 76, 38, 19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1].

# Invalid inputs
puts collatz_conjecture('12')
# Error: Please provide number only!

puts collatz_conjecture('a')
# Error: Please provide number only!
