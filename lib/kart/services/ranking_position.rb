module Kart::Services
  class RankingPosition
    Driver = Struct.new(:id, :lap)

    def initialize
      @drivers = []
    end

    def process(lap)
      driver = Driver.new(lap.id, lap.lap)
      position = @drivers
        .delete_if{|d| d.id == driver.id }
        .select{|d| d.lap >= driver.lap }
        .count + 1
      @drivers << driver
      Kart::Values::PositionUpdated.new(lap.t, lap.id, position).freeze
    end
  end
end