# LCM (Least Common Multiple) of two numbers is the smallest number which can be divided by both numbers.
value_one = gets.chomp.to_i
value_two = gets.chomp.to_i

def gcd(first, second)
  if second != 0
    gcd(second, first%second)
  else
    first
  end
end

def lcm(first, second)
  (first * second)/gcd(first, second)
end

p "Least Common Multiple is: #{lcm(value_one, value_two)}"
