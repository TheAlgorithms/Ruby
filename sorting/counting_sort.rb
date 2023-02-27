##
# Given a non-negative integer value_upper_bound and an array of integers arr with values between 0 and value_upper_bound,
# returns a sorted copy of the input array.
# When value_upper_bound = O(arr.length), sorting runs in O(arr.length).

def counting_sort(arr, value_upper_bound)
    if !value_upper_bound.integer? || value_upper_bound < 0
        raise ArgumentError.new("counting_sort must be invoked with integer value_upper_bound >= 0")
    end
    if !arr.all? { |elem| elem.integer? && elem.between?(0, value_upper_bound) }
        raise ArgumentError.new("counting_sort must be invoked with integer array elements in (0..value_upper_bound)")
    end
    sorted_arr = Array.new(arr.length) { 0 }
    tmp_arr = Array.new(value_upper_bound+1) { 0 }
    for elem in arr
        tmp_arr[elem] += 1
    end
    for i in 1..value_upper_bound
        tmp_arr[i] += tmp_arr[i-1]
    end
    arr.reverse_each do |elem|
        sorted_arr[tmp_arr[elem]-1] = elem
        tmp_arr[elem] -= 1
    end
    sorted_arr
end
