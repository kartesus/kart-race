class DriverInfoTest < Minitest::Test
  def laps
    [
      Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275"),
      Kart::Values::LapCompleted.new(3, 38, "F.MASS", 2, "1:03.170", "44,073")
    ]
  end

  def test_identifies_one
    drivers = Kart::Services::GatherDriverInfo.new
    result = drivers.process(laps[0])

    identified = Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA")

    assert result == identified
    assert result.frozen?
  end

  def test_identifies_first_id
    drivers = Kart::Services::GatherDriverInfo.new
    result = [drivers.process(laps[0]), drivers.process(laps[1])]

    identified = [Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA"), nil]

    assert result == identified
  end
end