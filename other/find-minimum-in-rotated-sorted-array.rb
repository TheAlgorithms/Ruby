# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
    return nums[0] if nums.length == 1
    
    left, right = 0, nums.length - 1
    
    while left < right
      mid = (left + right) / 2
        
      if nums[mid] > nums[right]
        left = mid + 1
      else
        right = mid
      end
    end
    
    nums[left]
end