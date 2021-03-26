# Challenge name: Is anagram
#
# Given two strings s and t , write a function to determine
# if t is an anagram of s.
#
# Note:
# You may assume the string contains only lowercase alphabets.
#
# Follow up:
# What if the inputs contain unicode characters?
# How would you adapt your solution to such case?
#
# @param {String} s
# @param {String} t
# @return {Boolean}

def is_anagram(s, t)
end

s = 'anagram'
t = 'nagaram'
puts(is_anagram(s, t))
# => true
s = 'rat'
t = 'car'
puts(is_anagram(s, t))
# => false
s = 'a'
t = 'ab'
puts(is_anagram(s, t))
# => false