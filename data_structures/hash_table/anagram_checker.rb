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
# Approach: Hash table
#

# Complexity analysis:
#
# Time complexity: O(n). Time complexity is O(n) since accessing the counter
# table is a constant time operation.
# Space complexity: O(1). Although we do use extra space,
# the space complexity is O(1) because the table's size stays constant no
# matter how large n is.
#
def is_anagram(s, t)
  s_length = s.length
  t_length = t.length
  counter = Hash.new(0)

  return false unless s_length == t_length

  (0...s_length).each do |i|
    counter[s[i]] += 1
    counter[t[i]] -= 1
  end

  counter.each do |_k, v|
    return false unless v == 0
  end

  true
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

#
# Approach 2: Hash table
#

# Algorithm: we could also first increment the counter for s,
# then decrement the counter for t. If at any point the counter
# drops below zero, we know that t contains an extra letter,
# not in s, and return false immediately.

# Complexity analysis:
#
# Time complexity: O(n).
# Space complexity: O(1).
#

def is_anagram(s, t)
  s_length = s.length
  t_length = t.length
  counter = Hash.new(0)

  return false unless s_length == t_length

  (0...s_length).each do |i|
    counter[s[i]] += 1
  end

  (0...s_length).each do |i|
    counter[t[i]] -= 1

    return false if counter[t[i]] < 0
  end

  true
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

#
# Approach 3: populate 2 hashes and compare them
#

def is_anagram(s, t)
  s = s.chars
  t = t.chars

  return false if s.count != t.count

  hash1 = {}
  s.each do |value|
    hash1[value] = if hash1[value]
                     hash1[value] + 1
                   else
                     1
                   end
  end

  hash2 = {}
  t.each do |value|
    hash2[value] = if hash2[value]
                     hash2[value] + 1
                   else
                     1
                   end
  end

  hash1.keys.each do |key|
    return false if hash2[key] != hash1[key]
  end

  true
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
