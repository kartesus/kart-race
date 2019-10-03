module Kart::Services
  class ComputeBestLapOfRace
    def initialize
      @best = Kart::Values::Timestamp.new("200:01.100")
    end

    def process(lap)
      if lap.time < @best
        @best = lap.time
        Kart::Values::BestLapOfRaceAchieved.new(lap.t, lap.time).freeze
      end
    end
  end
end