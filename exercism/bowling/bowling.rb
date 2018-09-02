class Game
	def initialize
		@array=[]
	end
	def roll(pins)
		@array.push(pins)
	end
	def score
		@array.map do |i|
			+i
		end.reduce(:+)
	end
end