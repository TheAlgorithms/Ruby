"""
Algorithm: Quicksort
Time Complexity: O(nlogn)
"""
def quicksort(array, from_idx=0, to_idx=nil)
    if to_idx == nil
        # Sort the whole array, by default
        to_idx = array.count - 1
    end

    if from_idx >= to_idx
        # Base case
        return
    end

    # Take a pivot value, at the far left
    pivot = array[from_idx]

    # Min and Max pointers
    min = from_idx
    max = to_idx

    # Current free slot
    free = min

    while min < max
        if free == min # Evaluate array[max]
            if array[max] <= pivot # Smaller than pivot, must move
                array[free] = array[max]
                min += 1
                free = max
            else
                max -= 1
            end
        elsif free == max # Evaluate array[min]
            if array[min] >= pivot # Bigger than pivot, must move
                array[free] = array[min]
                max -= 1
                free = min
            else
                min += 1
            end
        else
            raise "Invalid state"
        end
    end

    array[free] = pivot
    #Recursive call to quicksort function
    quicksort array, from_idx, free - 1
    quicksort array, free + 1, to_idx
end

#Test for quicksort implementation
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
quicksort a
puts "quicksort"
print a
