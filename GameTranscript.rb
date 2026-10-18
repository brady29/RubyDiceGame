# Prints the game transcript.
class GameTranscript
  RULE = '=' * 60

  def initialize(output = $stdout)
    @output = output
  end

  def game_started(sides, dice_count, players)
    @output.puts RULE
    @output.puts "DROP DEAD: #{players.size} player(s), #{dice_count} dice with #{sides} sides each"
    @output.puts RULE
  end

  def round_started(round, players)
    @output.puts
    @output.puts "--- Round #{round} (#{players.size} player(s) still in) ---"
  end

  def turn_started(player)
    @output.puts "#{player}: #{dice_phrase(player.dice_left)}, #{player.total_score} points"
  end

  def roll_made(result)
    faces = result.faces.join(' ')
    if result.scored?
      @output.puts "  rolled [#{faces}] -> scores #{result.points}, rolls again"
    else
      @output.puts "  rolled [#{faces}] -> no score, loses #{dice_phrase(result.dice_removed)} " \
                   "(#{result.dice_left} left)"
    end
  end

  def turn_ended(turn)
    player = turn.player
    if player.alive?
      @output.puts "  #{player} earned #{turn.points} points this turn (total #{player.total_score})"
    else
      @output.puts "  #{player} DROPS DEAD with #{player.total_score} points"
    end
  end

  def game_ended(players, winners)
    @output.puts
    @output.puts RULE
    @output.puts 'FINAL SCORES'
    players.sort_by { |player| -player.total_score }.each do |player|
      @output.puts format('  %<name>-12s %<score>d', name: player.name, score: player.total_score)
    end
    names = winners.map(&:name).join(', ')
    @output.puts winners.size > 1 ? "Tie between: #{names}" : "Winner: #{names}"
    @output.puts RULE
  end

  private

  def dice_phrase(count)
    "#{count} #{count == 1 ? 'die' : 'dice'}"
  end
end
