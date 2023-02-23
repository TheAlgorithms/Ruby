#Project Euler Problem 10:  https://projecteuler.net/problem=10
#Summation of primes
#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.
#References:  https://en.wikipedia.org/wiki/Prime_number
def is_prime?(number)   
    value = true
    if number > 1 and number < 4
        # 2 and 3 are primes
        value = true
    elsif number < 2 or number % 2 == 0 or number % 3 == 0
    # Negatives, 0, 1, all even numbers, all multiples of 3 are not primes
        value = false
    end
    end_range = (Math.sqrt(number) + 1).to_i
    # All primes number are in format of 6k +/- 1
    for i in (5..end_range).step(6)
        if number % i == 0 or number % (i + 2) == 0
            value = false
        end
    end
    result = value
end

def solution(max_total = 2000000)
  sum = 1
  num = 2
  value = 1
  while num < max_total and value < max_total
    if is_prime?(num)
      value += num
      if value < max_total
        sum = value
      end
    end
    num += 1
  end
  result = sum
end

answer = solution()
p answer