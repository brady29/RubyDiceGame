# Immutable record of what happened on one roll of a player's dice.
class RollResult
  attr_reader :faces, :points, :dice_removed, :dice_left

  def initialize(faces, points, dice_removed, dice_left)
    @faces = faces.dup.freeze
    @points = points
    @dice_removed = dice_removed
    @dice_left = dice_left
    freeze
  end

  # True when no 2 or 5 was rolled, so the player keeps rolling.
  def scored?
    @dice_removed.zero?
  end

  # True when the roll removed the player's last die.
  def dropped_dead?
    @dice_left.zero?
  end
end
