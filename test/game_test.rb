require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_can_translate_player_input
    game = Game.new

    result1 = game.translate('QUIT')
    result2 = game.translate('C')
    result3 = game.translate('INSTRUCTIONS!!!!')
    result4 = game.translate('#PLAY  !!!')
    result5 = game.translate('(R)ed; (B)lue; (B)lue; (G)reen')
    result6 = game.translate('yellowyellowredgreen')

    assert_equal 'q', result1
    assert_equal 'c', result2
    assert_equal 'i', result3
    assert_equal 'p', result4
    assert_equal 'rbbg', result5
    assert_equal 'yyrg', result6
  end

  def test_it_can_quit
    game = Game.new

    assert_nil game.quit
  end

  def test_it_can_turn_a_user_response_into_an_action
    game = Game.new

    assert_equal menu('q'), quit
    assert_equal menu('i'), instructions
    assert_equal menu('c'), cheat
    assert_equal menu('p'), start
    assert('hello'), not_valid
  end
end
