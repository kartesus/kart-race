class BestLapsTest < Minitest::Test
  def lap0
    Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275")
  end

  def lap1
    Kart::Values::LapCompleted.new(2, 38, "F.MASSA", 2, "1:03.170", "44,073")
  end

  def lap2
      Kart::Values::LapCompleted.new(1, 38, "F.MASSA", 3, "1:02.769", "44,334")
  end

  def test_identifies_one
    best_laps = Kart::Services::BestLaps.new
    best_laps.process(lap0)

    achieved = [Kart::Values::BestLapAchieved.new(0, 38, 1, Kart::Values::Timestamp.new("1:02.825"))]

    assert best_laps.to_a == achieved
  end

  def test_identifies_all_best
    best_laps = Kart::Services::BestLaps.new
    best_laps.process(lap0)
    best_laps.process(lap1)
    best_laps.process(lap2)

    achieved = [ 
      Kart::Values::BestLapAchieved.new(0, 38, 1, Kart::Values::Timestamp.new("1:02.825")),
      Kart::Values::BestLapAchieved.new(1, 38, 3, Kart::Values::Timestamp.new("1:02.769"))
    ]

    assert best_laps.to_a == achieved
  end
end