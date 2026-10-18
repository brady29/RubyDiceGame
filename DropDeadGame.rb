# Tracks the active players and turn order.
class DropDeadGame
  attr_reader :players

  def initialize(players)
    raise ArgumentError, 'the game needs at least one player' if players.empty?

    @players = players.dup.freeze
    @active_players = players.dup
    @current_index = 0
  end

  def active_players
    @active_players.dup
  end

  def current_player
    @active_players[@current_index]
  end

  def over?
    @active_players.empty?
  end

  # Plays the current player's turn and drops them if they have no dice left.
  def play_next_turn(&on_roll)
    raise 'the game is over' if over?

    turn = Turn.new(current_player)
    turn.play(&on_roll)
    advance_after(turn.player)
    turn
  end

  # Players with the highest score (several on a tie).
  def winners
    best = @players.map(&:total_score).max
    @players.select { |player| player.total_score == best }
  end

  private

  def advance_after(player)
    if player.alive?
      @current_index += 1
    else
      @active_players.delete_at(@current_index)
    end
    @current_index = 0 if @current_index >= @active_players.size
  end
end
