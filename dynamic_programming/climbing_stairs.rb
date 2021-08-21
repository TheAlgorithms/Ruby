# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    memo = Hash.new
    
    memo[0] = 1
    memo[1] = 1
    
    return memo[n] if n <= 1 && n >= 0
    
    (2..n).each do |n|
      recurse(n, memo)
    end
    
    memo[n]
end


def recurse(n, memo)
    return memo[n] if memo[n]
    
    memo[n] = recurse(n - 1, memo) + recurse(n - 2, memo)
end