require 'bigdecimal'

module Kart::Values
  class LapCompleted
    attr_reader :t, :id, :name, :lap, :time, :speed

    def initialize(t, id, name, lap, time, speed)
      @t = t
      @id = id.to_i
      @name = name
      @lap = lap.to_i
      @time = Timestamp.new(time)
      @speed = BigDecimal(speed.sub(',','.'))
    end

    def == other
      @t == other.t &&
      @id == other.id &&
      @name == other.name &&
      @lap == other.lap &&
      @time == other.time &&
      @speed == other.speed
    end
  end

end