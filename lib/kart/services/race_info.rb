module Kart::Services
  class RaceInfo
    def initialize
      @drivers = {}
    end

    def process(events)
      events.each do |event|
        case event
        when Kart::Values::NewDriverIdentified
          @drivers[event.id] ||= {}
          @drivers[event.id].merge!(id: event.id, name: event.name)
        when Kart::Values::BestLapAchieved
          @drivers[event.id] ||= {}
          @drivers[event.id].merge!(id: event.id, best_lap: event.time)
        end
      end
    end

    def to_h
      {drivers: @drivers.values}.freeze
    end
  end
end