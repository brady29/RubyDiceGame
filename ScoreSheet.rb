# The player's "paper": records the points from every scoring roll.
class ScoreSheet
  def initialize
    @entries = []
  end

  # Writes the points from one roll onto the sheet.
  def record(points)
    @entries << points
  end

  # Tallies all the points written on the sheet.
  def total
    @entries.sum
  end

  def entries
    @entries.dup
  end
end
