module Kart::Services
  class Scoring
    def initialize(events)
      @events = events
      @drivers = {}
      @race = {}
    end

    def compute(*services)
      @events.each do |event|
        services.each do |s| 
          update_race s.process(event)
        end
      end

      { drivers: @drivers.values, 
        race: @race }
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
        when Kart::Values::NewLapComplete
          @drivers[event.id] ||= {}
          @drivers[event.id].merge!(id: event.id, complete_laps: event.lap)
        when Kart::Values::AverageSpeedUpdated
          @drivers[event.id] ||= {}
          @drivers[event.id].merge!(id: event.id, average_speed: event.speed)
        when Kart::Values::PositionUpdated
          @drivers[event.id] ||= {}
          @drivers[event.id].merge!(id: event.id, position: event.position)
        when Kart::Values::BestLapOfRaceAchieved
          @race[:best_lap] = event.time
        when Kart::Values::RaceFinished
          @race[:time] = event.time
        end
    end

  end
end