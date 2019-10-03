module Kart::Values
  class Timestamp
    include Comparable

    attr_reader :to_s, :in_milliseconds

    def initialize(time)
      (m, s, ms) = time.match(/(\d+):(\d+).(\d+)/).to_a.drop(1).map(&:to_i)

      @to_s = time      
      @in_milliseconds = (m * 60000) + (s * 1000) + ms
    end

    def + other
      ms = @in_milliseconds + other.in_milliseconds
      milliseconds = (ms % 1000).to_i
      seconds = ((ms % 60000) / 1000).to_i
      minutes = (ms / 60000).to_i
      Timestamp.new("#{minutes}:#{seconds}.#{milliseconds}")
    end

    def == other
      @in_milliseconds == other.in_milliseconds
    end

    def <=> other
      @in_milliseconds <=> other.in_milliseconds
    end

    def inspect
      @to_s
    end
  end
end