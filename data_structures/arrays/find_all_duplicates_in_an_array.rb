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

require 'benchmark'

array = [4, 3, 2, 7, 8, 2, 3, 1]
long_array = [4, 3, 2, 7, 8, 2, 3, 1] * 100

#
# Approach 1: Brute force
#

#
# Complexity Analysis
#
# Time complexity: O(n^2) average case.
#

def find_duplicates(array)
  current_num = array[0]
  result_array = []

  array.count.times do |i|
    array.count.times do |j|
      next if i == j || current_num != array[j]

      result_array.push(current_num)
    end

    current_num = array[i + 1]
  end

  result_array.uniq
end

Benchmark.bmbm do |x|
  x.report('execute algorithm 1') do
    print(find_duplicates(array))
    print(find_duplicates(long_array))
  end
end

#
# Approach 2: Sort and Compare Adjacent Elements
#

# Intuition

# After sorting a list of elements, all elements of equivalent value get placed together.
# Thus, when you sort an array, equivalent elements form contiguous blocks.

#
# Complexity Analysis
#
# Time complexity: O(n log n)
#

def find_duplicates(array)
  sorted_array = array.sort
  result_array = []

  (1..sorted_array.count).each do |i|
    next if sorted_array[i] != sorted_array[i - 1]

    result_array.push(sorted_array[i])
  end

  result_array.uniq
end

Benchmark.bmbm do |x|
  x.report('execute algorithm 2') do
    print(find_duplicates(array))
    print(find_duplicates(long_array))
  end
end
