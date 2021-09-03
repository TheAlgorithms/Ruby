# Challenge name: Isomorphic Strings
#
# Given two strings s and t, determine if they are isomorphic.
# Two strings s and t are isomorphic if the characters in s can be replaced to get t.
# All occurrences of a character must be replaced with another character while preserving the order of characters.
# No two characters may map to the same character, but a character may map to itself.
#
# Example 1:
# Input: s = "egg", t = "add"
# Output: true
#
# Example 2:
# Input: s = "foo", t = "bar"
# Output: false
#
# Example 3:
# Input: s = "paper", t = "title"
# Output: true
#
# Constraints:
# 1 <= s.length <= 5 * 104
# t.length == s.length
# s and t consist of any valid ascii character.

# Approach 1: Hash Map
# Time Complexity: O(N)
# Space Complexity: O(N)

def isomorphic_strings_check(s, t)
  # store character mappings
  map = {}
  # store already mapped characters
  set = []

  (0..s.length - 1).each do |i|
    # store characters to compare
    char1 = s[i]
    char2 = t[i]

    # if char1 is mapped
    if map[char1]
      # return false if char1 is mapped to a different character than already present
      return false if map[char1] != char2
    # if char1 is not mapped
    else
      # return false if char2 is already mapped to a different character
      return false if set.include?(char2)

      # checks passed: add new character map and track that char2 has been mapped
      map[char1] = char2
      set << char2
    end
  end
  true
end

puts isomorphic_strings_check('egg', 'add')
# => true

puts isomorphic_strings_check('foo', 'bar')
# => false

puts isomorphic_strings_check('paper', 'title')
# => true
