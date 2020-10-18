# frozen_string_literal: true

# reading the contents of the file
file_contents = File.open('p022_names.txt', 'r').read

# replacing the occuerance of \" to '' and spliting the result by ','
# to get an array of sorted words
words = file_contents.tr('\"', '').split(',').sort

# this method calculates the worth of a word based on the ASCII
# values of the characters
def word_worth(word)
  word.split('').inject(0) { |result, char| result + char.ord - 'A'.ord + 1 }
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
