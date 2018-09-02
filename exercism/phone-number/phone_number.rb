class PhoneNumber
  def initialize(input)
    @number_input=input.scan(/\d+/).join
    @temp = input.split(//).last =~ /[[:alpha:]]/
    if @number_input.length==11 && @number_input[0]=='1'
      @number_input.slice!(0)
    end
  end
  def number
    false_value='0000000000'
    return false_value if @temp==0
    return @number_input if @number_input.length==10
    return false_value
  end
  def area_code
    return @number_input.chars.first(3).join
  end
  def to_s
    swap={0=>'(',4=>') ',9=>'-'}
    [0,4,9].each do |i|
      @number_input.insert(i,swap[i])
    end
    @number_input
  end
end