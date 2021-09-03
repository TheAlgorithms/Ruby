# Challenge name: Roman to Integer
#
# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
#
# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
#
# For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
#
# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
#
# I can be placed before V (5) and X (10) to make 4 and 9.
# X can be placed before L (50) and C (100) to make 40 and 90.
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer.
#
#

# Approach 1: Left-to-Right Pass
#

# Complexity Analysis
#
# Let n be the length of the input string (the total number of symbols in it).
#
# Time complexity: O(1).
# As there is a finite set of roman numerals.
#
# Space complexity: O(1).
# Because only a constant number of single-value variables are used, the space complexity is O(1).

ROM_NUMS = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}

# Now, recall that each symbol adds its own value, except for when a smaller
# valued symbol is before a larger valued symbol. In those cases, instead of
# adding both symbols to the total, we need to subtract the large from the
# small, adding that instead.

# Therefore, the simplest algorithm is to use a pointer to scan through the
# string, at each step deciding whether to add the current symbol and
# go forward 1 place, or add the difference of the next 2 symbols and
# go forward 2 places.

def roman_to_int(s)
  res = 0
  temp = 0

  s.chars.each_with_index do |el, i|
    # subtractive case: if at least 2 symbols remaining AND value of s[i] < value of s[i + 1]
    if ROM_NUMS[s[i + 1]] && ROM_NUMS[el] < ROM_NUMS[s[i + 1]]
      temp = ROM_NUMS[el]
    else
      # Else this is NOT the subtractive case.
      res += (ROM_NUMS[el] - temp)
      temp = 0
    end
  end

  res
end

s = 'III'
puts roman_to_int(s)
# Output: 3

s = 'IV'
puts roman_to_int(s)
# Output: 4

s = 'IX'
puts roman_to_int(s)
# Output: 9

s = 'LVIII'
puts roman_to_int(s)
# Output: 58
# Explanation: L = 50, V= 5, III = 3.

s = 'MCMXCIV'
puts roman_to_int(s)
# Output: 1994
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
