class Clock
  def self.at(hr, min = 0)
    minutes = hr * 60 + min
    new (minutes)
  end

  def initialize(minutes)
    @minutes = minutes
  end

  def +(add)
    self.class.new(@minutes + add)
  end

  def -(sub)
    self.class.new(@minutes - sub)
  end

  def ==(other_class)
    hour_minute == other_class.hour_minute
  end

  def to_s
    "%02d:%02d" % hour_minute
  end

  def hour_minute
    [
      @minutes / 60 % 24,
      @minutes % 60
    ]
  end
end