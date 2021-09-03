def binary_xor(x, y)
  raise 'Input must only contain positive integers' if (x < 0) || (y < 0)

  binary_x = x.to_s(2)
  binary_y = y.to_s(2)

  if binary_x.length > binary_y.length
    prefix = '0' * (binary_x.length - binary_y.length)
    binary_y = prefix + binary_y
  elsif binary_y.length > binary_x.length
    prefix = '0' * (binary_y.length - binary_x.length)
    binary_x = prefix + binary_x
  end
  result = '0b'
  binary_x.each_char.with_index do |x_char, i|
    y_char = binary_y[i]

    result += if (x_char == '1' && y_char != '1') || (x_char != '1' && y_char == '1')
                '1'
              else
                '0'
              end
  end

  result
end

begin
  binary_xor(-1, 0)
rescue StandardError => e
  puts e.message
end
# Input must only contain positive integers

puts binary_xor(1, 1)
# 0b0
puts binary_xor(0, 1)
# 0b1
puts binary_xor(1024, 1024)
# 0b00000000000
puts binary_xor(0, 1023)
# 0b1111111111
puts binary_xor(16, 58)
# 0b101010
