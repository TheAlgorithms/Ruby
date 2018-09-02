class RunLengthEncoding
  VERSION = 1

  def self.encode(input)
    input.chars.chunk(&:ord).map do |_,group|
      condense(group)
    end.join
  end

  def self.decode(input)
    input.scan(/\d*\D{1}/).map do |segment|
      expand(segment.chars)
    end.join
  end

  def self.condense(group)
    return group.first if group.size == 1
    group.size.to_s + group.first
  end

  def self.expand(segment)
    data = segment.pop
    return data if segment.empty?
    data * segment.join.to_i
  end
end