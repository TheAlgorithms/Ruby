class Acronym
  def self.abbreviate(word)
    word.gsub(/([a-z])([A-Z])/,'\1 \2')
    .scan(/\w+/).map{|i|i[0].upcase}.join
  end
end
