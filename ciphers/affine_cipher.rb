# frozen_string_literal: true

class CoprimeError < StandardError
  def initialize(msg = 'Key and number of letters in the alphabet must be coprime')
    super
  end
end

class AffineCipher
  ALPHABET = ('a'..'z').to_a
  LETTERS_COUNT = ALPHABET.count

  # @param
  def initialize(key:, shift:, message:)
    raise CoprimeError unless coprime?(key)

    @key = key
    @shift = shift
    @message = message
    @translation_map = create_translation_map
    @reverted_translation_map = revert_translation_map
  end

  def encrypt
    @encrypted_message = @message.chars.map do |ch|
      ALPHABET.include?(@translation_map[ch]) ? @translation_map[ch] : ch
    end.join
  end

  def decrypt
    @encrypted_message.chars.map do |ch|
      ALPHABET.include?(@reverted_translation_map[ch]) ? @reverted_translation_map[ch] : ch
    end.join
  end

  private

  def create_translation_map
    shifted_alphabet = ALPHABET.map.with_index do |_, index|
      ALPHABET[(@key * index + @shift) % LETTERS_COUNT]
    end

    ALPHABET.zip(shifted_alphabet).to_h
  end

  def revert_translation_map
    unsifted_alphabet = ALPHABET.map.with_index do |_, index|
      ALPHABET[(LETTERS_COUNT - @key) * (index - @shift) % LETTERS_COUNT]
    end

    ALPHABET.zip(unsifted_alphabet).to_h
  end

  def coprime?(key)
    key.gcd(LETTERS_COUNT) == 1
  end
end

message = 'affine cipher'
cipher = AffineCipher.new(key: 5, shift: 8, message: message)

puts "Original message: #{message}"
puts "Encrypted: #{cipher.encrypt}"
puts "Decrypted: #{cipher.decrypt}"
