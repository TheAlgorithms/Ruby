a=(2..300).to_a
j=-1
(0..a.length/4).each do |i|
	if a[i]==0
		j+=1
	else
	j+=1 
		small = a[j]
		(j+1..a.length-1).each do |index|
			a[index]=0 if a[index]%small==0	
		end
	end
end
a.uniq
a-=[0]
puts a.length