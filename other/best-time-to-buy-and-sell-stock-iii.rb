# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    #find max profit for each day - forwards[]
    lowest_price, highest_profit = (10 ** 5) + 1, 0
    forwards = []
    
    prices.each do |price|
      lowest_price = price if price < lowest_price
      highest_profit = price - lowest_price if price - lowest_price > highest_profit
      forwards << highest_profit
    end
    
    #find max profit for each day in reverse - backwards[]
    highest_price, highest_profit = -1, 0
    backwards = []
    
    prices.each_with_index do |price, ind|
      highest_price = prices[prices.length - 1 - ind] if prices[prices.length - 1 - ind] > highest_price
      profit = highest_price - prices[prices.length - 1 - ind]
      highest_profit = profit if profit > highest_profit
      
      backwards[prices.length - 1 - ind] = highest_profit
    end
    
    #find highest total - iterate through forwards[] as ind, and backwards[] as ind + 1
    highest_total = 0
    
    prices.each_with_index do |price, ind|
      if ind < prices.length - 2
        highest_total = forwards[ind] + backwards[ind + 1] if forwards[ind] + backwards[ind + 1] > highest_total
      #if the index reaches the end, check if the last value of forwards[] is greater than the highest total
      else
        highest_total = forwards[ind] if forwards[ind] > highest_total
      end
        
    end
    
    #return answer
    highest_total
end