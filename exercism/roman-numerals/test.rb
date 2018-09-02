swap={1=>'I',5=>'V',10=>'X',50=>'L',100=>'C',500=>'D',1000=>'M'}
n=27;
n=n.to_s.split(//).map{|char| char.to_i}
len=n.length-1
(0..n.length-1).each do |i|
	num=n[i]
	rem=num%5
	a=10**len
	if num==9
		puts swap[a]
		puts swap[(10**(len+1))]
	elsif num>4
		puts swap[5*a]
		puts swap[a]*rem unless rem==0
	elsif num<4
		puts swap[a]*rem
	else
		puts swap[a]
		puts swap[5*a]
	end
	len-=1
end	