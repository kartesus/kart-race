module Kart::Values
  NewDriverIdentified = Struct.new(:t, :id, :name)
  BestLapAchieved = Struct.new(:t, :id, :lap, :time)
end

require_relative 'values/timestamp'
require_relative 'values/lap_completed'