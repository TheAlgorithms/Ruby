class SumOfMultiples
  def initialize(*input1)
    @array=input1
  end
  def to(input)
    sum=0
    temp=[]
    @array.each do |x|
      (x..input-1).step(x) do |value|
        sum+=value unless temp.include? value
        temp.push(value) unless temp.include? value
      end
    end
    sum
  end
end