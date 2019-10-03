class DriverInfoTest < Minitest::Test
  def laps
    [
      Kart::Values::LapComplete.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275"),
      Kart::Values::LapComplete.new(3, 38, "F.MASS", 2, "1:03.170", "44,073")
    ]
  end

  def test_identifies_one
    service = Kart::Services::GatherDriverInfo.new
    result = service.process(laps[0])

    expected = Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA")

    assert result == expected
    assert result.frozen?
  end

  def test_identifies_first_id
    service = Kart::Services::GatherDriverInfo.new
    result = laps.map{|l| service.process(l) }

    expected = [Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA"), nil]

    assert result == expected
  end
end