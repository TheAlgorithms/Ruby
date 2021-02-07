require 'openssl'

class MerkleHellman
  SMALLEST_KNAPSACK_ITEM = 2**32
  STEP = 2**32

  def initialize(size)
    @size = size
    sum = SMALLEST_KNAPSACK_ITEM
    @easy_knapsack = size.times.map do |_k|
      x = sum + rand(STEP)
      sum += x
      x
    end
    @n = sum + rand(STEP)

    loop do
      @a = rand(0..@n)
      break if @a.gcd(@n) == 1
    end

    @hard_knapsack = @easy_knapsack.map do |x|
      (@a * x) % @n
    end
  end

  def encrypt(msg)
    raise ArgumentError, "max length is #{@size / 8} characters" if msg.length * 8 > @size

    c = 0
    msg.each_codepoint.reverse_each.with_index do |ch, i|
      7.downto(0) do |j|
        wj = ch.>>(j).& 1
        c += wj * @hard_knapsack[i * 8 + 7 - j]
      end
    end
    c
  end

  def decrypt(c)
    p = @a.to_bn.mod_inverse(@n).mod_mul(c, @n).to_i
    byte = 0
    msg = []
    @easy_knapsack.reverse_each.with_index do |x, i|
      bit = 0
      if p >= x
        p -= x
        bit = 1
      end
      byte |= (bit << (i % 8))
      if i % 8 == 7
        msg << byte.chr
        byte = 0
      end
    end
    msg.join
  end
  attr_accessor :hard_knapsack
end

str = 'Hello there, this is my plaintext'
mh = MerkleHellman.new(str.length * 8)
puts "[*] Encrypting \"#{str}\""

c = mh.encrypt(str)

puts "[*] Ciphertext : #{c}"

decrypted = mh.decrypt(c)

puts "[*] after decryption : \"#{decrypted}\""
