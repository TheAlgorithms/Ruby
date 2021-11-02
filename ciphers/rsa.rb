require 'prime'

def initialize(keys = {})
  @e ||= keys[:e]
  @n ||= keys[:n]
end

def cipher(message)
  message.bytes.map do |byte|
    cbyte = ((byte.to_i**e) % n).to_s
    missing_chars = n.to_s.size - cbyte.size
    '0' * missing_chars + cbyte
  end.join
end

def decipher(ciphed_message)
  ciphed_message.chars.each_slice(n.to_s.size).map do |arr|
    (arr.join.to_i**d) % n
  end.pack('c*')
end

def public_keys
  { n: n, e: e }
end

private

def p
  @p ||= random_prime_number
end

def q
  @q ||= random_prime_number
end

def n
  @n ||= p * q
end

def totient
  @totient ||= (p - 1) * (q - 1)
end

def e
  @e ||= totient.downto(2).find do |i|
    Prime.prime?(i) && totient % i != 0
  end
end

def d
  @d ||= invmod(e, totient)
end

def extended_gcd(a, b)
  last_remainder = a.abs
  remainder = b.abs
  x = 0
  last_x = 1
  y = 1
  last_y = 0
  while remainder != 0
    (quotient, remainder) = last_remainder.divmod(remainder)
    last_remainder = remainder
    x, last_x = last_x - quotient * x, x
    y, last_y = last_y - quotient * y, y
  end

  [last_remainder, last_x * (a < 0 ? -1 : 1)]
end

def invmod(e, et)
  g, x = extended_gcd(e, et)
  raise 'The maths are broken!' if g != 1

  x % et
end

def random_prime_number
  number = Random.rand(1..1000)
  number = Random.rand(1..1000) until Prime.prime?(number) || number == p || number == q
  number
end

def main
  puts 'Enter the message you want to encrypt and decrypt with RSA algorithm: '
  message = gets.chomp.to_s
  puts 'Encoded Text:'
  puts cipher(message)
  puts 'Decoded Text:'
  puts decipher(cipher(message))
  puts "p: #{p}"
  puts "q: #{q}"
  puts "e: #{e}"
  puts "d: #{d}"
  puts "totient: #{totient}"
end

main
