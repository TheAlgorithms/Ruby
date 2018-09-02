class ETL
  def self.transform(input)
    hash_new=Hash.new(0)
    input.each do |number,array|
      array.each do |value|
        hash_new[value.downcase]= number
      end
    end
    hash_new
  end
end