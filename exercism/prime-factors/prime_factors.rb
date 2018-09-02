require 'prime'
class PrimeFactors
  def self.for(number)
    prime_factors=[]
    number.prime_division.each do|value,index|
      (1..index).each do |_|
        prime_factors.push(value)
      end
    end
    prime_factors
  end
end			