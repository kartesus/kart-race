module Kart::Services
  class RaceClock
    def initialize
      @race_finished = false
      @drivers_time = {}
    end

    def process(lap)
      @drivers_time[lap.id] ||= {lap: lap.id, time: Kart::Values::Timestamp.new("0:00.000")}
      @drivers_time[lap.id][:time] += lap.time
      if (not @race_finished) && lap.lap == 4
        @race_finished = true
        Kart::Values::RaceFinished.new(lap.t, @drivers_time[lap.id][:time])
      end
    end
  end
end