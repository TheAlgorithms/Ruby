# A ruby program to find average median

module AverageMedian

  def self.average_median(n, *array)
    if n.instance_of? Integer
      if n == array.size
        array.sort
        if array.size%2 == 0
          mid_element_1 = array.size/2
          mid_element_2 = mid_element_1 + 1
          puts "The average median of the following elements #{array} is #{(array[mid_element_1-1] + array[mid_element_2-1])/2}."
        else
          mid_element = (array.size + 1)/2
          puts "The average median of the following elements #{array} is #{array[mid_element-1]}."
        end
      else
        puts "Provide the required #{n} elements properly!"
      end
    else
      raise
    end
    rescue
      puts "Error: Please provide number only!"
  end
end

# Valid inputs
AverageMedian.average_median(2, 3, 1)
AverageMedian.average_median(5, 1, 2, 3, 4, 5)
AverageMedian.average_median(3, 2, 2, 2)
AverageMedian.average_median(1, 5)

# Invalid inputs
AverageMedian.average_median(2, 3, 1, 5)
AverageMedian.average_median(2, 3, "a")
AverageMedian.average_median("a", 1, 2)
