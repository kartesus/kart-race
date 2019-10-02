class BestLapsTest < Minitest::Test

  def test_identifies_none
    assert Kart::Services::BestLaps.from([]) == []
  end

  def test_identifies_one
    log = [Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275")]
    achieved = [Kart::Values::BestLapAchieved.new(0, 38, 1, Kart::Values::Timestamp.new("1:02.825"))]
    assert Kart::Services::BestLaps.from(log) == achieved
  end

  def test_identifies_all_best
    log = [
      Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275"),
      Kart::Values::LapCompleted.new(2, 38, "F.MASSA", 2, "1:03.170", "44,073"),
      Kart::Values::LapCompleted.new(1, 38, "F.MASSA", 3, "1:02.769", "44,334"),
    ]
    achieved = [
      Kart::Values::BestLapAchieved.new(0, 38, 1, Kart::Values::Timestamp.new("1:02.825")),
      Kart::Values::BestLapAchieved.new(1, 38, 3, Kart::Values::Timestamp.new("1:02.769"))
    ]
    assert Kart::Services::BestLaps.from(log) == achieved
  end
end