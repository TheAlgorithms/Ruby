# https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm

def extended_euclidean_gcd(a, b)
  x0 = a
  x1 = b
  s = 1
  t = 0
  until x1.zero?
    q, x2 = x0.divmod(x1)
    x0 = x1
    x1 = x2
    s, t = t, s - q * t
  end
  x0
end

puts 'GCD(3, 5) = ' + extended_euclidean_gcd(3, 5).to_s
# GCD(3, 5) = 1
puts 'GCD(3, 6) = ' + extended_euclidean_gcd(3, 6).to_s
# GCD(3, 6) = 3
puts 'GCD(6, 3) = ' + extended_euclidean_gcd(6, 3).to_s
# GCD(6, 3) = 3

#
# Dynamic driver code:
#
# a = gets.to_i
# b = gets.to_i
# puts "GCD (#{a}, #{b} ) = #{extended_euclidean_gcd(a, b)}"
#
