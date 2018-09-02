module Roman_num
  def to_roman
    roman_numeral = []
    swap = {1=>'I', 5=>'V', 10=>'X', 50=>'L', 100=>'C', 500=>'D', 1000=>'M'}
    number=self.to_s.split(//).map{|char| char.to_i}
    length_of_number = number.length-1
    (0..number.length-1).each do |i|
      number_separate = number[i]
      reminder = number_separate % 5
      a = 10**length_of_number
      if number_separate == 9
        roman_numeral[i] = swap[a] + swap[(10**(length_of_number + 1))]
      elsif number_separate > 4
        roman_numeral[i] = swap[5*a] + (swap[a] * reminder)
      elsif number_separate < 4
        roman_numeral[i] = swap[a] * reminder
      else
        roman_numeral[i] = swap[a] + swap[5 * a]
      end
      length_of_number -= 1
    end
    roman_numeral.join
  end
end	
class Integer
  include Roman_num
end
module BookKeeping
  VERSION = 2
end