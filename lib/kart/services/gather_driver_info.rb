module Kart::Services
  class GatherDriverInfo
    include Enumerable

    def initialize
      @found = []
    end

    def process(lap)
      return if @found.include? lap.id
      @found.push(lap.id)
      Kart::Values::NewDriverIdentified.new(lap.t, lap.id, lap.name).freeze
    end
  end
end