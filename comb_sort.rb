def comb_sort(ary, shrink = 1.3)
  gap = ary.length
  f_shrink = shrink.to_f
  swapped = true

  until (gap == 1) && !swapped
    gap = (gap / f_shrink).floor
    gap = 1 if gap < 1
    swapped = false

    gap.upto(ary.size - 1) do |i|
      if ary[i - gap] > ary[i]
        ary[i - gap], ary[i] = ary[i], ary[i - gap]
        swapped = true
      end
    end
  end
end

array_length = 10
arr = Array.new(array_length) { rand(array_length) }

puts "Original array: #{arr.inspect}"
comb_sort(arr)
puts "Array is sorted? #{arr == arr.sort}"
puts "Sorted array is: #{arr.inspect}"
