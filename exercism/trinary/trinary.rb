class Trinary
   def initialize(number)
    @number=number
  end
  def to_decimal
    return 0 if @number=~/[[:alpha]]/
    len=@number.length
    @number.chars.map do |i|
      len-=1
      i.to_i * (3**len)
    end.reduce(:+)
  end
end