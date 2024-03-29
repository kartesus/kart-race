GOOD_FILE = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "data", "oneliner.txt"))
CORRUPT_FILE = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "data", "corrupt.txt"))
NOT_FOUND_FILE = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "data", "notfound.txt"))

class RaceEventsRepositoryTest < Minitest::Test
  def test_from_file
    adapter = Kart::Repositories::RaceEventsRepository.from_file(GOOD_FILE)
    assert adapter.kind_of?(Kart::Repositories::RaceEventsRepository::FileAdapter)
  end

  def test_from_file_not_found
    assert_raises(Kart::Repositories::RaceEventsRepository::FileAdapter::NotFound) do
      Kart::Repositories::RaceEventsRepository.from_file(NOT_FOUND_FILE)
    end
  end

  def test_from_file_corrupt
    assert_raises(Kart::Repositories::RaceEventsRepository::CorruptData) do
      Kart::Repositories::RaceEventsRepository.from_file(CORRUPT_FILE)
    end
  end
end

class LogRepositoryFileAdapterTest < Minitest::Test
  def setup
    @adapter = Kart::Repositories::RaceEventsRepository.from_file(GOOD_FILE)
  end

  def test_enumerable
    assert @adapter.kind_of?(Enumerable)
  end

  def test_produces_complete_laps
    lap = Kart::Values::LapComplete.new(0, "038", "F.MASSA", "1", "1:02.852", "44,275")
    assert @adapter.first == lap
  end

  def test_frozen
    assert @adapter.first.frozen?
  end
end