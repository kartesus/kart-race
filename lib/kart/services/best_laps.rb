module Kart::Services
  class BestLaps
    include Enumerable

    def initialize
      @best_laps = {}
      @data = []
    end

    def process(lap)
      record_new_best_lap(lap) unless @best_laps.has_key?(lap.id)
      record_new_best_lap(lap) if @best_laps[lap.id] > lap.time
    end

    def each(&block)
      @data.each(&block)
    end

    def | other
      @data | other.to_a
    end

    private
    def record_new_best_lap(lap)
      @best_laps[lap.id] = lap.time
      @data.push(Kart::Values::BestLapAchieved.new(lap.t, lap.id, lap.lap, lap.time).freeze)
    end
  end
end