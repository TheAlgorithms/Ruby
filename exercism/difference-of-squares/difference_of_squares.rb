module BookKeeping
  VERSION=3
end

class Squares
  def initialize ( number )
    @sum_squares=0
    @square_sum=0
    (0..number).each do |i|
      @sum_squares+=i**2
      @square_sum+=i
    end
  end
  def square_of_sum
    @square_sum**2
  end
  def sum_of_squares
    @sum_squares
  end
  def difference
    @square_sum**2-@sum_squares
  end
end