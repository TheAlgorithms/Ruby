# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

answer = 0
999.downto(99) do |i|
  999.downto(99) do |j|
    t = (i * j)
    answer = i * j if (t.to_s == t.to_s.reverse) && (t > answer) && (t > answer)
  end
end
puts answer
