module Kart::Values
  BestLapAchieved = Struct.new(:t, :id, :time)
  BestLapOfRaceAchieved = Struct.new(:t, :time)
  NewDriverIdentified = Struct.new(:t, :id, :name)
  NewLapComplete = Struct.new(:t, :id, :lap)
  AverageSpeedUpdated = Struct.new(:t, :id, :speed)
  PositionUpdated = Struct.new(:t, :id, :position)
  RaceFinished = Struct.new(:t, :time)
end

require_relative 'values/timestamp'
require_relative 'values/lap_complete'