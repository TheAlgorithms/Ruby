class School
  def initialize
    @student_hash=Hash.new{|h,k|h[k]=[]}
  end
  def add(name,grade)
    @student_hash[grade] << name
  end
  def to_h
    @student_hash.each {|k,v| @student_hash[k]=v.sort}
    Hash[@student_hash.sort]
  end
  def grade(number)
    @student_hash[number].sort
  end
  def keys
    @student_hash.each do |k,v|
      k
    end
  end
end