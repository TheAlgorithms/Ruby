class Series
  def initialize(number)
    @number=number
  end
  def slices(number_series)
    raise ArgumentError unless number_series<6
    array_series=[]
    loop_times=@number.length - number_series
    (0..loop_times).each do |start_value|
      temp=[]
      (start_value..start_value+number_series-1).each do|index|
        temp.push(@number[index].to_i)
      end
      array_series.push(temp)
    end
    array_series
  end
end