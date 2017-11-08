def merge_sort user_input
  if user_input.length <= 1
    user_input
  else
    mid = (user_input.length / 2).floor
    left = merge_sort(user_input[0..mid - 1])
    right = merge_sort(user_input[mid..user_input.length])
    merge(left, right)
  end 
end 

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end 
user_input = Array.new
puts "Enter the total numbers" 
$n = gets.to_i  #converting user input to integer to funtion properly.

puts "Enter the no. one bye one "

$n.times do
	user_input << gets.to_i #taking user input and saving in "user_input" Array.
end

puts "After sorting #{merge_sort(user_input)}"
