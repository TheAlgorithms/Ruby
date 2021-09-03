# A ruby program to check a given number is prime or not
# Mathematical explanation: A number which has only 2 factors i.e., 1 (one) and itself

# Prime number check function
def prime_number(number)
  non_prime_flag = if number <= 1
                     true
                   elsif number == 2
                     false
                   elsif number.even?
                     true
                   else
                     (2..Math.sqrt(number)).any? { |i| number % i == 0 }
                   end

  if !non_prime_flag
    puts "The given number #{number} is a Prime."
  else
    puts "The given number #{number} is not a Prime."
  end
end

# Non-prime input
prime_number(1)

# prime input
# Number 2 is an even prime number
prime_number(2)

# Non-prime input
prime_number(20)

# Negative input
prime_number(-21)
