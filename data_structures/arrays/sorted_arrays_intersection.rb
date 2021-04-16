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
# Approach: Two-pointers
#

# Complexity Analysis
#
# Time Complexity: O(n), where n is the total length of all of the
# input arrays.
# Space Complexity: O(1), as we only initiate three integer variables
# using constant space.

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @param {Integer[]} arr3
# @return {Integer[]}
def sorted_arrays_intersection(arr1, arr2, arr3)
  result = []

  # prepare three pointers to iterate through three arrays
  # p1, p2, and p3 point to the beginning of arr1, arr2, and arr3 accordingly
  p1 = p2 = p3 = 0

  while (p1 < arr1.count) && (p2 < arr2.count) && (p3 < arr3.count)
    if arr1[p1] == arr2[p2] && arr1[p1] == arr3[p3]
      result.push(arr1[p1])

      p1 += 1
      p2 += 1
      p3 += 1
    elsif arr1[p1] < arr2[p2]
      p1 += 1
    elsif arr2[p2] < arr3[p3]
      p2 += 1
    else
      p3 += 1
    end
  end

  result
end

arr1 = [1, 2, 3, 4, 5]
arr2 = [1, 2, 5, 7, 9]
arr3 = [1, 3, 4, 5, 8]
print(sorted_arrays_intersection(arr1, arr2, arr3))
# Output: [1,5]

arr1 = [197, 418, 523, 876, 1356]
arr2 = [501, 880, 1593, 1710, 1870]
arr3 = [521, 682, 1337, 1395, 1764]
print(sorted_arrays_intersection(arr1, arr2, arr3))
# Output: []
