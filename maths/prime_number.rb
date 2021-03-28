# A ruby program to check a given number is prime or not
# Mathematical explanation: A number which has only 2 factors i.e., 1 (one) and itself

# Prime number check function
def is_prime_number(number)
  prime_flag = false
  if number>0
    if number == 1
      prime_flag = true
    else
      factors = 2
      while factors.to_i <= number.to_i/2
        if number.to_i % factors.to_i==0
          prime_flag = true
          break
        end
        factors+=1
      end
    end
  else
    prime_flag = true
  end

  if !prime_flag
    puts "The given number #{number} is a Prime."
  else
    puts "The given number #{number} is not a Prime."
  end
end

# prime input
is_prime_number(2)

# Non-prime input
is_prime_number(20)

# Negative input
is_prime_number(-21)
