require "test/unit"

# 0-1 Knapsack problem
# The function returns the maximum value that can be put in a knapsack of a given capacity
 
def knapSack(weight, wt, val, n)
    
    rows, cols = n+1,weight+1  
    # Create a 2D array to store results of subproblems
    dp = Array.new(rows) { Array.new(cols) }
    
    for i in (0..n + 1-1) 
        for w in (0..weight + 1-1) 
            # if the weight is 0 or value is zero, the corresponding cell in the 2D array is set to 0
            if i == 0 || w == 0 
                dp[i][w] = 0
            
            #If the weight of an element is less than the capacity of the bag, the maximum value of the two cases is taken(Either the element is taken into consideration
            #or is ignored)
            elsif wt[i-1] <= w 
                dp[i][w] = [ val[i-1] + dp[i-1][w-wt[i-1]],dp[i-1][w]].max()
           
            #If the weight of the element is greater than the capacity of the bag, the cell is set to the value of the previous cell
            else
                dp[i][w] = dp[i-1][w]
            end
        end
    end
    
    return dp[n][weight]
end
    
  



class Knapsacktest < Test::Unit::TestCase
    
    #Test1
    def test_knapsack1
      assert_equal 220, knapSack(50,[10,20,30],[60,100,120],3), "Should return 220" 
    end


    #Test2
    def test_knapsack2
      assert_equal 500, knapSack(50,[50, 20, 30],[100, 200, 300],3), "Should return 500" 
    end

    #Test3
    def test_knapsack3
        assert_equal 17, knapSack(10,[3,4,5, 2, 1],[10,2,3,4,0],5), "Should return 17" 
    end

    #Test4
    def test_knapsack4
        assert_equal 0, knapSack(0,[23, 17, 12, 8, 20],[199,200,30,41,10],5), "Should return 0" 
    end


end


    