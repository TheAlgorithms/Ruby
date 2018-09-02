class Scrabble
  LETTER_VALUES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }
  def initialize(word)
    @word = (word || '').gsub(/\W/, '').upcase
  end

  def self.score(word)
    new(word).score
  end

  def score
    @word.each_char.reduce(0) do |acc, val|
      acc + map_char(val)
    end
  end

  def map_char(val)
    LETTER_VALUES.each do |key, values|
      return key if values.include?(val)
    end
    0
  end
end
