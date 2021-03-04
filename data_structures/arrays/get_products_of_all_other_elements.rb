# Arrays - Get Products of all other elements in Ruby

# Algorithm challenge description:
# Given an array of integers, return a new array such that
# each element at index `i` of the new array is the product of
# all the numbers in the original array except the one at `i`.

#
# This file solves the algorithm in 3 approaches:
#
# 1. Brute force
# 2. Left and Right product lists
# 3. O(1) space approach
#

#
# 1. Brute force solution
#
def calculate_products_of_all_other_elements(nums)
  product_of_other_elements = Array.new(nums.count, 1)

  nums.count.times do |i|
    nums.count.times do |j|
      next if i == j

      product_of_other_elements[i] = product_of_other_elements[i] * nums[j]
    end
  end

  product_of_other_elements
end

puts(calculate_products_of_all_other_elements([1, 2, 3]))

#
# Approach 2: Left and Right product lists
#

# Complexity analysis
#
# Time complexity: O(N) where N represents the number of elements in the input
# array. We use one iteration to construct the array prefix_products, one to construct
# the array suffix_products and one last to construct the answeranswer array using L and R.
# Space complexity: O(N) used up by the two intermediate arrays that
# we constructed to keep track of product of elements to the left and right.

# Generates prefix products
# prefix_products[i] contains the product of all the elements to the left
# Note: for the element at index '0', there are no elements to the left,
# so the prefix_products[0] would be 1
def build_prefix_products(nums)
  prefix_products = []

  nums.each do |num|
    prefix_products << if prefix_products.count > 0
                         prefix_products.last * num
                       else
                         num
                       end
  end

  prefix_products
end

# Generates suffix products
# suffix_products[i] contains the product of all the elements to the right
# Note: for the element at index 'length - 1', there are no elements to the right,
# so the suffix_products[length - 1] would be 1
def build_suffix_products(nums)
  suffix_products = []

  nums.reverse.each do |num|
    suffix_products << if suffix_products.count > 0
                         suffix_products.last * num
                       else
                         num
                       end
  end

  suffix_products
end

# Builds output
# For the first element, suffix_products[i] would be product except self
# For the last element of the array, product except self would be prefix_products[i]
# Else, multiple product of all elements to the left and to the right
def output(prefix_products, suffix_products, nums)
  result = []

  nums.count.times do |index|
    result << if index == 0
                suffix_products[index + 1]
              elsif index == nums.count - 1
                prefix_products[index - 1]
              else
                (prefix_products[index - 1] * suffix_products[index + 1])
              end
  end

  result
end

# Generate result from the product of prefixes and suffixes
def products(nums)
  prefix_products = build_prefix_products(nums)
  suffix_products = build_suffix_products(nums)
  suffix_products = suffix_products.reverse

  output(prefix_products, suffix_products, nums)
end

puts(products([1, 2, 3]))
# => [6, 3, 2]

#
# Approach 3: O(1) space approach
#

# This approach is essentially an extension of the approach 2.
# Basically, we will be using the output array as one of L or R and we will
# be constructing the other one on the fly.

# Complexity analysis
#
# Time complexity: O(N) where N represents the number of elements in the input
# array. We use one iteration to construct the array L, one to update the array
# answer.

# Space complexity: O(1) since don't use any additional array for our
# computations. The problem statement mentions that using the answer
# array doesn't add to the space complexity.

def products(nums)
  return [] if nums.count < 2

  res = [1]

  # res[i] contains the product of all the elements to the left
  # Note: for the element at index '0', there are no elements to the left,
  # so the res[0] would be 1
  (0..(nums.count - 2)).each do |i|
    num = nums[i]
    res << num * res[i]
  end

  # product contains the product of all the elements to the right
  # Note: for the element at index 'length - 1', there are no elements to the right,
  # so the product would be 1
  product = 1

  (nums.count - 1).downto(1) do |i|
    num = nums[i]
    # For the index 'i', product would contain the
    # product of all elements to the right. We update product accordingly.
    res[i - 1] *= (product * num)
    product *= num
  end

  res
end

puts(products([1, 2, 3]))
# => [6, 3, 2]
