class RaceInfoTest < Minitest::Test
  def events
    [
      Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275"),
      Kart::Values::LapCompleted.new(1, 38, "F.MASSA", 3, "1:02.769", "44,334"),
      Kart::Values::LapCompleted.new(2, 38, "F.MASSA", 2, "1:03.170", "44,073")
    ]
  end

  def test_collect_driver_info
    score = Kart::Services::Scoring.new(events)

    race = score.compute(Kart::Services::GatherDriverInfo.new)
    driver = race[:drivers].first

    assert (not driver.nil?)
    assert driver[:id] == 38
    assert driver[:name] == "F.MASSA"
  end

  def test_collect_best_lap
    score = Kart::Services::Scoring.new(events)

    race = score.compute(Kart::Services::ComputeBestLap.new)
    driver = race[:drivers].first

    assert (not driver.nil?)
    assert driver[:id] == 38
    assert driver[:best_lap] == Kart::Values::Timestamp.new("1:02.769")
  end
end