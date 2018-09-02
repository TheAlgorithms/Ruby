require 'prime'

module BookKeeping
	VERSION=2
end

class Raindrops
	def self.convert(number)
		b=[]
		j=0
		swap={3=>'Pling',5=>'Plang',7=>'Plong'}
		div=number.prime_division
		div=div.flatten.uniq
		return number.to_s unless div.any? {|x| [3,5,7].include? (x)}
		div.size.times do |i|
	      if swap.include? div[i]
	     	b[j] = swap[div[i]]
	     	j+=1
	      end
	    end
	    b.join
	 end
end
