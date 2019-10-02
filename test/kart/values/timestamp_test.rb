class TimestampTest < Minitest::Test
  def setup
    @timestamp = Kart::Values::Timestamp.new("1:02.852")
  end

  def test_timestamp
    assert @timestamp.to_s == "1:02.852"
    assert @timestamp.in_milliseconds == 62852
  end
end