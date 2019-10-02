class DriversTest < Minitest::Test

  def test_identifies_none
    assert Kart::Services::Drivers.from([]) == []
  end

  def test_identifies_one
    log = [Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275")]
    identified = [Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA")]
    assert Kart::Services::Drivers.from(log) == identified
  end

  def test_identifies_first
    log = [
      Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275"),
      Kart::Values::LapCompleted.new(1, 38, "F.MASSA", 2, "1:03.170", "44,073")
    ]
    identified = [Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA")]
    assert Kart::Services::Drivers.from(log) == identified
  end

  def test_identifies_many
    log = [
      Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275"),
      Kart::Values::LapCompleted.new(1, 33, "R.BARRICHELLO", 1, "1:04.352", "43,243"),
      Kart::Values::LapCompleted.new(2, 2, "K.RAIKKONEN", 1, "1:04.108", "43,408"),
      Kart::Values::LapCompleted.new(3, 38, "F.MASSA", 2, "1:03.170", "44,073")
    ]
    identified = [
      Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA"),
      Kart::Values::NewDriverIdentified.new(1, 33, "R.BARRICHELLO"),
      Kart::Values::NewDriverIdentified.new(2, 2, "K.RAIKKONEN")
    ]
    assert Kart::Services::Drivers.from(log) == identified
  end
end