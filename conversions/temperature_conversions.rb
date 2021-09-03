# A ruby program for temperature conversions

module TemperatureConversion
  # celsius -> kelvin = value of celsius + 273.15 => K
  def self.celsius_to_kelvin(celsius_input)
    kelvin_output = (celsius_input + 273.15).round(2)
    puts "#{celsius_input}°C = #{kelvin_output}K"
  rescue StandardError
    puts 'Error: Please provide number only!'
  end

  # kelvin -> celsius = vale of kelvin - 273.15 => °C
  def self.kelvin_to_celsius(kelvin_input)
    celsius_output = (kelvin_input - 273.15).round(2)
    puts "#{kelvin_input}K = #{celsius_output}°C"
  rescue StandardError
    puts 'Error: Please provide number only!'
  end

  # celsius -> fahrenheit = (value of celsius * 9 / 5) + 32 => °F
  def self.celsius_to_fahrenheit(celsius_input)
    fahrenheit_output = ((celsius_input * 9 / 5) + 32).round(2)
    puts "#{celsius_input}°C = #{fahrenheit_output}°F"
  rescue StandardError
    puts 'Error: Please provide number only!'
  end

  # fahrenheit -> celsius = (value of fahrenheit - 32) * 5 / 9 => °C
  def self.fahrenheit_to_celsius(fahrenheit_input)
    celsius_output = ((fahrenheit_input - 32) * 5 / 9).round(2)
    puts "#{fahrenheit_input}°F = #{celsius_output}°C"
  rescue StandardError
    puts 'Error: Please provide number only!'
  end

  # fahrenheit -> kelvin = [(value of fahrenheit - 32) * 5 / 9] + 273.15 => K
  def self.fahrenheit_to_kelvin(fahrenheit_input)
    kelvin_output = ((fahrenheit_input - 32) * 5 / 9).round(2).round(2)
    puts "#{fahrenheit_input}°F = #{kelvin_output}K"
  rescue StandardError
    puts 'Error: Please provide number only!'
  end

  # kelvin -> fahrenheit = [(value of kelvin - 32) * 5 / 9] + 273.15 => K
  def self.kelvin_to_fahrenheit(kelvin_input)
    fahrenheit_output = (((kelvin_input - 273.15) * 9 / 5) + 32).round(2).round(2)
    puts "#{kelvin_input}K = #{fahrenheit_output}°F"
  rescue StandardError
    puts 'Error: Please provide number only!'
  end
end

# celsius <-> kelvin
TemperatureConversion.celsius_to_kelvin(20)
TemperatureConversion.kelvin_to_celsius(20)

# Invalid input
TemperatureConversion.kelvin_to_celsius('a')

# celsius <-> fahrenheit
TemperatureConversion.celsius_to_fahrenheit(-20)
TemperatureConversion.fahrenheit_to_celsius(68)

# Invalid input
TemperatureConversion.celsius_to_fahrenheit('abc')

# fahrenheit <-> kelvin
TemperatureConversion.fahrenheit_to_kelvin(60)
TemperatureConversion.kelvin_to_fahrenheit(-60)

# Invalid input
TemperatureConversion.fahrenheit_to_kelvin('60')
