# frozen_string_literal: true

# Problem 22
# Using names.txt (right click and 'Save Link/Target As...'),
# a 46K text file containing over five-thousand first names,
# begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order,
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53,
# is the 938th name in the list. So, COLIN would obtain a score of 938 * 53 = 49714.

# What is the total of all the name scores in the file?

# reading the contents of the file
file_contents = File.read('p022_names.txt')

# replacing the occuerance of \" to '' and spliting the result by ','
# to get an array of sorted words
words = file_contents.tr('\"', '').split(',').sort

# this method calculates the worth of a word based on the ASCII
# values of the characters
def word_worth(word)
  word.chars.sum { |char| char.ord - 'A'.ord + 1 }
end

# this method takes the words as an input
# calls `word_worth` method on each word
# to that value multiply that with the index of the word in the array
# add the same to the result
def total_rank(words)
  result = 0
  words.each_with_index { |word, index| result += word_worth(word) * (index + 1) }
  result
end

# outputs total rank on the console
puts total_rank(words)
