# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    profit, ind = 0, 1
    
    while prices[ind]
      if prices[ind] > prices[ind - 1]
        profit += prices[ind] - prices[ind - 1]
      end
      
      ind += 1
    end
        
    profit
end