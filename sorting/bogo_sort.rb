class Array
  def sorted?
    ### goes thru array and checks if all elements are in order
    (1...length).each do |i|
      return false if self[i - 1] > self[i]
    end
    true
  end

  def bogosort
    ### randomly shuffles until sorted
    shuffle! until sorted?
    self # return sorted array
  end
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'
  str = gets.chomp.split('')
  puts str.bogosort.join('')
end
