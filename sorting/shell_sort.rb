def shell_sort(a)
  n = a.length
  h = 1

  h = (3 * h) + 1 while h < n / 3

  while h >= 1
    # Logic of insertion sort with inrement steps of "h"
    (h...n).each do |i|
      j = i
      while j >= h
        if a[j - h] > a[j]
          temp = a[j]
          a[j] = a[j - h]
          a[j - h] = temp
        end
        j -= h
      end
    end
    h /= 3
  end

  a
end
