# Given three integer arrays arr1, arr2 and arr3 sorted in strictly increasing order, return a sorted array of only the integers that appeared in all three arrays.
#
# Example 1:
#
# Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
# Output: [1,5]
# Explanation: Only 1 and 5 appeared in the three arrays.
#
# Example 2:
#
# Input: arr1 = [197,418,523,876,1356], arr2 = [501,880,1593,1710,1870], arr3 = [521,682,1337,1395,1764]
# Output: []
#
#

#
# Approach: Hash table
#

# Complexity Analysis

# Time Complexity: O(n) - n is the total length of
# all of the input arrays.
# Space Complexity: O(n) - n is the total length of all of the
# input arrays. This is because we adopted a Hash table to store all
# numbers and their number of appearances as values.

def arrays_intersection(arr1, arr2, arr3)
  hash = Hash.new(0)

  add_to_hash(arr1, hash)
  add_to_hash(arr2, hash)
  add_to_hash(arr3, hash)

  hash.select { |_key, value| value == 3 }.keys
end

def add_to_hash(arr, hash)
  arr.count.times do |pointer|
    value = arr[pointer]
    hash[value] += 1
  end
end

arr1 = [1, 2, 3, 4, 5]
arr2 = [1, 2, 5, 7, 9]
arr3 = [1, 3, 4, 5, 8]
print arrays_intersection(arr1, arr2, arr3)
# Output: [1,5]
# Explanation: Only 1 and 5 appeared in the three arrays.

arr1 = [197, 418, 523, 876, 1356]
arr2 = [501, 880, 1593, 1710, 1870]
arr3 = [521, 682, 1337, 1395, 1764]
print arrays_intersection(arr1, arr2, arr3)
# Output: []
