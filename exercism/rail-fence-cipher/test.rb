 def zigzag(rails, size)
    pattern = (0..rails - 1).to_a + (1..rails - 2).to_a.reverse
    pattern.cycle.first(size).zip(0..size)
  end

rails=3
ciphertext="TEITELHDVLSNHDTISEIIEA"

  p  zigzag(rails, ciphertext.length).
      sort.
      zip(ciphertext.chars).
      sort_by { |a| a[0][1] }