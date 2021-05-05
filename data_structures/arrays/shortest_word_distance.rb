# Shortest Word Distance
# Given a list of words and two words word1 and word2,
# return the shortest distance between these two words in the list.
# @param {String[]} words
# @param {String} word1
# @param {String} word2
# @return {Integer}

def shortest_distance(words, word1, word2)
  return 0 if word1 == word2
  return 0 unless words.include?(word1) && words.include?(word2)

  minimum_distance = words.length
  words.each_with_index do |outer_value, outer_index|
    words.each_with_index do |inner_value, inner_index|
      if ((inner_value == word1 && outer_value == word2) || (inner_value == word2 && outer_value == word1)) && (minimum_distance > (outer_index - inner_index).abs)
        minimum_distance = (outer_index - inner_index).abs
      end
    end
  end
  minimum_distance
end

words = %w[practice makes perfect coding makes]
word1 = 'coding'
word2 = 'practice'
puts(shortest_distance(words, word1, word2))
# Output: 3
words = %w[practice makes perfect coding makes]
word1 = 'makes'
word2 = 'coding'
puts(shortest_distance(words, word1, word2))
# Output: 1
