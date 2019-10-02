GOOD_FILE = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "data", "oneliner.txt"))
CORRUPT_FILE = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "data", "corrupt.txt"))
NOT_FOUND_FILE = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "data", "notfound.txt"))

class LogRepositoryTest < Minitest::Test
  def test_from_file
    adapter = Kart::Repositories::LogRepository.from_file(GOOD_FILE)
    assert adapter.kind_of?(Kart::Repositories::LogRepository::FileAdapter)
  end

  def test_from_file_not_found
    assert_raises(Kart::Repositories::LogRepository::FileAdapter::NotFound) do
      Kart::Repositories::LogRepository.from_file(NOT_FOUND_FILE)
    end
  end

  def test_from_file_corrupt
    assert_raises(Kart::Repositories::LogRepository::CorruptData) do
      Kart::Repositories::LogRepository.from_file(CORRUPT_FILE)
    end
  end
end

class LogRepositoryFileAdapterTest < Minitest::Test
  def setup
    @adapter = Kart::Repositories::LogRepository.from_file(GOOD_FILE)
  end

  def test_enumerable
    assert @adapter.kind_of?(Enumerable)
  end

  def test_produces_completed_laps
    lap = @adapter.first
    assert lap.t  == 0
    assert lap.id == 38
    assert lap.name == "F.MASSA"
    assert lap.lap == 1
    assert lap.time == 62852
    assert lap.speed == BigDecimal('44.275')
  end
end