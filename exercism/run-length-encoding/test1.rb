a='2b23233c4d'
p=[]
a.scan(/\d*\D{1}/).each do |segment|
  p.push(segment)
  puts '------'
end
puts p