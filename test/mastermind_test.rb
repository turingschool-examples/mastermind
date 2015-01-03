require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'
require_relative '../lib/printer'

class MastermindTest < Minitest::Test
  attr_reader :evaluator

  def setup
    printer    = Printer.new # only needed to pass to evaluator
    @evaluator = Mastermind.new(printer)
  end

  def test_it_exists
    assert Mastermind
  end

  def test_it_starts_a_game
    assert evaluator.sequence.nil?
    evaluator.execute 'p'
    assert evaluator.sequence.is_a? String
    evaluator.sequence.chars.each do |char|
      assert ["R", "G", "B", "Y"].include? char
    end
  end

  def test_it_validates_menu_input
    evaluator.execute 'r'
    message = evaluator.execute 'r'
    assert message.include? 'Invalid'
  end

  def test_read_instructions
    evaluator.execute 'i'
    message, signal = evaluator.execute 'i'
    assert message.include? 'How to Play MASTERMIND'
    assert_equal signal, :continue
  end

  def test_guess_is_correct
    evaluator.execute 'p'
    evaluator.sequence = "RGBY"
    message, signal = evaluator.execute "RGBY"
    assert message.include? "You won!"
    assert_equal signal, :continue
  end

  def test_quit_game_completely
    message, signal = evaluator.execute 'q'
    assert message.include? 'Thanks for playing!'
    assert_equal signal, :stop
  end

  def test_quit_game_round
    evaluator.execute 'p'
    message, signal = evaluator.execute 'q'
    assert message.include? 'You ended the round.'
    assert_equal signal, :continue
  end
end
