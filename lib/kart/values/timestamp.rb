module Kart::Values
  class Timestamp
    include Comparable

    attr_reader :to_s, :in_milliseconds

    def initialize(time)
      (m, s, ms) = time.match(/(\d):(\d{2}).(\d{3})/).to_a.drop(1).map(&:to_i)

      @to_s = time      
      @in_milliseconds = (m * 60 * 1000) + (s * 1000) + ms
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