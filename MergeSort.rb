def mergesort(arr) 
  return arr if arr.length <= 1 
  m = arr.length / 2 
  l = mergesort(arr[0...m])
  r = mergesort(arr[m...arr.length])
  merge(l, r)
end 

def merge(l, r) 
  aux = [] 

  until l.empty? || r.empty? 
    if l.first < r.first 
      aux << l.shift 
    else 
      aux << r.shift 
    end 
  end 

  aux.concat(l).concat(r)
end 

puts "Enter a list of numbers separated by spaces"
arr = gets.chomp.split.map(&:to_i)
puts "Sorted: #{mergesort(arr)}"