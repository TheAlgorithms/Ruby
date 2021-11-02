require 'minitest/autorun'
require_relative 'caesar'

class CaesarCipherTest < Minitest::Test
  def test_shift4
    run_tests('apple', 'ettpi', 4)
  end

  def test_shift27
    run_tests('amateur', 'bnbufvs', 27)
  end

  private

  def run_tests(plaintext, expected_cipher, shift)
    encrypted = CaesarCipher.encrypt(plaintext, shift)
    assert_equal encrypted, expected_cipher
    decrypted = CaesarCipher.decrypt(encrypted, shift)
    assert_equal decrypted, plaintext
  end
end
