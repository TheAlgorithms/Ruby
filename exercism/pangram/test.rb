j=0
a=(2..10).to_a
(0..3).each do |i|
	j+=1 unless a[j]!=0
	small = a[j+1]
	a.size.times do |index|
		if a[index]%small==0
			a[index]=0
		end
	end
end
puts a