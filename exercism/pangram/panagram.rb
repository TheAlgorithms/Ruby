class Pangram
  def self.is_pangram? (string)
    count=string.each.count do |string_separate|
    	string_separate=~/[a-zA-z]/
    end
    return false unless count==string.length
   end
  end