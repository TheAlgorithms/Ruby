class GnomeSort
  def self.sort!(arr)
    i, j = 1, 2
    while i < arr.length
      if arr[i-1] <= arr[i]
        i, j = j, j+1
      else
        arr[i-1], arr[i] = arr[i], arr[i-1]
        i -= 1 if i > 1
      end
    end
    arr
  end
end

puts "Enter a list of numbers separated by spaces"

str = gets.chomp
numbers = str.split(" ").map(&:to_i)
GnomeSort.sort!(numbers)
puts numbers