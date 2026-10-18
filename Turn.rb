# One player's turn: roll until a 2 or 5 shows up.
class Turn
  attr_reader :player

  def initialize(player)
    @player = player
    @rolls = []
  end

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

  def points
    @rolls.sum(&:points)
  end
end
