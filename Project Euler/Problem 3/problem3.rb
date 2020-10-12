def is_prime?(number)
  if number == 1
    return false
  end

  if number == 2 || number == 3 || number == 5 || number == 7
    return true
  end

  n = Math.sqrt(number).to_i

  2.upto(n) do |i|
    if number%i == 0
      return false
    end
  end

  return true
end


def largest_prime_factor(number)
  if is_prime?(number)
    return number
  end

  sq_root = Math.sqrt(number).to_i

  sq_root.downto(1) do |n|
    if (number%n == 0) && is_prime?(n)
      return n
    end
  end
end


if __FILE__ == $0
  puts(largest_prime_factor(600851475143))
end
