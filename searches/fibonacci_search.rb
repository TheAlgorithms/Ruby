def fibonacci_search int arr, int element
    n = n.size
    f2 = 0
    f1 = 1
    f  = f2 + f1
    offset = -1

    while f < n do
	f2 = f1;
	f1 = f;
	f  = f2 + f1;
    end

    while f > 1 do
	i = [offset+f2, n-1].min

	if arr[i] < element
	    f  = f1
	    f1 = f2
	    f2 = f - f1
	    offset = i
	elsif arr[i] > element
	    f  = f2
	    f1 = f1 - f2
	    f2 = f - f1	
	else
	    return i
        end
    end

    return offset + 1 if f1 && arr[offset + 1] == element

    -1
end
