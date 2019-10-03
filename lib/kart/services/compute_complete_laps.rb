module Kart::Services
  class ComputeCompleteLaps
    def process(lap)
      Kart::Values::NewLapComplete.new(lap.t, lap.id, lap.lap).freeze
    end
  end
end