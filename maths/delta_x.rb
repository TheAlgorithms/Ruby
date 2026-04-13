# frozen_string_literal: true

# Computes displacement from uniformly accelerated motion:
# delta_x = v0 * t + 0.5 * a * t^2
class DeltaX
  class << self
    def call(initial_velocity:, time:, acceleration:)
      (initial_velocity * time) + (0.5 * acceleration * time * time)
    end
  end
end
