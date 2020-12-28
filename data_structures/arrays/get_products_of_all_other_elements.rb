# Arrays - Get Products of all other elements in Ruby

# Algorithm challenge description:
# Given an array of integers, return a new array such that
# each element at index `i` of the new array is the product of
# all the numbers in the original array except the one at `i`.

#
# 1. Brute force solution
#
def calculate_products_of_all_other_elements(nums)
  product_of_other_elements = Array.new(nums.length, 1)

  nums.each_with_index do |num1, i|
    nums.each_with_index do |num2, j|
      if (i != j)
        product_of_other_elements[i] = product_of_other_elements[i] * num2
      end
    end
  end

  product_of_other_elements
end

puts(calculate_products_of_all_other_elements([1, 2, 3]))

#
# 2. O(n) time and space
# Arrays - Get Products of all other elements in Ruby
#

# Generates prefix products
def build_prefix_products(nums)
  prefix_products = []

  nums.each do |num|
    if prefix_products.count > 0
      prefix_products << (prefix_products.last * num)
    else
      prefix_products << num
    end
  end

  return prefix_products
end

# Generates suffix products
def build_suffix_products(nums)
  suffix_products = []

  nums.reverse.each do |num|
    if suffix_products.count > 0
      suffix_products << (suffix_products.last * num)
    else
      suffix_products << num
    end
  end

  return suffix_products
end

# Builds output
def output(prefix_products, suffix_products, nums)
  result = []

  nums.reverse.each_with_index do |num, index|
    if index == 0
      result << suffix_products[index + 1]
    elsif index == nums.length - 1
      result << prefix_products[index - 1]
    else
      result << (prefix_products[index - 1] * suffix_products[index + 1])
    end
  end

  return result
end

# Generate result from the product of prefixes and suffixes
def products(nums)
  prefix_products = build_prefix_products(nums)
  suffix_products = build_suffix_products(nums)
  suffix_products = suffix_products.reverse

  return output(prefix_products, suffix_products, nums)
end

puts(products([1, 2, 3]))
# => [6, 3, 2]
