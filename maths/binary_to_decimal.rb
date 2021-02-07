#
# For any binary number of n digits i.e dn-1 ... d3 d2 d1 d0
# The equivalent decimal number is equal to the sum of binary digits (dn) times their power of 2 (2n):
# decimal = d0×2^0 + d1×2^1 + d2×2^2 + ...
#

def binary_to_decimal(n)
  decimal = 0
  base = 1
  until n.zero?
    x = n % 10
    n /= 10
    decimal += x * base
    base *= 2
  end
  decimal
end

puts 'Decimal value of 110011 is ' + binary_to_decimal(110_011).to_s
# Decimal value of 110011 is 51
puts 'Decimal value of 11110 is ' + binary_to_decimal(11_110).to_s
# Decimal value of 11110 is 30
puts 'Decimal value of 101 is ' + binary_to_decimal(101).to_s
# Decimal value of 101 is 5
