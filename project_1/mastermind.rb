require "./lib/game_logic"

mastermind = GameLogic.new

mastermind.player_path_decider

loop do
  mastermind.computer_random_generator
  mastermind.get_player_guess
  mastermind.guess_counter
  puts mastermind.incorrect_guess_statement
  mastermind.win_state
end
