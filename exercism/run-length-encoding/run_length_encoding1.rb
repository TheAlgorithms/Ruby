class RunLengthEncoding
	def self.encode(input)
		encode_value=[]
		count=1
		small = input[0]
		input.size.times do |index|
			if input[index+1]==small
				count+=1
			else 
				encode_value.push(count.to_s) if count>1
				encode_value.push(small)
				small=input[index+1]
				count=1
			end
		end
		encode_value.join
	end
	def self.decode(input)
		decode_value=[]
		input.scan(/[0-9]+/) do |number|
			index=$~.offset(0)[0]
			decode_value.push(input[index-1]) if input[index-2].to_i == 0
			decode_value.push(input[index+number.length]*number.to_i)
		end
		length_input=input.length-1
		decode_value.push(input[length_input]) if input[length_input-1].to_i==0
		decode_value.join
	end
end