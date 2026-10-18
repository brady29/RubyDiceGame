# The player's score paper.
class ScoreSheet
  def initialize
    @entries = []
  end

  def record(points)
    @entries << points
  end

  def total
    @entries.sum
  end

  def entries
    @entries.dup
  end
end
