# Iterate through the array to find the index of key using recursion.

def recursive_double_linear_search(data, key, left = 0, right = 0)
  right &&= data.length - 1

  return -1 if left > right

  return left if data[left] == key
  return right if data[right] == key

  recursive_double_linear_search(data, key, left + 1, right - 1)
end

puts(recursive_double_linear_search([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 5))
# => 5

puts(recursive_double_linear_search([1, 2, 4, 5, 3], 4))
# => 2

puts(recursive_double_linear_search([1, 2, 4, 5, 3], 6))
# => -1

puts(recursive_double_linear_search([5], 5))
# => 0

puts(recursive_double_linear_search([], 1))
# => -1
