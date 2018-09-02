class SpaceAge
  def initialize(seconds_age)
  	@earth_age=seconds_age.to_f/31_557_600
    @seconds_age=seconds_age
  end
  def seconds
    @seconds_age
  end
  def on_earth
    @earth_age.round(2)
  end
  def on_mercury
    (@earth_age/0.2408467).round(2)
  end
  def on_venus
    (@earth_age/0.61519726).round(2)
  end
  def on_mars
    (@earth_age/1.8808158).round(2)
  end
  def on_jupiter
    (@earth_age/11.862615).round(2)
  end
  def on_saturn
    (@earth_age/29.447498).round(2)
  end
  def on_uranus
    (@earth_age/84.016846).round(2)
  end
  def on_neptune
    (@earth_age/164.79132).round(2)
  end
end