class ComputeCompleteLapsTest < Minitest::Test
  def laps
    [
      Kart::Values::LapComplete.new(0, 38, "F.MASSA", 1, "1:02.825", "44,275"),
      Kart::Values::LapComplete.new(3, 38, "F.MASS", 2, "1:03.170", "44,073")
    ]
  end

  def test_computation
    service = Kart::Services::ComputeCompleteLaps.new
    result = laps.map {|l| service.process(l) }
    expected = [Kart::Values::NewLapComplete.new(0, 38, 1), Kart::Values::NewLapComplete.new(3, 38, 2)]
    assert result == expected
  end
end