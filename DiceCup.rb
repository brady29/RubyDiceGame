# Holds the dice a player still owns and rolls them together.
class DiceCup
  def initialize(dice_count, sides, random = Random.new)
    @dice = Array.new(dice_count) { Die.new(sides, random) }
  end

  # Rolls every die in the cup and returns the faces that came up.
  def roll_all
    @dice.map(&:roll)
  end

  # Removes every die whose current face satisfies the block.
  # Returns the number of dice removed.
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
