# Challenge name: Intersection of two arrays ii
#
# Given two arrays, write a function to compute their intersection.
#
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}

#
# Approach 1: Brute Force
#
# Time Complexity: O(n^2)
#
def intersect(arr1, arr2)
  result = []

  if arr1.length < arr2.length
    shorter = arr1
    longer = arr2
  else
    shorter = arr2
    longer = arr1
  end

  shorter.each do |matcher|
    longer.each do |number|
      next if number != matcher

      result.push(number)
      break
    end
  end

  result
end

nums1 = [1, 2, 2, 1]
nums2 = [2, 2]
puts intersect(nums1, nums2)
# => [2,2]

nums1 = [4, 9, 5]
nums2 = [9, 4, 9, 8, 4]
puts intersect(nums1, nums2)
# => [4,9]

#
# Approach 2: Hash
#
# Complexity Analysis
#
# Time Complexity: O(n+m), where n and m are the lengths of the arrays.
# We iterate through the first, and then through the second array; insert
# and lookup operations in the hash map take a constant time.
#
# Space Complexity: O(min(n,m)). We use hash map to store numbers (and their
# counts) from the smaller array.
#
def intersect(arr1, arr2)
  result = []

  hash = Hash.new(0)

  arr2.each { |num| hash[num] += 1 }

  arr1.each do |num|
    if hash.has_key?(num)
      result << num if hash[num] >= 1
      hash[num] -= 1
    end
  end

  result
end

nums1 = [1, 2, 2, 1]
nums2 = [2, 2]
puts intersect(nums1, nums2)
# => [2,2]

nums1 = [4, 9, 5]
nums2 = [9, 4, 9, 8, 4]
puts intersect(nums1, nums2)
# => [4,9]

#
# Approach 3: Two Pointers
#
# Complexity analysis:

# Time Complexity: O(nlogn + mlogm), where n and m are the lengths of the arrays. We sort two arrays independently and then do a linear scan.
# Space Complexity: from O(logn+logm) to O(n+m), depending on the implementation of the sorting algorithm.
#
def intersect(nums1, nums2)
  result = []
  p1 = 0
  p2 = 0
  nums1 = nums1.sort
  nums2 = nums2.sort
  while p1 < nums1.length && p2 < nums2.length
    if nums1[p1] < nums2[p2]
      p1 += 1
    elsif nums1[p1] > nums2[p2]
      p2 += 1
    elsif nums1[p1] == nums2[p2]
      result << nums1[p1]
      p1 += 1
      p2 += 1
    end
  end

  result
end
nums1 = [1, 2, 2, 1]
nums2 = [2, 2]
intersect(nums1, nums2)

nums1 = [1, 2, 2, 1]
nums2 = [2, 2]
puts intersect(nums1, nums2)
# => [2,2]

nums1 = [4, 9, 5]
nums2 = [9, 4, 9, 8, 4]
puts intersect(nums1, nums2)
# => [4,9]
