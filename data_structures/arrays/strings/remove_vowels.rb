# Challenge name: Remove vowels from a string
#
# Given a string s, remove the vowels 'a', 'e', 'i', 'o', and 'u'
# from it, and return the new string.
#
# Example 1:
# Input: s = "leetcodeisacommunityforcoders"
# Output: "ltcdscmmntyfrcdrs"
#
# Example 2:
# Input: s = "aeiou"
# Output: ""
#
# @param {String} s
# @return {String}

#
# Approach 1: Brute Force
#
# Time Complexity: O(n)
#

def remove_vowels(s)
  result_array = []
  s.downcase!
  start_array = s.split('')

  start_array.each do |letter|
    result_array.push(letter) if letter != 'a' && letter != 'e' && letter != 'i' && letter != 'o' && letter != 'u'
  end

  result_array.join('')
end

s = 'leetcodeisacommunityforcoders'
puts(remove_vowels(s))
# => "ltcdscmmntyfrcdrs"
s = 'aeiou'
puts(remove_vowels(s))
# => ""

#
# Approach 2: Regex
#
# Time Complexity: O(n)
#
def remove_vowels(s)
  vowels = /[aeiou]/i
  s.gsub!(vowels, '')
  s
end

s = 'leetcodeisacommunityforcoders'
puts(remove_vowels(s))
# => "ltcdscmmntyfrcdrs"
s = 'aeiou'
puts(remove_vowels(s))
# => ""

#
# Approach 3: Using Ruby .delete() method
#
# Time Complexity: O(n)
#
def remove_vowels(s)
  s.downcase.delete('aeiou')
end

s = 'leetcodeisacommunityforcoders'
puts(remove_vowels(s))
# => "ltcdscmmntyfrcdrs"
s = 'aeiou'
puts(remove_vowels(s))
# => ""
