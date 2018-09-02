class Crypto
  attr_reader :unnormalized,:segments,:normalize_value
  def initialize(unnormalized)
    @unnormalized = unnormalized
    @normalize_value=[]
  end

  def normalize_plaintext
    unnormalized.gsub(/\W/, '').downcase
  end

  def size
    (normalize_plaintext.size**0.5).ceil
  end

  def plaintext_segments
    @segments=normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
  	plaintext_segments
   	d=segments.slice!(0).split(//)
    segments.each {|i| d=d.zip(i.split(//))}
    d.each {|i| normalize_value.push(i.join)}
    d.join
  end

  def normalize_ciphertext
    ciphertext
    normalize_value.join(' ')
  end
end