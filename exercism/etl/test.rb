b={}
a={1=>%w(a c d e f g),2=>['b']}
a.each do |(n,c)|
	c.each_with_object(	{}) {|i,b| puts b[i]=n;puts b}
	puts'------'
end