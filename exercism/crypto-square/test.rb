a='abcdefghijklmnopqrstuvwxyz'
b=a.scan(/.{2,3}/)
puts '--------------'
d=b.slice!(0).split(//)
puts b
puts'-------------------------'
b.each do |i|
	d=d.zip(i.split(//))
end
c=[]
d.each do |i|
	c.push(i.join)
end
puts c.join(' ')