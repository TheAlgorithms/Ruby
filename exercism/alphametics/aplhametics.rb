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
