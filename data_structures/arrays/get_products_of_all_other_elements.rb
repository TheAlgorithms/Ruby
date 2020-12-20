# Arrays - Get Products of all other elements in Ruby

# Algorithm challenge description:
# Given an array of integers, return a new array such that
# each element at index `i` of the new array is the product of
# all the numbers in the original array except the one at `i`.

# 1. Brute force solution
def calculate_products_of_all_other_elements(nums)
  products_other_elements = Array.new(nums.length, 1)

  nums.each_with_index do |num1, i|
    nums.each_with_index do |num2, j|
      if (i != j)
        products_other_elements[i] = products_other_elements[i] * num2
      end
    end
  end

  products_other_elements
end

puts(calculate_products_of_all_other_elements([1, 2, 3]))
