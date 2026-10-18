# A single die with a fixed number of sides.
class Die
  MIN_SIDES = 6

  attr_reader :sides, :value

  def initialize(sides, random = Random.new)
    raise ArgumentError, "a die needs at least #{MIN_SIDES} sides" if sides < MIN_SIDES

    @sides = sides
    @random = random
    @value = nil
  end

  def roll
    @value = @random.rand(1..@sides)
  end

  def to_s
    @value.nil? ? '-' : @value.to_s
  end
end
