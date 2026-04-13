# frozen_string_literal: true

# Free-fall helpers based on constant acceleration motion.
class FreeFallDistance
  class << self
    STANDARD_GRAVITY = 9.80665

    # d = 0.5 * g * t^2
    def distance(time:, gravity: STANDARD_GRAVITY)
      raise DomainError, 'time must be non-negative' if time.negative?
      raise DomainError, 'gravity must be positive' unless gravity.positive?

      0.5 * gravity * time * time
    end

    # t = sqrt(2d / g)
    def time(distance:, gravity: STANDARD_GRAVITY)
      raise DomainError, 'distance must be non-negative' if distance.negative?
      raise DomainError, 'gravity must be positive' unless gravity.positive?

      Math.sqrt((2.0 * distance) / gravity)
    end
  end
end

class DomainError < StandardError; end
