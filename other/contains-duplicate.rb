# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    return false if nums.length == 1
    
    nums_hash = Hash.new
    
    nums.each do |num|
      nums_hash[num] ? (return true) : nums_hash[num] = "added"
    end
    
    false
end