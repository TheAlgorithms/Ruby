module BookKeeping
  VERSION=2
end

class Pangram
  def self.is_pangram? (string)
    string
    .downcase
    .tr('^a-zA-z','')
    .tr('_','')
    .split(//)
    .uniq.size==26
  end
 end