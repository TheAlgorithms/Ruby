def binary_count_setbits(x)
  raise 'Input must be a positive integer' if x < 0

  binary = x.to_s(2)

  binary.chars.map { |c| c.to_i }.reduce(:+)
end

begin
  binary_count_setbits(-1)
rescue StandardError => e
  puts e.message
end
# Input must be a positive integer

puts binary_count_setbits(0)
# 0

puts binary_count_setbits(1)
# 1

puts binary_count_setbits(1024)
# 1

puts binary_count_setbits(1023)
# 10
