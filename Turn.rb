# Plays one player's turn: keep rolling until a 2 or a 5 shows up.
class Turn
  attr_reader :player

  def initialize(player)
    @player = player
    @rolls = []
  end

  # Rolls until a roll removes dice, yielding each RollResult as it happens.
  # Returns every RollResult of the turn.
  def play
    loop do
      result = @player.roll
      @rolls << result
      yield result if block_given?
      break unless result.scored?
    end
    rolls
  end

  def rolls
    @rolls.dup
  end

  # Points the player earned during this turn.
  def points
    @rolls.sum(&:points)
  end
end
