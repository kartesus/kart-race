class DriverInfoTest < Minitest::Test
  def lap0
    Kart::Values::LapCompleted.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275")
  end

  def lap1
    Kart::Values::LapCompleted.new(1, 33, "R.BARRICHELLO", 1, "1:04.352", "43,243")
  end

  def lap2
    Kart::Values::LapCompleted.new(2, 2, "K.RAIKKONEN", 1, "1:04.108", "43,408")
  end

  def lap3
    Kart::Values::LapCompleted.new(3, 38, "F.MASS", 2, "1:03.170", "44,073")
  end

  def test_identifies_one
    drivers = Kart::Services::DriverInfo.new
    drivers.process(lap0)

    identified = [Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA")]

    assert drivers.to_a == identified
  end

  def test_identifies_first_id
    drivers = Kart::Services::DriverInfo.new
    drivers.process(lap0)
    drivers.process(lap3)

    identified = [Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA")]

    assert drivers.to_a == identified
  end

  def test_identifies_many
    drivers = Kart::Services::DriverInfo.new
    drivers.process(lap0)
    drivers.process(lap1)
    drivers.process(lap2)
    drivers.process(lap3)

    identified = [
      Kart::Values::NewDriverIdentified.new(0, 38, "F.MASSA"),
      Kart::Values::NewDriverIdentified.new(1, 33, "R.BARRICHELLO"),
      Kart::Values::NewDriverIdentified.new(2, 2, "K.RAIKKONEN")
    ]

    assert drivers.to_a == identified
  end
end