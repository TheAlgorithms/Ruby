class Array
  def sorted?
    ### goes thru array and checks if all elements are in order
    for i in 1...self.length
      return false if self[i-1] > self[i]
    end
    return true
  end
  def bogosort
    ### randomly shuffles until sorted
    self.shuffle! until self.sorted?
    return self #return sorted array
  end
end

if $0 == __FILE__
  puts "Enter a list of numbers separated by space"
  str = gets.chomp.split('')
  puts str.bogosort.join('')
end
