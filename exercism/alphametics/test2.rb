a='PI * R == AREA'
exp,result = a.split('==')
numbers = []
    operators = []

    exp.scan(/\d+|\+|\-|\*|\/|\^/).each do |token|
      case token
      when /^\d+$/
        numbers.push(token.to_i)
      end
    end
    p numbers