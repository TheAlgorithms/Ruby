class Array
  def accumulate
    accumulated_value=[]
    each do |element|
      accumulated_value.push(yield element)
    end
    accumulated_value
  end
end