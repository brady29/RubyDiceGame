# The dice a player still owns.
class DiceCup
  def initialize(dice_count, sides, random = Random.new)
    @dice = Array.new(dice_count) { Die.new(sides, random) }
  end

  def roll_all
    @dice.map(&:roll)
  end

  # Removes dice whose face matches the block; returns how many were removed.
  def remove_if
    before = @dice.size
    @dice.reject! { |die| yield die.value }
    before - @dice.size
  end

  def count
    @dice.size
  end

  def empty?
    @dice.empty?
  end
end
