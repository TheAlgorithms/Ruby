def linear_search(list, item)
	for i in 0...list.length
		return i if list[i] == item
	end

	return -1
end

puts "Enter a comma separated list of integers:"
input = gets.chomp.split(",")

puts "Enter the integer to search for:"
item = gets.chomp

print "The item is in index: "
puts linear_search(input, item)