sum=0
sum1=0
n=(1..5).each.count do |i|
			sum+=i**2
			sum1+=i
		end
		puts sum1
		puts sum
		puts (sum1**2)-sum