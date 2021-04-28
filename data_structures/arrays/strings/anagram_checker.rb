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

#
# Approach: Sort and Compare
#
# Complexity analysis:
#
# Time Complexity: O(n log n). Assume that n is the length of s, sorting costs O(n log n), and comparing two strings costs O(n). Sorting time dominates and the overall time complexity is O(n log n).
# Space Complexity: O(1). Space depends on the sorting implementation which, usually, costs O(1) auxiliary space if heapsort is used.
#
def is_anagram(s, t)
  return false if s.length != t.length

  arr1 = s.split('').sort
  arr2 = t.split('').sort

  arr1 == arr2
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
