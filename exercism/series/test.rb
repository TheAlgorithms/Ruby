a='123456789'
s=4
j=a.length-s
(0..j).each do |k|
	b=''
	(k..k+s-1).each do |i|
		b+=a[i]
	end
	puts b
	puts'----'
end