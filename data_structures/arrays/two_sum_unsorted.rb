# Given an unsorted array of integer numbers, find two numbers such that they add up to a specific target number.

# Return the indices of the two numbers (1-indexed) as an integer array answer of size 2, where 1 <= answer[0] < answer[1] <= numbers.length.

# You may assume that each input would have exactly one solution and you may not use the same element twice.

#
# Approach 1: maintain a hash with difference of each number from target as the key.
# Say, the target is 9 and the two items in the array that sum to 9 are 2 and 7.
# When we encounter 2 while iterating through the array, we check if key 2 is present in the hash, if not we insert
# difference of target 9 and number 2, i.e, 7 and the index of 2 into the hash.
# When we reach 7 in the array, we'll find that key 7 is already present in the hash because it was added to the hash
# when we encountered 2. Thus we can return the index of 7 and the value of the matching key i.e, the index of 2 as the indices
# of the array elements that sum to the target number 9.

# Complexity analysis

# Time complexity: O(n). Each of the n elements is visited at
# most once, thus the time complexity is O(n).

# Space complexity: O(n). We use a hash with no more than n key-value pairs, thus the space complexity is O(n).

def two_sum(numbers, target)
    diff_hash = {}
    numbers.each_with_index do |number,i|
        if diff_hash[number] == nil
            diff_hash[target-number] = i+1
        else
            return [diff_hash[number],i+1]
            break
        end
    end
end
  
  nums = [7, 11, 2, 15]
  target = 9
  print(two_sum(nums, target),"\n")
  # => [1,3]
  
  nums = [3, -10, 4, 25, 2]
  target = 6
  print(two_sum(nums, target),"\n")
  # => [3,5]
  
  nums = [3,-1, 5, 0]
  target = -1
  print(two_sum(nums, target),"\n")
  # => [2,4]
