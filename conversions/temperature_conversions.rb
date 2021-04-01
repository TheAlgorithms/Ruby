# A ruby program for temperature conversions

# celsius -> kelvin = value of celsius + 273.15 => K
def celsius_to_kelvin(celsius_input)
  begin
    kelvin_output = (celsius_input + 273.15).round(2);
  rescue TypeError
    puts "Error: Please provide number only!"
  else
    puts "#{celsius_input}°C = #{kelvin_output}K"
  end
end

# kelvin -> celsius = vale of kelvin - 273.15 => °C
def kelvin_to_celsius(kelvin_input)
  begin
    celsius_output = (kelvin_input - 273.15).round(2);
  rescue
    puts "Error: Please provide number only!"
  else
    puts "#{kelvin_input}K = #{celsius_output}°C"
  end
end

# celsius -> fahrenheit = (value of celsius * 9 / 5) + 32 => °F
def celsius_to_fahrenheit(celsius_input)
  begin
    fahrenheit_output = ((celsius_input * 9 / 5) + 32).round(2);
  rescue
    puts "Error: Please provide number only!"
  else
    puts "#{celsius_input}°C = #{fahrenheit_output}°F"
  end
end

# fahrenheit -> celsius = (value of fahrenheit - 32) * 5 / 9 => °C
def fahrenheit_to_celsius(fahrenheit_input)
  begin
    celsius_output = ((fahrenheit_input - 32) * 5 / 9).round(2);
  rescue
    puts "Error: Please provide number only!"
  else
    puts "#{fahrenheit_input}°F = #{celsius_output}°C"
  end
end

# fahrenheit -> kelvin = [(value of fahrenheit - 32) * 5 / 9] + 273.15 => K
def fahrenheit_to_kelvin(fahrenheit_input)
  begin
    kelvin_output = ((fahrenheit_input - 32) * 5 / 9).round(2).round(2)
  rescue
    puts "Error: Please provide number only!"
  else
    puts "#{fahrenheit_input}°F = #{kelvin_output}K"
  end
end

# kelvin -> fahrenheit = [(value of kelvin - 32) * 5 / 9] + 273.15 => K
def kelvin_to_fahrenheit(kelvin_input)
  begin
    fahrenheit_output = (((kelvin_input - 273.15) * 9 / 5) + 32).round(2).round(2);
  rescue
    puts "Error: Please provide number only!"
  else
    puts "#{kelvin_input}K = #{fahrenheit_output}°F"
  end
end

# celsius <-> kelvin
celsius_to_kelvin(20)
kelvin_to_celsius(20)

# Invalid input
kelvin_to_celsius("a")

# celsius <-> fahrenheit
celsius_to_fahrenheit(-20)
fahrenheit_to_celsius(68)

# Invalid input
celsius_to_fahrenheit("abc")

# fahrenheit <-> kelvin
fahrenheit_to_kelvin(60)
kelvin_to_fahrenheit(-60)

# Invalid input
fahrenheit_to_kelvin("60")
