module Kart::Services
  class AverageDriverSpeed
    def initialize
      @speeds = {}
    end

    def process(lap)
      if @speeds.has_key?(lap.id)
        @speeds[lap.id] = (@speeds[lap.id] + lap.speed) / 2
      else
        @speeds[lap.id] = lap.speed
      end
      Kart::Values::AverageSpeedUpdated.new(lap.t, lap.id, lap.speed).freeze
    end
  end
end