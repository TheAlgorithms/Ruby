def binary_and(x, y)
  raise 'Input must only contain positive integers' if (x < 0) || (y < 0)

  '0b' + (x & y).to_s(2)
end

begin
  binary_and(-1, 0)
rescue StandardError => e
  puts e.message
end
# Input must only contain positive integers

puts binary_and(1, 1)
# 0b1
puts binary_and(0, 1)
# 0b0
puts binary_and(1024, 1024)
# 0b10000000000
puts binary_and(0, 1023)
# 0b0000000000
puts binary_and(16, 58)
# 0b010000
