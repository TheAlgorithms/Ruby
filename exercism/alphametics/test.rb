a='g+b==bd'
count=0
z=a.scan(/\w/).uniq
b=a.scan(/\w+/)
l=b.length
c=a.scan(/[[\=\=]*\+*\*]+/)
swap=Hash.new(0)
(0..9).to_a.repeated_permutation(3).each do |i|
	z.size.times do |index|
		swap[z[index]]=i[index]
	end
	e=''
	b[2].chars.each do |i|
		e+=swap[i].to_s
	end
	e=e.to_i
	e1=swap[b[0]]
	e2=swap[b[1]]
	if c[0]=='+'
		d = e1+e2==e
	end
	puts swap,'----' if d==true
end