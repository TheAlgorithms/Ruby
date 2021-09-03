# A ruby program for weight conversions

module WeightConversion
  # Kilogram -> Gram = (kilogram_value * 1000) grams
  def self.kilogram_to_gram(kilogram_input)
    raise StandardError unless kilogram_input.is_a?(Integer)

    gram = kilogram_input * 1000

    "#{kilogram_input} kg = #{gram} g"
  end

  # Gram -> Kilogram = (gram_value / 1000) kilograms
  def self.gram_to_kilogram(gram_input)
    kilogram = gram_input / 1000

    "#{gram_input} g = #{kilogram} kg"
  end

  # Pound -> Ounce = (pound_value * 16) oz
  def self.pound_to_ounce(pound_input)
    ounce = pound_input * 16

    "#{pound_input} lb = #{ounce} oz"
  end

  # Ounce -> Pound = (ounce_value / 16) lb
  def self.ounce_to_pound(ounce_input)
    pound = ounce_input / 16

    "#{ounce_input} oz = #{pound} lb"
  end

  # Kilogram -> Pound = (kilogram_input * 2.205) lb
  def self.kilogram_to_pound(kilogram_input)
    pound = (kilogram_input * 2.205).round(2)

    "#{kilogram_input} kg = #{pound} lb"
  end

  # Pound -> Kilogram = (pound_input / 2.205) kg
  def self.pound_to_kilogram(pound_input)
    raise StandardError unless pound_input.is_a?(Integer)

    kilogram = (pound_input / 2.205).round(2)

    "#{pound_input} lb = #{kilogram} kg"
  end
end

#
# Valid inputs
#

puts WeightConversion.kilogram_to_gram(2)
# 2 kg = 2000 g
puts WeightConversion.gram_to_kilogram(3000)
# 3000 g = 3 kg
puts WeightConversion.pound_to_ounce(16)
# 16 lb = 256 oz
puts WeightConversion.ounce_to_pound(16)
# 16 oz = 1 lb
puts WeightConversion.kilogram_to_pound(1)
# 1 kg = 2.21 lb
puts WeightConversion.pound_to_kilogram(100)
# 100 lb = 45.35 kg

#
# Invalid inputs
#

begin
  puts WeightConversion.kilogram_to_gram('a')
rescue StandardError
  puts 'Error: Please provide number only!'
end

begin
  puts WeightConversion.kilogram_to_gram('3000')
rescue StandardError
  puts 'Error: Please provide number only!'
end

begin
  puts WeightConversion.kilogram_to_gram('16')
rescue StandardError
  puts 'Error: Please provide number only!'
end

begin
  puts WeightConversion.kilogram_to_gram('x ')
rescue StandardError
  puts 'Error: Please provide number only!'
end

begin
  puts WeightConversion.kilogram_to_gram('weight')
rescue StandardError
  puts 'Error: Please provide number only!'
end

begin
  puts WeightConversion.kilogram_to_gram('100')
rescue StandardError
  puts 'Error: Please provide number only!'
end
