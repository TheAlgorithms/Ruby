# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    lowest_price, highest_profit = 9999999, 0
    
    prices.each do |price|
      lowest_price = price if price < lowest_price
      highest_profit = price - lowest_price if price - lowest_price > highest_profit
    end
    
    highest_profit
end