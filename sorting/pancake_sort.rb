def pancake_sort(array)
  return array if array.length <= 1

  (array.length - 1).downto(1) do |index|
    max_index = array[0..index].index(array[0..index].max)
    next if max_index == index

    array[0..max_index] = array[0..max_index].reverse if max_index > 0
    array[0..index] = array[0..index].reverse
  end
  array
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p pancake_sort(list)
end
