class LapCompletedTest < Minitest::Test
  def setup
    @lap = Kart::Values::LapCompleted.new(0, "038", "F.MASSA", "1", "1:02.852", "44,275")
  end

  def test_id_was_processed
    assert_equal(@lap.id, 38)
  end

  def test_lap_was_processed
    assert_equal(@lap.lap, 1)
  end

  def test_time_was_processed
    assert_equal(@lap.time, 62852)
  end

  def test_speed_was_processed
    assert_equal(@lap.speed, BigDecimal("44.275"))
  end
end