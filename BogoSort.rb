class Array
	def sorted?
		### goes thru array and checks if all elements are in order
		for i in 1...self.length
			return false if self[i-1] > self[i]
		end
		return true
	end
	def bogosort
		### randomly shuffles until sorted
		self.shuffle! until self.sorted?
		return self #return sorted array
	end
end

puts "Enter a list of numbers seprated by space"
str = gets.chomp.split('')
puts str.bogosort.join('')
