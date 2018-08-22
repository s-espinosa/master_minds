require "minitest/autorun"
require "minitest/pride"
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_an_answer
    #not sure how to test a random sequence
  end

  def test_you_can_quit
    game = Game.new
    assert_nil game.quit
    #not sure how to test this either
  end

  def test_you_can_win
    game = Game.new
    #not sure how to test this either
  end

  def test_compare_answers
    #not sure how to test this either
  end

end
