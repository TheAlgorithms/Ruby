def binary_count_trailing_zeroes(x)
  raise 'Input must be a positive integer' if x < 0

  binary = x.to_s(2)

  count = 0
  binary.chars.reverse_each do |char|
    break if char == '1'

    count += 1
  end

  count
end

begin
  binary_count_trailing_zeroes(-1)
rescue StandardError => e
  puts e.message
end
# Input must be a positive integer

puts binary_count_trailing_zeroes(0)
# 1

puts binary_count_trailing_zeroes(1023)
# 0

puts binary_count_trailing_zeroes(1024)
# 10

puts binary_count_trailing_zeroes(54)
# 1

puts binary_count_trailing_zeroes(121_024)
# 6
