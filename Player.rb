# A player with a cup of dice and a score sheet.
class Player
  attr_reader :name, :score_sheet

  def initialize(name, dice_cup, evaluator = RollEvaluator.new)
    @name = name
    @dice_cup = dice_cup
    @score_sheet = ScoreSheet.new
    @evaluator = evaluator
  end

  # Rolls once, records any points, and removes 2s and 5s.
  def roll
    faces = @dice_cup.roll_all
    points = @evaluator.score(faces)
    @score_sheet.record(points) if points.positive?
    removed = @dice_cup.remove_if { |face| @evaluator.dead_face?(face) }
    RollResult.new(faces, points, removed, @dice_cup.count)
  end

  def dice_left
    @dice_cup.count
  end

  def alive?
    !@dice_cup.empty?
  end

  def total_score
    @score_sheet.total
  end

  def to_s
    @name
  end
end
