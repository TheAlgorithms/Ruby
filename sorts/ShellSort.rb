def shell_sort(array)
  jump = array.length / 2
  while jump > 0
    i = 0
    loop do
      break if (i+jump) >= array.length
      array[i], array[i+jump] = array[i+jump], array[i] if array[i] > array[i+jump]
      i += 1
    end
    jump /= 2
  end

  array
end
puts "Enter a list of numbers seprated by space"

list = gets
bubble_sort(list)
print list
