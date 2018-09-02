class Alphametics
  def solve(puzzle)
    letters = Hash.new(0)
    puzzle.scan(/[a-zA-Z]/) { |w| letters[w] += 1 }

    possible_values(letters.keys) do |letters_values|
      return letters_values if valid?(puzzle, letters_values)
    end

    nil
  end

  private

  def possible_values(letters)
    (0..9).to_a.combination(letters.length) do |combined_integers|
      combined_integers.permutation do |permutated_integers|
         yield permutated_integers.map.with_index { |integer, index|
           [letters[index], integer]
         }.to_h
      end
    end
  end

  def valid?(puzzle, letters_values)
    equation = puzzle.gsub(/[a-zA-Z]/, letters_values)
    Equation.new(equation).valid?
  end
end

class Equation
  attr_reader :equation

  def initialize(equation)
    @equation = equation
  end

  def valid?
    return false if has_leading_zeros?

    expression, result = equation.split('==')

    numbers = []
    operators = []

    expression.scan(/\d+|\+|\-|\*|\/|\^/).each do |token|
      case token
      when /^\d+$/
        numbers.push(token.to_i)
      when '+', '-', '*', '/', '^'
        calculate_last(numbers, operators) if has_precedence?(operators, token)
        operators.push(token)
      end
    end

    until operators.empty?
      calculate_last(numbers, operators)
    end

    numbers.last == result.to_i
  end

  private

  def has_leading_zeros?
    equation.match(/^0\d+|\D0\d+/)
  end

  def has_precedence?(operators, token)
    return false if operators.empty?
    prev_operator = operators.last

    case token
    when '+', '-'
      prev_operator == '*' || prev_operator == '/' || prev_operator == '^'
    when '*', '/'
      prev_operator == '^'
    else
      false
    end
  end

  def calculate_last(numbers, operators)
    right = numbers.pop
    left = numbers.pop
    operator = as_ruby_operator(operators.pop)
    result = left.send(operator, right)
    numbers.push(result)
  end

  def as_ruby_operator(operator)
    operator == '^' ? '**' : operator
  end
end