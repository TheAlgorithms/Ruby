# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    #return if length too short
    return [] if nums.length < 3
    
    #sort nums, init ans array
    nums, ans = nums.sort, []
    
    #loop through nums
    nums.each_with_index do |val, ind|
      #if the previous value is the same as current, then skip this iteration as it would create duplicates
      next if ind > 0 && nums[ind] == nums[ind - 1]
      
      #init & run two pointer search
      left, right = ind + 1, nums.length - 1
      
      while left < right
        #find current sum
        sum = val + nums[left] + nums[right]
        
        #decrease sum if it's too great, increase sum if it's too low
        if sum > 0
          right -= 1
        elsif sum < 0
          left += 1
        #if it's zero, then add the answer to array and set left pointer to next valid value
        else
          ans << [val, nums[left], nums[right]]
            
          left += 1
            
          while nums[left] == nums[left - 1] && left < right
            left += 1
          end
        end
      end
    end
    
    #return answer
    ans
end