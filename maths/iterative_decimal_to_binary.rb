# Iterative method to convert a given decimal number into binary.

def decimal_to_binary(n)
  bin = []  
  until n.zero?
    bin << n % 2
    n = n / 2
  end
  return bin.reverse.join
end

puts 'Binary value of 4 is ' + decimal_to_binary(4).to_s
# Binary value of 4 is 100
puts 'Binary value of 31 is ' + decimal_to_binary(31).to_s
# Binary value of 31 is 11111
puts 'Binary value of 64 is ' + decimal_to_binary(64).to_s
# Binary value of 64 is 1000000
