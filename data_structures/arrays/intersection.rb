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
# Time Complexity: O(n)
#
def intersect(arr1, arr2)
  result = []

  hash = Hash.new(0)

  arr2.each {|num| hash[num] += 1 }

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