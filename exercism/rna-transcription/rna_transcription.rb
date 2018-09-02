class Complement
	def self.of_dna(a)
		swap={'C'=>'G','G'=>'C','T'=>'A','A'=>'U'}
		a.size.times do |i|
			return '' unless swap.include? a[i]
			a[i]=swap[a[i]]
		end
		a
	end
end