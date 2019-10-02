class RaceInfoTest < Minitest::Test
  def test_collect_driver_info
    race = Kart::Services::RaceInfo.new
    race.process([Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA")])

    driver = race.to_h[:drivers].first

    assert (not driver.nil?)
    assert driver[:id] == 38
    assert driver[:name] == "F.MASSA"
  end

  def test_collect_best_lap
    race = Kart::Services::RaceInfo.new
    race.process([Kart::Values::BestLapAchieved.new(0, 38, 1, Kart::Values::Timestamp.new("1:02.825"))])
    race.process([Kart::Values::BestLapAchieved.new(1, 38, 3, Kart::Values::Timestamp.new("1:02.769"))])

    driver = race.to_h[:drivers].first

    assert (not driver.nil?)
    assert driver[:id] == 38
    assert driver[:best_lap] == Kart::Values::Timestamp.new("1:02.769")
  end
end