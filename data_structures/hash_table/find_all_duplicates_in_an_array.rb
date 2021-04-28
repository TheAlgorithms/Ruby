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
# Approach: Hash table
#

#
# Complexity Analysis
#
# Time complexity: O(n) average case.
#

def find_duplicates(array)
  result_hash = {}
  result_array = []

  # loop through array and build a hash with counters
  # where the key is the array element and the counter is the value
  # increase counter when duplicate is found
  array.each do |num|
    if result_hash[num].nil?
      result_hash[num] = 1
    else
      result_hash[num] += 1
    end
  end

  # loop through hash and look for values > 1
  result_hash.each do |k, v|
    result_array.push(k) if v > 1
  end

  # return keys
  result_array
end

Benchmark.bmbm do |x|
  x.report('execute algorithm 3') do
    print(find_duplicates(array))
    print(find_duplicates(long_array))
  end
end
