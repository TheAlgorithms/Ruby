# frozen_string_literal: true

# Free-fall helpers based on constant acceleration motion.
class FreeFallDistance
  STANDARD_GRAVITY = 9.80665

  class << self
    # d = 0.5 * g * t^2
    def distance(time:, gravity: STANDARD_GRAVITY)
      raise ArgumentError, 'time must be non-negative' if time.negative?
      raise ArgumentError, 'gravity must be positive' unless gravity.positive?

      0.5 * gravity * time * time
    end

    # t = sqrt(2d / g)
    def time(distance:, gravity: STANDARD_GRAVITY)
      raise ArgumentError, 'distance must be non-negative' if distance.negative?
      raise ArgumentError, 'gravity must be positive' unless gravity.positive?

      Math.sqrt((2.0 * distance) / gravity)
    end
  end
end
