# Find All Duplicates in an Array
#
# Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array),
# some elements appear twice and others appear once.
#
# Find all the elements that appear twice in this array.
#
# Could you do it without extra space and in O(n) runtime?
#
# Example:
# Input:
# [4,3,2,7,8,2,3,1]
#
# Output:
# [2,3]

def find_duplicates(array) 
  current_num = array[0]
  result_array = []
  array.each_with_index do |num, i|
    array.each_with_index do |num, j|
      if i != j && current_num == array[j]
        result_array.push(current_num)
      end
    end
    current_num = array[i+1]
  end
  result_array.uniq
end

array = [4,3,2,7,8,2,3,1]
long_array = [4,3,2,7,8,2,3,1]*100

require 'benchmark'
Benchmark.bmbm do |x|
  x.report('execute algorithm') do
    print find_duplicates(long_array)
  end
end

def find_duplicates_2(array) 
  sorted_array = array.sort
  result_array = []

  (1..sorted_array.count).each do |i|
    if sorted_array[i] == sorted_array[i-1]
      result_array.push(sorted_array[i])
    end
  end
  result_array.uniq
end

require 'benchmark'
Benchmark.bmbm do |x|
  x.report('execute algorithm') do
    print find_duplicates_2(long_array)
  end
end