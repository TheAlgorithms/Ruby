def merge_sort(array)
  return array if array.length <= 1
  mid = array.length / 2
  first_array = array.slice(0..mid - 1)
  second_array = array.slice(mid..-1)

  first_array = merge_sort first_array
  second_array = merge_sort second_array

  # merge
  result = []
  until first_array.empty? and second_array.empty?
    if first_array.empty?
      result.concat(second_array)
      second_array.clear
    elsif second_array.empty?
      result.concat(first_array)
      first_array.clear
    else
      if first_array.first < second_array.first
        result << first_array.shift
      else
        result << second_array.shift
      end
    end
  end
  result
end

puts "Enter a list of numbers separated by space"
list = gets
print merge_sort list.split(" ").map(&:to_i)
