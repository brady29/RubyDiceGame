# Plays a full Drop Dead game automatically and prints a transcript.
class AutoDropDead
  MIN_DICE = 2
  MIN_PLAYERS = 1

  def initialize(output = $stdout, random = Random.new)
    @transcript = GameTranscript.new(output)
    @random = random
  end

  def play_game(sides, dice_count, player_count)
    validate(sides, dice_count, player_count)
    game = DropDeadGame.new(create_players(sides, dice_count, player_count))
    @transcript.game_started(sides, dice_count, game.players)
    play_rounds(game)
    winners = game.winners
    @transcript.game_ended(game.players, winners)
    winners
  end

  private

  def validate(sides, dice_count, player_count)
    raise ArgumentError, "sides must be at least #{Die::MIN_SIDES}" if sides < Die::MIN_SIDES
    raise ArgumentError, "dice_count must be at least #{MIN_DICE}" if dice_count < MIN_DICE
    raise ArgumentError, "player_count must be at least #{MIN_PLAYERS}" if player_count < MIN_PLAYERS
  end

  def create_players(sides, dice_count, player_count)
    (1..player_count).map do |number|
      Player.new("Player #{number}", DiceCup.new(dice_count, sides, @random))
    end
  end

  def play_rounds(game)
    round = 0
    until game.over?
      round += 1
      in_this_round = game.active_players.size
      @transcript.round_started(round, game.active_players)
      in_this_round.times { play_turn(game) }
    end
  end

  def play_turn(game)
    @transcript.turn_started(game.current_player)
    turn = game.play_next_turn { |result| @transcript.roll_made(result) }
    @transcript.turn_ended(turn)
  end
end
