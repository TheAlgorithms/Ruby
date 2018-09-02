a=10000
sum=0
b=[43,47]
c=[]
b.each do |x|
	(x..a-1).step(x) do |i|
		sum+=i unless c.include? i
		c.push(i) unless c.include? i
	end
end
puts sum