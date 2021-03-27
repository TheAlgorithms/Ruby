# A ruby program to check a given number is prime or not
# Mathematical explanation: A number which has only 2 factors i.e., 1 (one) and itself

# Prime number check function
def is_prime_number(number)
  primeFlag = false
  if number>0
    if number == 1
    primeFlag = true
    else
      factors = 2;
      while factors.to_i <= number.to_i/2
        if number.to_i % factors.to_i==0
        primeFlag = true
        break
        end
        factors+=1
      end
    end
  else
  primeFlag = true
  end

  if !primeFlag
    print "\nThe given number " + number.to_s + " is a Prime."
  else
    print "\nThe given number " + number.to_s + " is not a Prime."
  end
end

# prime input
is_prime_number(2)

# Non-prime input
is_prime_number(20)

# Negative input
is_prime_number(-21)
