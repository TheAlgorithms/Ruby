class Phrase
  def initialize (sentence)
    @word_split=sentence.downcase.tr('^a-zA-z1-9',' ')
    @word_split=@word_split.tr('^',' ').split(' ')
  end
  def word_count
    @word_split.size.times do |index|
      if @word_split[index] == 't'
        @word_split.delete_at(index)
        @word_split[index-1]+='\'t'
      end
    end
    word_count_hash = Hash.new(0)
    @word_split.each do |each_word|
      word_count_hash[each_word] += 1
    end
    word_count_hash
  end
end