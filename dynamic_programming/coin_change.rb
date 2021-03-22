def coin_change_minimum(coins, amount)
  dp = Array.new(amount + 1, -1)
  dp[0] = 0

  coins.each do |coin|
    (coin..amount).each do |i|
      if dp[i - coin] != -1
        dp[i] = -1 == dp[i] ? dp[i - coin] + 1 : [dp[i], dp[i - coin] + 1].min
      end
    end
  end

  dp[amount]
end

def coin_change_combinations(coins, amount)
  dp = Array.new(coins.length + 1) { Array.new(amount + 1, 0) }
  dp[0][0] = 1
  (1..coins.length).each do |i|
    (0..amount).each do |j|
      dp[i][j] = dp[i - 1][j] + (j < coins[i - 1] ? 0 : dp[i][j - coins[i - 1]])
    end
  end
  dp[coins.length][amount]
end

coins = Array[2, 4, 5]
amount = 12
puts 'Number of combinations of getting change for ' + amount.to_s + ' is ' + coin_change_combinations(coins,
                                                                                                       amount).to_s + '.'
puts 'Minimum number of coins required for ' + amount.to_s + ' is ' + coin_change_minimum(coins, amount).to_s + '.'
