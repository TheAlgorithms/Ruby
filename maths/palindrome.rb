# Palindrome Number Checking in Ruby

# Checks if a given integer is a palindrome without converting it to a string.
# A palindrome is a number that reads the same backward as forward.
# Negative numbers are not considered palindromes by this definition.
#
# @param number [Integer] The integer to check.
# @return [Boolean] true if the number is a palindrome, false otherwise.
#
# Examples:
# is_palindrome(121)  #=> true
# is_palindrome(123)  #=> false
# is_palindrome(7)    #=> true
# is_palindrome(0)    #=> true
# is_palindrome(-121) #=> false
def is_palindrome(number)
  # Negative numbers are not considered palindromes
  return false if number < 0

  # Single digits are always palindromes
  # return true if number < 10 # This line is optional but efficient

  original_number = number
  reversed_number = 0

  # Loop while the number is greater than 0
  while number > 0
    # Get the last digit
    remainder = number % 10

    # Build the reversed number
    reversed_number = (reversed_number * 10) + remainder

    # Remove the last digit using integer division
    number /= 10
  end

  # Return true if the original and reversed numbers are the same
  original_number == reversed_number
end

# --- Examples ---
puts "Is 121 a palindrome? #{is_palindrome(121)}"   # Output: true
puts "Is 123 a palindrome? #{is_palindrome(123)}"   # Output: false
puts "Is 7 a palindrome? #{is_palindrome(7)}"     # Output: true
puts "Is 0 a palindrome? #{is_palindrome(0)}"     # Output: true
puts "Is -101 a palindrome? #{is_palindrome(-101)}" # Output: false
puts "Is 1221 a palindrome? #{is_palindrome(1221)}"  # Output: true
