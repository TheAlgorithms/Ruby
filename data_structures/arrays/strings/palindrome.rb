# Challenge name: Valid Palindrome
#
# Given a string s, determine if it is a palindrome,
# considering only alphanumeric characters and ignoring cases.
#
# Example 1:
# Input: s = "A man, a plan, a canal: Panama"
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.
#
# Example 2:
# Input: s = "race a car"
# Output: false
# Explanation: "raceacar" is not a palindrome.
#
# Constraints:
# 1 <= s.length <= 2 * 105
# s consists only of printable ASCII characters.
# @param {String} s
# @return {Boolean}

#
# Approach 1: Using Ruby method .reverse
#
# Time Complexity: O(n)
#
def is_palindrome(s)
  letters_only = s.downcase.gsub(/[^0-9a-z]/i, '')
  letters_only.reverse == letters_only
end

s = 'A man, a plan, a canal: Panama'
puts is_palindrome(s)
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

s = 'race a car'
puts is_palindrome(s)
# Output: false
# Explanation: "raceacar" is not a palindrome.

s = 'ab_a'
puts is_palindrome(s)
# Output: true
# Explanation: "aba" is a palindrome.

#
# Approach 2: Reversed array
#
# Complexity Analysis:
#
# Time Complexity: O(n), in length n of the string.
#
# We need to iterate through the string: When we filter out non-alphanumeric characters and convert the remaining
# characters to lower-case. When we reverse the string. When we compare the original and the reversed strings.
# Each iteration runs linearly in time (since each character operation completes in constant time).
# Thus, the effective run-time complexity is linear.
#
# Space Complexity: O(n), in length n of the string. We need O(n) additional
# space to store the filtered string and the reversed string.
#
def is_palindrome(s)
  letters_only_array = s.downcase.gsub(/[^0-9a-z]/i, '').split('')
  reversed_array = []
  letters_only_array.each do |letter|
    reversed_array.unshift(letter)
  end
  letters_only_array == reversed_array
end

s = 'A man, a plan, a canal: Panama'
puts is_palindrome(s)
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

s = 'race a car'
puts is_palindrome(s)
# Output: false
# Explanation: "raceacar" is not a palindrome.

s = 'ab_a'
puts is_palindrome(s)
# Output: true
# Explanation: "aba" is a palindrome.

#
# Approach 2: Two Pointers
#

#
# Complexity Analysis:
#
# Time Complexity: O(n), in length n of the string. We traverse over each
# character at most once until the two pointers meet in the middle, or when
# we break and return early.
# Space Complexity: O(1). No extra space required, at all.
#
def is_palindrome(s)
  letters_only = s.downcase.gsub(/[^0-9a-z]/i, '')
  p1 = 0
  p2 = letters_only.length - 1

  while p1 < p2
    if letters_only[p1] == letters_only[p2]
      p1 += 1
      p2 -= 1
    else
      return false
    end
  end
  true
end

s = 'A man, a plan, a canal: Panama'
puts is_palindrome(s)
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

s = 'race a car'
puts is_palindrome(s)
# Output: false
# Explanation: "raceacar" is not a palindrome.

s = 'ab_a'
puts is_palindrome(s)
# Output: true
# Explanation: "aba" is a palindrome.
