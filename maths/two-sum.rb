# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    nums_hash = Hash.new
    
    nums.each_with_index do |val, ind|
      complement = target - val
      return [ind, nums_hash[complement]] if nums_hash[complement]
      nums_hash[val] = ind
    end
end