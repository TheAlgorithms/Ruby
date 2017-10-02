# Binary Search Algorithm
# This algorithm finds a value in log(n) time, so long as the array has been pre-sorted.

def binary_search(array, value, start_element, end_element)
	if end_element == - 1
		end_element = array.count - 1
	end

	middle_element = (start_element + end_element) / 2
	
	if value < array[middle_element]
		print(binary_search array, value, start_element, (middle_element - 1))
	elsif value > array[middle_element]
		print(binary_search array, value, (middle_element + 1), end_element)
	else
		return middle_element
	end
end