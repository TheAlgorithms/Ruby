# Challenge name: Jewels and Stones
#
# You're given strings jewels representing the types of stones that are jewels,
# and stones representing the stones you have. Each character in stones is a type
# of stone you have. You want to know how many of the stones you have are also
# jewels.
#
# Letters are case sensitive, so "a" is considered a different type of stone from "A".
#
# Example 1:
#
# Input: jewels = "aA", stones = "aAAbbbb"
# Output: 3
#
# Example 2:
#
# Input: jewels = "z", stones = "ZZ"
# Output: 0
#
#
# Constraints:
#
# 1 <= jewels.length, stones.length <= 50
# jewels and stones consist of only English letters.
# All the characters of jewels are unique.

#
# Approach 1: Brute Force
#
# Time Complexity: O(n^2)
#

def find_jewels(jewels, stones)
  jewels_array = jewels.split('')
  stones_array = stones.split('')
  result = 0
  jewels_array.each do |jewel|
    stones_array.each do |stone|
      result += 1 if jewel == stone
    end
  end
  result
end

puts find_jewels('aA', 'aAAbbbb')
# => 3
puts find_jewels('z', 'ZZ')
# => 0

#
# Approach 2: Hash
#
# Time Complexity: O(n)
#

def find_jewels(jewels, stones)
  jewels_array = jewels.split('')
  stones_array = stones.split('')
  result_hash = {}
  result = 0

  stones_array.each do |stone|
    if result_hash[stone]
      result_hash[stone] += 1
    else
      result_hash[stone] = 1
    end
  end

  jewels_array.each do |jewel|
    if result_hash[jewel]
      result += result_hash[jewel]
    else
      result
    end
  end

  result
end

puts find_jewels('aA', 'aAAbbbb')
# => 3
puts find_jewels('z', 'ZZ')
# => 0
