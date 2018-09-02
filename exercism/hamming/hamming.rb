class Hamming
  def self.compute strand, other_strand
    raise ArgumentError unless strand.length == other_strand.length
    
    strand.each_char.with_index.count do |nucleotide, index|
      nucleotide != other_strand[index]
    end
  end
end