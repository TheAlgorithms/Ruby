# A ruby program calculate factorial of a given number.
# Mathematical Explanation: The factorial of a number is the product of all the integers from 1 to that number.
# i.e: n! = n*(n-1)*(n-2)......*2*1

#
# Approach: Interative
#

def factorial(n)
  return nil if n < 0

  fac = 1

  while n > 0
    fac *= n
    n -= 1
  end

  fac
end

puts '4! = ' + factorial(4).to_s
# 4! = 24

puts '0! = ' + factorial(0).to_s
# 0! = 1

puts '10! = ' + factorial(10).to_s
# 10! = 3628800
