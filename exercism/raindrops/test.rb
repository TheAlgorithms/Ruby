require 'prime'
b=[]
j=0
number = 25
swap={3=>'Pling',5=>'Plong',7=>'Plang'}
a=number.prime_division
a=a.flatten.uniq
puts a
puts number.to_s unless a.any? {|x| [3,5,7].include? (x)}
#a.size.times do |i|
#	if swap.include? a[i]
#	  b[j] = swap[a[i]]
#	  j+=1
#	end
#end
#puts b.join