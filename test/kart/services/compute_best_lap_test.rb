class ComputeBestLapsTest < Minitest::Test
  def laps
    [
      Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275"),
      Kart::Values::LapCompleted.new(2, 38, "F.MASSA", 2, "1:03.170", "44,073"),
      Kart::Values::LapCompleted.new(1, 38, "F.MASSA", 3, "1:02.769", "44,334")
    ]
  end

  def test_identifies_one
    best_laps = Kart::Services::ComputeBestLap.new
    result = best_laps.process(laps[0])

    expected = Kart::Values::BestLapAchieved.new(0, 38, Kart::Values::Timestamp.new("1:02.825"))

    assert result == expected
    assert result.frozen?
  end

  def test_identifies_all_best
    best_laps = Kart::Services::ComputeBestLap.new

    result = [
      best_laps.process(laps[0]),
      best_laps.process(laps[1]),
      best_laps.process(laps[2])
    ]

    expected = [ 
      Kart::Values::BestLapAchieved.new(0, 38, Kart::Values::Timestamp.new("1:02.825")),
      nil,
      Kart::Values::BestLapAchieved.new(1, 38, Kart::Values::Timestamp.new("1:02.769"))
    ]

    assert result == expected
  end
end