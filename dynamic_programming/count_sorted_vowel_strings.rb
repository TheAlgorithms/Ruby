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
# Approach: Using Recursion + Memoization, Top Down Dynamic Programming
#

#
# Algorithm: Dynamic Programming state transition.
#
# F(0) = 1
# F(n)a = F(n-1)a + F(n-1)e + F(n-1)i + F(n-1)o +F(n-1)u
# F(n)e = F(n-1)e + F(n-1)i + F(n-1)o + F(n-1)u
# F(n)i = F(n-1)i + F(n-1)o +F(n-1)u
# F(n)o = F(n-1)o + F(n-1)u
# F(n)u = F(n-1)u
#

# @param {Integer} n
# @return {Integer}

def count_vowel_strings(n, letter = 'a')
  return 1 if n < 1

  @h ||= {}
  key = [n, letter]
  return @h[key] if @h[key]

  result = case letter
           when 'a'
             count_vowel_strings(n - 1, letter = 'a') +
             count_vowel_strings(n - 1, letter = 'e') +
             count_vowel_strings(n - 1, letter = 'i') +
             count_vowel_strings(n - 1, letter = 'o') +
             count_vowel_strings(n - 1, letter = 'u')
           when 'e'
             count_vowel_strings(n - 1, letter = 'e') +
             count_vowel_strings(n - 1, letter = 'i') +
             count_vowel_strings(n - 1, letter = 'o') +
             count_vowel_strings(n - 1, letter = 'u')
           when 'i'
             count_vowel_strings(n - 1, letter = 'i') +
             count_vowel_strings(n - 1, letter = 'o') +
             count_vowel_strings(n - 1, letter = 'u')
           when 'o'
             count_vowel_strings(n - 1, letter = 'o') +
             count_vowel_strings(n - 1, letter = 'u')
           when 'u'
             count_vowel_strings(n - 1, letter = 'u')
           end

  @h[key] = result
  @h[key]
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
