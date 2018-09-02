def calc(c,f)
	ans=f[0]
	(0..c.length-2).each do |i|
		ans=operation(ans,f[i+1],c[i])
	end
	return ans
end
def operation(a,b,c)
	case c
	when '+'
		return a+b
	when '-'
		return a-b
	when '*'
		return a*b
	when '/'
		return a/b
	when '^','**'
		return a**b
	end
end


a='IF * DR == DORI'
count=0
z=a.scan(/\w/).uniq
b=a.scan(/\w+/)
l=b.length
c=a.scan(/[[\=\=]*\+*\**\^]+/)
swap=Hash.new(0)
(0..9).to_a.permutation(z.length).each do |i|
	z.size.times do |index|
		swap[z[index]]=i[index]
	end
	f=[]
	b.each_with_index do |value,index|
		e=''
		value.chars.each do |bla|
			e += swap[bla].to_s
		end
		f.push(e.to_i) unless e[0]=='0'
	end
	ans=calc(c,f)
	puts swap if ans==f.last
end