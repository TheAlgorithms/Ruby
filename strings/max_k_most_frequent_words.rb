require_relative '../data_structures/heaps/max_heap'

##
# This class represents a word count information
# (i.e. how many occurrences for a word).

class WordCount
  include Comparable

  attr_reader :word
  attr_reader :occurrences

  def <=>(other)
    occurrences <=> other.occurrences
  end

  def initialize(word, occurrences)
    @word = word
    @occurrences = occurrences
  end
end

##
# Returns the `k` most frequently occurring words, in non-increasing order of occurrence.
# In this context, a word is defined as an element in the provided list.
#
# In case `k` is greater than the number of distinct words, a value of `k` equal
# to the number of distinct words will be considered, instead.

def max_k_most_frequent_words(words, k)
  count_by_word = words.tally
  heap = MaxHeap.new(count_by_word.map { |w, c| WordCount.new(w, c) })
  most_frequent_words = []
  [k, count_by_word.size].min.times { most_frequent_words.append(heap.extract_max.word) }
  most_frequent_words
end