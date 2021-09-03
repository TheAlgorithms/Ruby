# Challenge name: Uncommon words from two sentences
#
# We are given two sentences A and B.
# (A sentence is a string of space separated words.
# Each word consists only of lowercase letters.)
#
# A word is uncommon if it appears exactly once in one of the sentences,
# and does not appear in the other sentence.
#
# Return a list of all uncommon words.
# You may return the list in any order.
#
# Example 1:
# Input: A = "this apple is sweet", B = "this apple is sour"
# Output: ["sweet","sour"]
#
# Example 2:
# Input: A = "apple apple", B = "banana"
# Output: ["banana"]

#
# Approach 1: Hash
#
# Time Complexitiy: O(n)

def find_uncommon_words(strA, strB)
  array = strA.concat(' ', strB).split(' ')
  hash = Hash.new(0)
  result = []

  array.each do |word|
    hash[word] += 1
  end

  hash.each do |k, v|
    result.push(k) if v < 2
  end

  result
end

puts find_uncommon_words('this apple is sweet', 'this apple is sour')
# => ["sweet", "sour"]

puts find_uncommon_words('apple apple', 'banana')
# => ["banana"]
