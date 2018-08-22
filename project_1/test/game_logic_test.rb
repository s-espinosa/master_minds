require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_logic'

class GameLogicTest < Minitest::Test
  def test_game_logic_exists
    mastermind = GameLogic.new
    assert_instance_of(GameLogic, mastermind)
  end

  def test_computer_random_generator_class
    mastermind = GameLogic.new
    mastermind.computer_sequence = []
    mastermind.computer_random_generator
    array_length = mastermind.computer_sequence.length
    assert_equal Array, mastermind.computer_sequence.class
    refute_equal (array_length + 1), mastermind.computer_sequence.length
  end

  def test_introductory_text
    mastermind = GameLogic.new
    assert_equal String, mastermind.introductory_text.class
  end

  def test_instructions
    mastermind = GameLogic.new
    assert_equal String, mastermind.instructions.class
  end

  def test_game_play_instructions
    mastermind = GameLogic.new
    assert_equal String, mastermind.game_play_instructions.class
  end

  def try_again_text
    mastermind = GameLogic.new
    assert_equal String, msatermind.try_again_text.class
  end

  def just_give_up
    mastermind = GameLogic.new
    assert_equal String, mastermind.try_again_text.class
  end

  def test_invalid_guess?
    mastermind = GameLogic.new
    mastermind.computer_sequence = ["r", "g", "b", "y"]
    assert_equal true, mastermind.invalid_guess?("rgbyh")
    assert_equal true, mastermind.invalid_guess?("rgb")
    assert_equal false, mastermind.invalid_guess?("rgbb")
  end

  def test_exact_elements
    mastermind = GameLogic.new
    mastermind.computer_sequence = ["r", "g", "b", "y"]
    mastermind.player_guess = ["r", "g", "g", "y"]
    assert_equal 3, mastermind.exact_elements
    mastermind.computer_sequence = ["r", "r", "b", "y"]
    mastermind.player_guess = ["g", "g", "g", "y"]
    assert_equal 1, mastermind.exact_elements
  end

  def test_guess_counter
    mastermind = GameLogic.new
    mastermind.computer_sequence = ["r", "b", "b", "y"]
    mastermind.player_guess = ["r", "g", "g", "y"]
    mastermind.did_player_win?
    assert_equal 1, mastermind.guess_counter
    mastermind.computer_sequence = ["r", "g", "b", "y"]
    mastermind.player_guess = ["r", "g", "g", "y"]
    assert_equal 2, mastermind.guess_counter
    mastermind.computer_sequence = ["r", "g", "g", "y"]
    mastermind.player_guess = ["r", "g", "g", "y"]
    mastermind.did_player_win?
    assert_equal 2, mastermind.guess_counter
  end

  def test_incorrect_guess_statement
    mastermind = GameLogic.new
    mastermind.computer_sequence = ["r", "b", "b", "y"]
    mastermind.player_guess = ["r", "g", "g", "y"]
    mastermind.did_player_win?
    mastermind.guess_counter
    assert_equal "rggy has 2 of the correct elements with 2 in the correct positions. Number of guesses: 1.", mastermind.incorrect_guess_statement
    mastermind.computer_sequence = ["b", "b", "b", "b"]
    mastermind.player_guess = ["r", "g", "g", "y"]
    mastermind.did_player_win?
    mastermind.guess_counter
    assert_equal "rggy has 0 of the correct elements with 0 in the correct positions. Number of guesses: 2.", mastermind.incorrect_guess_statement
  end

  def test_did_player_win?
    mastermind = GameLogic.new
    mastermind.computer_sequence = ["r", "g", "b", "y"]
    mastermind.player_guess = ["r", "y", "b", "y"]
    assert_equal false, mastermind.did_player_win?
    mastermind.computer_sequence = ["r", "g", "b", "y"]
    mastermind.player_guess = ["r", "y", "b", "y"]
    assert true, mastermind.did_player_win?
  end

  def test_time_spent_playing
    mastermind = GameLogic.new
    mastermind.start_time
    sleep(1)
    assert_equal "It took you 0 minutes and 1 seconds to finish!", mastermind.time_spent_playing
  end

  def test_win_state_text
    mastermind = GameLogic.new
    mastermind.computer_sequence = ["r", "g", "b", "y"]
    mastermind.player_guess = ["r", "y", "b", "y"]
    mastermind.guess_counter
    assert_equal "You guessed correctly! It only took you... uh... 1 guesses.", mastermind.win_state_text
  end

  def test_play_again_text
    mastermind = GameLogic.new
    assert_equal String, mastermind.play_again_text.class
  end

  def test_reset_computer_input
    mastermind = GameLogic.new
    mastermind.computer_sequence = []
    mastermind.computer_random_generator
    assert_equal true, mastermind.reset_computer_input.empty?
  end
end
