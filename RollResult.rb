# The outcome of a single roll.
class RollResult
  attr_reader :faces, :points, :dice_removed, :dice_left

  def initialize(faces, points, dice_removed, dice_left)
    @faces = faces.dup.freeze
    @points = points
    @dice_removed = dice_removed
    @dice_left = dice_left
    freeze
  end

  def scored?
    @dice_removed.zero?
  end

  def dropped_dead?
    @dice_left.zero?
  end
end
