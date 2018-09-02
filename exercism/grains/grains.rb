class Grains
	def self.square(number_grains)
		2**(number_grains-1)
	end
	def self.total
		square(64)*2-1
	end
end