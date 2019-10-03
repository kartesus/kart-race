module Kart::Repositories::RaceEventsRepository
  def self.from_file(filename)
    FileAdapter.new(filename)
  rescue Errno::ENOENT
    raise FileAdapter::NotFound
  end

  class CorruptData < StandardError;end

  class FileAdapter
    include Enumerable

    class NotFound < StandardError;end

    def initialize(filename)
      @laps = File.readlines(filename)
        .each
        .with_index
        .map do |line, i|
          data = line.match(/
          ^
          (\d{2}:\d{2}:\d{2}.\d{3})\s+
          (\d{3})[^[:alpha:]]+
          ([A-Z\.]+)\s+
          (\d{1})\s+
          (\d:\d{2}.\d{3})\s+
          (\d{2},\d{2,3})
          $
          /x).to_a.drop(2)

          raise CorruptData if data.empty?

          Kart::Values::LapComplete.new(*data.unshift(i)).freeze
        end
    end

    def each(&blk)
      @laps.each(&blk) 
    end
  end
end