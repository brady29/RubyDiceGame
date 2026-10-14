# Drop Dead Dice Game (CIS*3260 Assignment 1)

A Ruby implementation of the extended Drop Dead dice game, played automatically by the computer.

## Rules implemented

- Each player starts with `n` dice (`n >= 2`), each with `s` sides (`s >= 6`).
- A player rolls all their dice. If no die shows a 2 or a 5, the sum is written on their score sheet and they roll again.
- If any die shows a 2 or a 5, the roll scores nothing, every die showing a 2 or 5 is removed, and play passes to the next player.
- A player with no dice left drops dead and leaves the game. The game ends when no players are left.
- The winner is the player with the most points (ties are reported).

## Running

```ruby
require_relative 'load_drop_dead'

AutoDropDead.new.play_game(6, 5, 3)   # sides, dice_count, player_count
```

`play_game` prints a transcript of every roll and returns the winning player(s).

## Files

| File | Class responsibility |
| --- | --- |
| `Die.rb` | Produces a random face for one die |
| `DiceCup.rb` | Manages the dice a player still owns |
| `RollEvaluator.rb` | Applies the scoring rules to a roll |
| `ScoreSheet.rb` | Records and totals a player's points |
| `RollResult.rb` | Describes the outcome of one roll |
| `Player.rb` | Represents a participant and performs their rolls |
| `Turn.rb` | Plays out one player's turn |
| `DropDeadGame.rb` | Tracks active players and turn order |
| `GameTranscript.rb` | Writes the game transcript |
| `AutoDropDead.rb` | Plays a full automatic game |
| `load_drop_dead.rb` | Loads every class file |

Sequence diagrams (SVG) and class descriptions are in [`docs/`](docs/).
