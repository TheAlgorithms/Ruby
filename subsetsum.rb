require "test/unit"
def isSubsetSum(set, n, sum)
	
	rows,cols=n+1,sum+1
	dp = Array.new(rows) { Array.new(cols) }
	for i in (0..n + 1-1) 
        for j in (0..sum + 1-1) 
            dp[i][j]=false
        end
    end
	
	# If sum is 0, then answer is true
	for i in (0..n+1-1)
		dp[i][0] = true
	end
		
	# If sum is not 0 and set is empty,
	# then answer is false
	for i in (0..sum+1-1)
		dp[0][i]= false
	end
			
	# Fill the subset table in bottom up manner
	for i in (0..n+1-1)
		for j in (0..sum+1-1)
			if j<set[i-1]
				dp[i][j] = dp[i-1][j]
			end
			if j>= set[i-1]
				dp[i][j] = (dp[i-1][j] or dp[i - 1][j-set[i-1]])
			end
		end
	end
	
	
	return dp[n][sum]
end
	
class Subsettest < Test::Unit::TestCase
    
    #Test1
    def test_subset1
      assert_equal true, isSubsetSum([1,2,3,4],4,7), "Should return 220" 
    end


    #Test2
    def test_subset2
      assert_equal false, isSubsetSum([123,30,23,24],4,100), "Should return 500" 
    end

    #Test3
    def test_subset3
        assert_equal false, isSubsetSum([19,34,23,12,45,120,12],7,1), "Should return 17" 
    end

    #Test4
    def test_subset4
        assert_equal true, isSubsetSum([1,1,],2,1), "Should return 0" 
    end


end


		