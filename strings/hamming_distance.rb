# https://en.wikipedia.org/wiki/Hamming_distance

def hamming_distance(str1, str2)
  abort 'Strings must be of the same length' unless str1.length == str2.length

  str1.chars.zip(str2.chars).sum { |chr1, chr2| chr1 == chr2 ? 0 : 1 }
end

if $0 == __FILE__
  # Valid inputs
  puts hamming_distance 'ruby', 'rust'
  # => 2
  puts hamming_distance 'karolin', 'kathrin'
  # => 3
  puts hamming_distance 'kathrin', 'kerstin'
  # => 4
  puts hamming_distance '0000', '1111'
  # => 4

  # Invalid inputs
  puts hamming_distance 'ruby', 'foobar'
  # => Strings must be of the same length
end
