require 'bigdecimal'

module Kart::Values
  class LapCompleted
    attr_reader :t, :id, :name, :lap, :time, :speed

    def initialize(t, id, name, lap, time, speed)
      @t = t
      @id = id.to_i
      @name = name
      @lap = lap.to_i
      @time = make_time(time)
      @speed = make_speed(speed)
    end

    private
    def make_time(time)
      (m, s, ms) = time.match(/(\d):(\d{2}).(\d{3})/).to_a.drop(1).map(&:to_i)
      (m * 60 * 1000) + (s * 1000) + ms
    end

    def make_speed(speed)
      BigDecimal(speed.sub(',','.'))
    end
  end
end