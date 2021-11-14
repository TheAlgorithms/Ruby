require "test/unit"

def editDistDP(str1, str2, m, n) 
    rows, cols = m+1,n+1  

    # Create a 2D array to store results of subproblems
    dp = Array.new(rows) { Array.new(cols) }

    #using bottom up approach
    for i in (0..m + 1-1) do
        for j in (0..n + 1-1) do

            #If the first string is empty, insert all the characters of the second string
            if i == 0 
                dp[i][j] = j   
        
            #If the second string is empty, insert all the characters of the first string
            elsif j == 0 
                dp[i][j]  = i 
            
            #If the last character in both the strings are same, we can ignore the character and move to the next character in both the strings
            elsif str1[i-1] == str2[j-1] 
                dp[i][j] =  dp[i-1][j-1] 
            
            #If the last character of both the strings are different, find out the minimum value of the three operations(insert, delete, replace)
            else
                dp[i][j] = 1 +[dp[i][j-1],dp[i-1][j],dp[i-1][j-1]].min()
                
            end
        
        end
        
    end
    
    return dp[m][n]
end




class Editdistancetest < Test::Unit::TestCase
    
    #Test1
    #Replace 'n' with 'r'
    #insert 'a'
    #insert 't'
    #No of total operations : 3
    def test_distance1
      assert_equal 3, editDistDP( "sunday","saturday",6,8), "Should return 3" 
    end
  
    #Test2
    #Replace 'a' with 'u'
    #No of total operations : 1
    def test_distance2
      assert_equal 1, editDistDP("cat","cut",3,3), "editDistDpShould return 1"
    end

    #Test3
    #Insert 'a','p', 'p','l','e','p','i','e' into string 1
    #No of total operations : 8
    def test_distance3
       assert_equal 8, editDistDP("","applepie",0,8), "editDistDpShould return 1"
    end

    #Test4
    #Both the strings are equal, thus no operation needed
    #No of total operations : 0
    def test_distance4
       assert_equal 0, editDistDP("Hello","Hello",5,5), "editDistDpShould return 1" 
    end

  end
    
