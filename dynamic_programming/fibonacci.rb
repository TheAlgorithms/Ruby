def fibonacci(n)
  # Create an array to store Fibonacci numbers
  fib = [0, 1]

  # Calculate Fibonacci numbers from the bottom up
  (2..n).each do |i|
    fib[i] = fib[i - 1] + fib[i - 2]
  end

  return fib[n]
end

# Example usage:
n = 10
result = fibonacci(n)
puts "The #{n}-th Fibonacci number is #{result}"
