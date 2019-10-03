module Kart::Services
  class Scoring
    def initialize(events)
      @events = events
      @drivers = {}
    end

    def compute(*services)
      @events.each do |event|
        services.each do |s| 
          update_race s.process(event)
        end
      end

      {drivers: @drivers.values}
    end

    private 
    def update_race(event)
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
end