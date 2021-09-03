# Challenge name: Count Sorted Vowel Strings
#
# Given an integer n, return the number of strings of length n that consist only
# of vowels (a, e, i, o, u) and are lexicographically sorted.
#
# A string s is lexicographically sorted if for all valid i, s[i] is the same as
# or comes before s[i+1] in the alphabet.
#
#
# Example 1:
#
# Input: n = 1
# Output: 5
# Explanation: The 5 sorted strings that consist of vowels only are ["a","e","i","o","u"].
#
# Example 2:
#
# Input: n = 2
# Output: 15
# Explanation: The 15 sorted strings that consist of vowels only are
# ["aa","ae","ai","ao","au","ee","ei","eo","eu","ii","io","iu","oo","ou","uu"].
# Note that "ea" is not a valid string since 'e' comes after 'a' in the alphabet.
#
# Example 3:
#
# Input: n = 33
# Output: 66045

#
# Approach: Math
#

#
# Intuition and Algorithm
#
# The problem is a variant of finding Combinations.
# Mathematically, the problem can be described as,
# given 5 vowels (let k = 5), we want to find the
# number of combinations using only n vowels. Also,
# we can repeat each of those vowels multiple times.
#

# Complexity Analysis
#
# Time Complexity: O(1), as the approach runs in constant time.
# Space Complexity: O(1), as the approach uses constant extra space.

# @param {Integer} n
# @return {Integer}
def count_vowel_strings(n)
  (n + 4) * (n + 3) * (n + 2) * (n + 1) / 24
end

n = 33
puts count_vowel_strings(n)
# Output: 66045

n = 2
puts count_vowel_strings(n)
# Output: 15

n = 1
puts count_vowel_strings(n)
# Output: 5
