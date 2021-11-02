# A ruby program for Ohms Law, which is used to calculate Voltage for the given Resistance and Current.
# Ohms Law -> V = I * R
# Reference: https://en.wikipedia.org/wiki/Ohm's_law

def ohms_law(i, r)
  if i > 0 && r > 0
    "The voltage for given #{i} ampheres current and #{r} ohms resistance is #{r * i} volts."
  else
    raise
  end
rescue StandardError
  'Error: Please provide valid inputs only!'
end

# Valid inputs
puts(ohms_law(5, 10))
# The voltage for given 5 ampheres current and 10 ohms resistance is 50 volts.
puts(ohms_law(2.5, 6.9))
# The voltage for given 2.5 ampheres current and 6.9 ohms resistance is 17.25 volts.
puts(ohms_law(0.15, 0.84))
# The voltage for given 0.15 ampheres current and 0.84 ohms resistance is 0.126 volts.

# Invalid inputs
puts(ohms_law(5, -10))
# Error: Please provide valid inputs only!
puts(ohms_law(-5, -10))
# Error: Please provide valid inputs only!
puts(ohms_law(5, '10'))
# Error: Please provide valid inputs only!
puts(ohms_law('a', 10))
# Error: Please provide valid inputs only!
