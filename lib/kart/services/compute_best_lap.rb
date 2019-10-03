module Kart::Services
  class ComputeBestLap
    def initialize
      @best_laps = {}
    end

    def process(lap)
      return record_best_lap(lap) unless @best_laps.has_key?(lap.id)
      return record_best_lap(lap) if @best_laps[lap.id] > lap.time
    end

    private
    def record_best_lap(lap)
      @best_laps[lap.id] = lap.time
      Kart::Values::BestLapAchieved.new(lap.t, lap.id, lap.time).freeze
    end
  end
end