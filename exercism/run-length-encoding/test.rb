a='gwwwwfffffffffrrrrrr'
a.chars.chunk(&:ord).map { |_, group| group }.each do |group|
	puts group
	puts'----'
end