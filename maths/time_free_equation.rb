# frozen_string_literal: true

# Solves forms of the kinematic equation:
# vf^2 - vi^2 = 2 * a * delta_x
class TimeFreeEquation
  class << self
    def displacement(initial_velocity:, final_velocity:, acceleration:)
      raise ZeroDivisionError, 'acceleration cannot be zero' if acceleration.zero?

      ((final_velocity**2) - (initial_velocity**2)) / (2.0 * acceleration)
    end

    def acceleration(initial_velocity:, final_velocity:, displacement:)
      raise ZeroDivisionError, 'displacement cannot be zero' if displacement.zero?

      ((final_velocity**2) - (initial_velocity**2)) / (2.0 * displacement)
    end

    def final_velocity(initial_velocity:, acceleration:, displacement:)
      value = (initial_velocity**2) + (2.0 * acceleration * displacement)
      raise DomainError, 'final velocity is not real for the provided inputs' if value.negative?

      Math.sqrt(value)
    end

    def initial_velocity(final_velocity:, acceleration:, displacement:)
      value = (final_velocity**2) - (2.0 * acceleration * displacement)
      raise DomainError, 'initial velocity is not real for the provided inputs' if value.negative?

      Math.sqrt(value)
    end
  end
end

class DomainError < StandardError; end
