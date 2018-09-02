#Using hashes.

class Anagram
  def initialize(word)
    @word=word.downcase
  end
  def match (anagram_words)
    array=[]
    anagram_words.each do |value|
      hash1=Hash.new(0)
      hash2=Hash.new(0)
      value.size.times do |i|
        hash1[@word[i]]+=1 unless @word[i]==nil
        hash2[value[i].downcase]+=1
      end
      array.push(value) if hash2==hash1 && @word.casecmp(value)!=0
    end
    array
  	end
end