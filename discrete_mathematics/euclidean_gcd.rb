# https://en.wikipedia.org/wiki/Euclidean_algorithm

def euclidean_gcd(a, b)
  while b != 0
    t = b
    b = a % b
    a = t
  end
  a
end

puts 'GCD(3, 5) = ' + euclidean_gcd(3, 5).to_s
puts 'GCD(3, 6) = ' + euclidean_gcd(3, 6).to_s
puts 'GCD(6, 3) = ' + euclidean_gcd(6, 3).to_s
