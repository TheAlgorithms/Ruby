#You are given an array prices where prices[i] is the price of a given stock on the ith day.
#Find the maximum profit you can achieve. You may complete at most two transactions.
#Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

#Example 1:
#Input: prices = [3,3,5,0,0,3,1,4]
#Output: 6
#Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
#Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

#Example 2:
#Input: prices = [1,2,3,4,5]
#Output: 4
#Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
#Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

#Example 3:
#Input: prices = [7,6,4,3,1]
#Output: 0
#Explanation: In this case, no transaction is done, i.e. max profit = 0.

#Example 4:
#Input: prices = [1]
#Output: 0

#Constraints:
#1 <= prices.length <= 105
#0 <= prices[i] <= 105




#Sliding Window Approach with a flavor of DP - O(n) Time / O(n) Space
#Find maximum profit for each day and store in forwards[].
#Find maximum profit for each day in reverse and store in backwards[].
#Then iterate through both at the same time (forwards[index] + backwards[index + 1]) and find highest total profit.
#For the last index, check only the forwards[index] to see if it's greater than highest total profit ...
#... (as the backwards[index + 1] would be out of bounds). 
#Return highest total profit.


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    #find max profit for each day
    #identical to best-time-buy-and-sell-stock-i, except we're adding each iteration of highest profit to forwards[]
    lowest_price, highest_profit = (10 ** 5) + 1, 0
    forwards = []
    
    prices.each do |price|
      lowest_price = price if price < lowest_price
      highest_profit = price - lowest_price if price - lowest_price > highest_profit
      forwards << highest_profit
    end
    
    puts "forwards: #{forwards}"
    
    #find max profit for each day in reverse - backwards[]
    #same as above, except in reverse -> meaning we're tracking highest price and subtracting future values from it.
    highest_price, highest_profit = -1, 0
    backwards = []
    
    prices.each_with_index do |price, ind|
      highest_price = prices[prices.length - 1 - ind] if prices[prices.length - 1 - ind] > highest_price
      profit = highest_price - prices[prices.length - 1 - ind]
      highest_profit = profit if profit > highest_profit
      
      backwards[prices.length - 1 - ind] = highest_profit
    end

    puts "backwards: #{backwards}"
    
    #find highest total - iterate forwards as ind, and backwards as day + 1
    #edge case: for the last iteration, check only the forwards[] array to see if one transaction on the last day is the highest
    highest_total = 0
    
    prices.each_with_index do |price, ind|
      if ind < prices.length - 2
        highest_total = forwards[ind] + backwards[ind + 1] if forwards[ind] + backwards[ind + 1] > highest_total
      else
        highest_total = forwards[ind] if forwards[ind] > highest_total
      end
        
    end
    
    #return answer
    highest_total
end