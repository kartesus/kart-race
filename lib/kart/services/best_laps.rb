module Kart::Services::BestLaps
  def self.from(log)
    best_laps = {}
    data = []

    log.each do |lap|
      unless best_laps.has_key?(lap.id)
        best_laps[lap.id] = lap.time
        data.push(Kart::Values::BestLapAchieved.new(lap.t, lap.id, lap.lap, lap.time))
        next
      end

      if best_laps[lap.id] > lap.time
        best_laps[lap.id] = lap.time
        data.push(Kart::Values::BestLapAchieved.new(lap.t, lap.id, lap.lap, lap.time))
      end
    end

    data
  end
end