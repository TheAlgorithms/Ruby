class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(data)
    dir = direction(data)

    if send("#{dir}?")
      public_send(dir).insert(data)
    else
      send("#{dir}=", self.class.new(data))
    end

    self
  end

  def each(&block)
    to_enum.each(&block)
  end

  private

  attr_writer :left, :right

  def right?
    !right.nil?
  end

  def left?
    !left.nil?
  end

  def direction(child)
    child > data ? :right : :left
  end

  def to_enum
    Enumerator.new do |yielder|
      left.each { |child| yielder << child } if left?
      yielder << data
      right.each { |child| yielder << child } if right?
    end
  end
end