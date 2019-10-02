class LapCompletedTest < Minitest::Test
  def setup
    @lap = Kart::Values::LapCompleted.new(0, "038", "F.MASSA", "1", "1:02.852", "44,275")
  end

  def test_lap_completed
    assert @lap.t == 0
    assert @lap.id == 38
    assert @lap.name == "F.MASSA"
    assert @lap.lap == 1
    assert @lap.time == 62852
    assert @lap.speed == BigDecimal("44.275")
  end
end