require "test/unit"
def cutRod(price,n)
    
    int_min=0
    rows= n+1 
    val = Array.new(rows)
    
    for i in (0..n+1-1)
        val[i]=0
    end

    val[0]=0

    for i in (1..n+1-1) 
        max_val = int_min
        for j in (0..i-1) 
            sumv=price[j] + val[i-j-1]
            max_val = [max_val,sumv].max()
        end
        val[i] = max_val
    end
    return val[n]
end

class Rodcuttingtest < Test::Unit::TestCase
    
    #Test1
    def test_rodcutting1
      assert_equal 22, cutRod([1, 5, 8, 9, 10, 17, 17, 20],8), "Should return 22" 
    end

    #Test2
    def test_rodcutting2
        assert_equal 123, cutRod([13, 16, 28, 39, 50, 97, 107, 120],8), "Should return 123" 
    end

    #Test3
    def test_rodcutting3
        assert_equal 3, cutRod([1,2,3],3), "Should return 3" 
    end

    #Test4
    def test_rodcutting4
        assert_equal 0, cutRod([0,0,0],3), "Should return 3" 
    end
    


end