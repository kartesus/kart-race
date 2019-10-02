module Kart::Services
  class DriverInfo
    include Enumerable

    def initialize
      @found = []
      @data = []
    end

    def process(lap)
      return if @found.include? lap.id
      @found.push(lap.id)
      @data.push(Kart::Values::NewDriverIdentified.new(lap.t, lap.id, lap.name).freeze)
    end

    def each(&block)
      @data.each(&block)
    end

    def | other
      @data | other.to_a
    end
  end
end