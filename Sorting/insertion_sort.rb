def insertion_sort(array)
  0.upto(array.length - 1).each do |index|
    element = array[index]
    position = index
    while element < array[position - 1] && position > 0
      array[position] = array[position - 1]
      array[position - 1] = element
      position -= 1
    end
  end
  array
end
puts "Enter a list of numbers seprated by space"

list = gets 
insertion_sort(list)
print list