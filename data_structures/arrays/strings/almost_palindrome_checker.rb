# Challenge name: Almost Palindrome
#
# Given a string s, return true if the s can be palindrome after deleting at most one character from it.
#
# Example 1:
# Input: s = "aba"
# Output: true
#
# Example 2:
# Input: s = "abca"
# Output: true
# Explanation: You could delete the character 'c'.
#
# Example 3:
# Input: s = "abc"
# Output: false
#
# Constraints:
# 1 <= s.length <= 105
# s consists of lowercase English letters.

#
# Approach 1: Two Pointers
#

# Complexity Analysis:
#
# Time Complexity: O(n)
# Space Complexity: O(1)

def almost_palindrome_checker(string)
  p1 = 0
  p2 = string.length - 1
  array = string.split('')

  while p1 < p2
    return palindrome_checker(array, p1, p2 - 1) || palindrome_checker(array, p1 + 1, p2) if array[p1] != array[p2]

    p1 += 1
    p2 -= 1
  end

  true
end

def palindrome_checker(array, p1, p2)
  while p1 < p2
    return false if array[p1] != array[p2]

    p1 += 1
    p2 -= 1
  end

  true
end

puts almost_palindrome_checker('aba')
# => true

puts almost_palindrome_checker('abca')
# => true

puts almost_palindrome_checker('abc')
# => false
