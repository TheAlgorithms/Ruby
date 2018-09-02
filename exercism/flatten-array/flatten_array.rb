class FlattenArray
  VERSION = 1
  def self.flatten(input_array)
    return [input_array] unless input_array.is_a?(Array)
    input_array.reduce([]) { |acc, elem| elem.nil? ? acc : acc + flatten(elem) }
  end
end
